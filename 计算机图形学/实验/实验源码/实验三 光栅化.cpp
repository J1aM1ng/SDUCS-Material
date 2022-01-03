#include<iostream>
#include<algorithm>
#include<vector>
#include<cmath>
#include <GLUT/GLUT.h>
using namespace std;

const int polygon_num=2;
const int windowWidth=1024,windowHeight=1024;
//SSAA超采样的倍数
const int SSAA=10;
int yMax=0;


struct Point{
    int x,y;
};

struct AET{
    double x,dx,yMax;
    AET* next;
};

struct NET{
    // xMin：较低点的x值，而不是整条边x的最小值
    double yMax,xMin,dx;
    NET* next;
};

struct Color{
    // rgb
    GLfloat x,y,z;
};

vector<Point>Polygon[polygon_num];
vector<Color>PolyColor;
vector<double>PolyDepth;
double zBuffer[windowHeight+5][windowWidth+5],frameBuffer[windowHeight+5][windowWidth+5][5];

void xScanning(int idx){
    //初始化
    yMax=0;
    for(int i=0;i<Polygon[idx].size();i++)
        yMax=max(yMax,Polygon[idx][i].y*SSAA);
    AET *A_ET=new AET;
    A_ET->next=NULL;

    NET *N_ET[1024*SSAA+5];
    for(int i=0;i<=yMax;i++){
        N_ET[i]=new NET;
        N_ET[i]->next=NULL;
    }
    double Percentage=1.0/255;//rgb的值应该在0～1之间
    glColor3f(PolyColor[idx].x*Percentage,PolyColor[idx].y*Percentage,PolyColor[idx].z*Percentage);
    glBegin(GL_POINTS);

    //建立NET表
    int len=(int)Polygon[idx].size();
    for(int i=0;i<len;i++){
        int nxt=(i+1+len)%len;
        NET *tmp=new NET;
        // 下降边
        if(Polygon[idx][nxt].y<Polygon[idx][i].y){
            tmp->yMax=Polygon[idx][i].y*SSAA;
            tmp->xMin=Polygon[idx][nxt].x*SSAA;
            tmp->dx=(double)(Polygon[idx][i].x-Polygon[idx][nxt].x)/(double)(Polygon[idx][i].y-Polygon[idx][nxt].y);
            tmp->next=N_ET[Polygon[idx][nxt].y*SSAA]->next;
            N_ET[Polygon[idx][nxt].y*SSAA]->next=tmp;
        }else{// 上升边
            tmp->yMax=Polygon[idx][nxt].y*SSAA;
            tmp->xMin=Polygon[idx][i].x*SSAA;
            tmp->dx=(double)(Polygon[idx][i].x-Polygon[idx][nxt].x)/(double)(Polygon[idx][i].y-Polygon[idx][nxt].y);
            tmp->next=N_ET[Polygon[idx][i].y*SSAA]->next;
            N_ET[Polygon[idx][i].y*SSAA]->next=tmp;
        }

    }
    // 建立更新AET
    for(int i=0;i<=yMax;i++){
        // 更新已有的边
        AET* p=A_ET->next;
        while(p!=NULL){
            p->x=p->x+p->dx;
            p=p->next;
        }
        // 排序
        p=A_ET->next;
        AET* current=A_ET;
        current->next=NULL;
        while(p){
            while(current->next&&p->x>=current->next->x)current=current->next;
            AET* tmp=p->next;
            p->next=current->next;
            current->next=p;
            p=tmp;
            current=A_ET;
        }
        // 删除
        p=A_ET->next;
        current=A_ET;
        while(p){
            if(p->yMax==i)
                current->next=p->next;
            else
                current=current->next;
            p=current->next;
        }
        // 加入新的NET
        NET* np=N_ET[i]->next;
        p=A_ET;
        while(np){
            while(p->next&&np->xMin>=p->next->x)
                p=p->next;
            AET *tmp=new AET;
            tmp->x=np->xMin;
            tmp->yMax=np->yMax;
            tmp->dx=np->dx;
            tmp->next=p->next;
            p->next=tmp;
            np=np->next;
            p=A_ET;
        }
        // 颜色配对
        p=A_ET->next;
        while(p&&p->next){
            for(double j=p->x;j<=p->next->x;j++){
                int xx=(int)(ceil(j/(double)SSAA));
                int yy=(int)(ceil((double)i/(double)SSAA));
                // 需提前算出来，否则可能会提早被覆盖为0
                int x1=(int)(ceil((p->x)/(double)SSAA));
                int x2=(int)(ceil((p->next->x)/(double)SSAA));
                // 为了更好地过渡，需要判断边界情况
                if(PolyDepth[idx]>zBuffer[xx][yy]){
                    zBuffer[xx][yy]=PolyDepth[idx];
                    for(int k=0;k<=2;k++){
                        // 仅能减轻后画的depth大的情况（若小，也可以处理，但需重新修改上层的颜色，较浪费时间）
                        if(xx==x1||xx==x2)frameBuffer[xx][yy][k]/=(SSAA*SSAA);
                        else frameBuffer[xx][yy][k]=0;
                    }
                    frameBuffer[xx][yy][0]+=PolyColor[idx].x*Percentage;
                    frameBuffer[xx][yy][1]+=PolyColor[idx].y*Percentage;
                    frameBuffer[xx][yy][2]+=PolyColor[idx].z*Percentage;
                }
                else if(PolyDepth[idx]==zBuffer[xx][yy]){
                    frameBuffer[xx][yy][0]+=PolyColor[idx].x*Percentage;
                    frameBuffer[xx][yy][1]+=PolyColor[idx].y*Percentage;
                    frameBuffer[xx][yy][2]+=PolyColor[idx].z*Percentage;
                }
            }
            p=p->next->next;
        }
    }
    glEnd();
}
void setPolygon(){
    Point a1,a2,a3,b1,b2,b3;
    a1.x=550;a1.y=800;
    a2.x=100;a2.y=500;
    a3.x=300;a3.y=100;
    b1.x=400;b1.y=500;
    b2.x=200;b2.y=100;
    b3.x=400;b3.y=200;
    Polygon[0].push_back(a1);
    Polygon[0].push_back(a2);
    Polygon[0].push_back(a3);
    Polygon[1].push_back(b1);
    Polygon[1].push_back(b2);
    Polygon[1].push_back(b3);
    PolyColor.push_back({244,208,0});
    PolyColor.push_back({229,131,8});
    PolyDepth.push_back(10);
    PolyDepth.push_back(50);
}
void display(){
    glClear(GL_COLOR_BUFFER_BIT);
    for(int i=0;i<polygon_num;i++)xScanning(i);
    glBegin(GL_POINTS);
    for(int i=0;i<=windowWidth;i++){
        for(int j=0;j<=windowHeight;j++){
            glColor3f(frameBuffer[i][j][0]/(SSAA*SSAA),frameBuffer[i][j][1]/(SSAA*SSAA),frameBuffer[i][j][2]/(SSAA*SSAA));
            glVertex2i(i,j);
        }
    }
    glEnd();
    glFlush();
}
void init(){
    // 将屏幕上的所有像素点置为预置色
    glClear(GL_COLOR_BUFFER_BIT);
    gluOrtho2D(0,windowWidth,0,windowHeight);
    glMatrixMode(GL_MODELVIEW);
    setPolygon();
}
int main(int argc,char* argv[]) {
    glutInit(&argc,argv);
    glutInitDisplayMode(GLUT_RGB | GLUT_SINGLE);
    glutInitWindowPosition(windowWidth,windowHeight);
    glutInitWindowSize(windowWidth,windowHeight);
    glutCreateWindow("expe3-Rasterize");
    init();
    glutDisplayFunc(display);
    glutMainLoop();
    return 0;
}

#include <iostream>
#include <vector>
#include <set>
#include <cmath>
#include <fstream>
#include "GLUT/glut.h"
#define GL_SILENCE_DEPRECATION;
using namespace std;

int numofvertex = 0;
int numofface = 0;
int numofline = 0;

int WIDTH = 600;
int HEIGHT = 600;
float maxx = -1;
float maxy = -1;
float maxz = -1;
float minx = 1;
float miny = 1;
float minz = 1;

GLfloat ShootPosition[] = { 0,0,0 };
GLfloat ShootDirect[] = { 0,0,0 };

float scale = 5.5;
float px;
float py;
float theta1 = 0;
float theta2 = 0;
float radius = 0;

int displaystate = 0;
float PI = 3.1415926;

struct vertex;
struct face;
struct halfedge;
struct he_face;
struct normalVec;
struct iedge;
vertex* vertexs;
face* faces;
he_face** hefaces;
normalVec* normalvectors;
iedge** iedges;

struct halfedge {
    halfedge* next;  //箭头指向方向的下一条边
    halfedge* opposite;  //对面的边
    int end;  //边的终点顶点
    he_face* face;  //本半边所在面

    bool visit;

    halfedge() {
        next = NULL;
        opposite = NULL;
        end = -1;
        face = NULL;
        visit = false;
    }
};

struct vertex {

    //位置坐标
    float x;
    float y;
    float z;

    //归一化颜色
    float rn;
    float gn;
    float bn;

    halfedge* edge;  //从这个顶点出发的半边

    bool visit;

    vertex() {
        visit = false;
    }

    vertex(float a, float b, float c) {
        x = a;
        y = b;
        z = c;
        edge = NULL;
        visit = false;
    }

    //为了使用set<vertex>
    bool operator<(const vertex b)const{
        return true;
    }
};

struct normalVec {

    float x;
    float y;
    float z;
    normalVec() {

    }
    normalVec(float a, float b, float c) {
        x = a;
        y = b;
        z = c;
    }
};

struct he_face {
    halfedge* edge; //只需要保存一个半边，一个半边可以不断查找下一个半边以检索到面中所有的顶点和半边

    bool visit;
    he_face() {
        edge = NULL;
        visit = false;
    }
};

struct face {

    int numofv;
    int* vertexs;
    face() {

    }
    face(int nv) {
        numofv = nv;
        vertexs = new int[nv];
    }
};

struct iedge {
    //存储半边的额外信息
    int start;
    int middle; //中点的编号
    halfedge* he;
    iedge* next;
    iedge() {
        start = -1;
        he = NULL;
        next = NULL;
        middle = -1;
    }
};

void readFile() {
    char data[100];
    ifstream infile;
    infile.open("./lib/bunny.off");
    infile >> data;
    infile >> numofvertex;
    infile >> numofface;
    infile >> numofline;
    vertexs = new vertex[numofvertex];
    faces = new face[numofface];
    int vnum = 0;
    int fnum = 0;

    while (vnum < numofvertex) {
        float x;
        float y;
        float z;
        infile >> x;
        infile >> y;
        infile >> z;
        vertexs[vnum] = vertex(x, y, z);
        vnum++;
    }

    while (fnum<numofface)
    {
        int numofv;
        infile >> numofv;
        face f = face(numofv);
        for (int i = 0; i < numofv; i++)
        {
            int v;
            infile >> v;
            f.vertexs[i] = v;
        }
        faces[fnum] = f;
        fnum++;
    }
    infile.close();
}


int getMiddle(int start, int end, iedge** iedges) {
    iedge* temp = iedges[start];
    while (temp != NULL) {
        if (temp->he->end == end) {
            break;
        }
        temp = temp->next;
    }
    if (temp == NULL) {
        return -1;
    }
    else {
        return temp->middle;
    }
}

halfedge* getHalfEdge(int start, int end, iedge** iedges) {
    iedge* temp = iedges[start];
    while (temp != NULL) {
        if (temp->he->end == end) {
            break;
        }
        temp = temp->next;
    }
    if (temp == NULL) {
        return NULL;
    }
    else {
        return temp->he;
    }

}

void initHalfedge() {
    hefaces = new he_face*[numofface];
    int numofhe = 0;
    for (int i = 0; i < numofvertex; i++)
    {
        iedges[i] = NULL;
    }

    for (int i = 0; i < numofface; i++)
    {

        int v1 = faces[i].vertexs[0];
        int v2 = faces[i].vertexs[1];
        int v3 = faces[i].vertexs[2];

        he_face* hf = new he_face();
        //尝试看三个顶点之间的半边是否建立

        halfedge* he1 = getHalfEdge(v1, v2, iedges);
        halfedge* he2 = getHalfEdge(v2, v3, iedges);
        halfedge* he3 = getHalfEdge(v3, v1, iedges);
        if (he1 == NULL) {

            //如果没有建立
            he1 = new halfedge();
            he1->end = v2;
            halfedge* opposite1 = new halfedge();
            opposite1->end = v1;
            opposite1->opposite = he1;
            he1->opposite = opposite1;


            //添加额外信息到链表
            iedge* temp = iedges[v1];
            iedge* tempi = new iedge();
            tempi->start = v1;
            tempi->he = he1;
            if (temp == NULL) {
                iedges[v1] = tempi;
            }
            else {
                while (temp->next != NULL) {
                    temp = temp->next;
                }
                temp->next = tempi;
            }


            temp = iedges[v2];
            tempi = new iedge();
            tempi->start = v2;
            tempi->he = opposite1;
            if (temp == NULL) {
                iedges[v2] = tempi;
            }
            else {
                while (temp->next != NULL) {
                    temp = temp->next;
                }
                temp->next = tempi;
            }

        }

        if (he2 == NULL) {
            he2 = new halfedge();
            he2->end = v3;
            halfedge* opposite2 = new halfedge();
            opposite2->end = v2;
            opposite2->opposite = he2;
            he2->opposite = opposite2;

            iedge* temp = iedges[v2];
            iedge* tempi = new iedge();
            tempi->start = v2;
            tempi->he = he2;
            if (temp == NULL) {
                iedges[v2] = tempi;
            }
            else {
                while (temp->next != NULL) {
                    temp = temp->next;
                }
                temp->next = tempi;
            }


            temp = iedges[v3];
            tempi = new iedge();
            tempi->start = v3;
            tempi->he = opposite2;
            if (temp == NULL) {
                iedges[v3] = tempi;
            }
            else {
                while (temp->next != NULL) {
                    temp = temp->next;
                }
                temp->next = tempi;
            }
        }

        if (he3 == NULL) {
            he3 = new halfedge();
            he3->end = v1;
            halfedge* opposite3 = new halfedge();
            opposite3->end = v3;
            opposite3->opposite = he3;
            he3->opposite = opposite3;


            iedge* temp = iedges[v3];
            iedge* tempi = new iedge();
            tempi->start = v3;
            tempi->he = he3;
            if (temp == NULL) {
                iedges[v3] = tempi;
            }
            else {
                while (temp->next != NULL) {
                    temp = temp->next;
                }
                temp->next = tempi;
            }


            temp = iedges[v1];
            tempi = new iedge();
            tempi->start = v1;
            tempi->he = opposite3;
            if (temp == NULL) {
                iedges[v1] = tempi;
            }
            else {
                while (temp->next != NULL) {
                    temp = temp->next;
                }
                temp->next = tempi;
            }
        }

        he1->next = he2;
        he2->next = he3;
        he3->next = he1;

        hf->edge = he1;

        he1->face = hf;
        he2->face = hf;
        he3->face = hf;

        if (vertexs[v1].edge == NULL)
            vertexs[v1].edge = he1;
        if (vertexs[v2].edge == NULL)
            vertexs[v2].edge = he2;
        if (vertexs[v3].edge == NULL)
            vertexs[v3].edge = he3;

        hefaces[i] = hf;
    }

}


//给定目标点索引
vector <int> pointInds;

void drawModel() {
    glClearColor(130/255.0, 177/255.0, 255/255.0, 0.0f);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glColor3f(1.0, 1.0, 1.0);

    //绘制模型
    for (int i = 0; i < numofface; i++)
    {
        //从半边模型取数据
        halfedge* e = hefaces[i]->edge;
        vertex v1 = vertexs[e->end];
        vertex v2 = vertexs[e->next->end];
        vertex v3 = vertexs[e->next->next->end];

        //画面
        glEnable(GL_COLOR_MATERIAL);
        glColorMaterial(GL_FRONT, GL_AMBIENT);
        glColor3f(100/255.0, 181/255.0, 246/255.0);
        glBegin(GL_POLYGON);
        glNormal3f(normalvectors[i].x, normalvectors[i].y, normalvectors[i].z);
        glVertex3f(v1.x, v1.y, v1.z);
        glVertex3f(v2.x, v2.y, v2.z);
        glVertex3f(v3.x, v3.y, v3.z);
        glEnd();

        //画顶点
        // glEnable(GL_COLOR_MATERIAL);
        // glColorMaterial(GL_FRONT, GL_AMBIENT);
        // glColor3f(255/255.0, 0/255.0, 0/255.0);
        // glPointSize(3);
        // glBegin(GL_POINTS);
        // glVertex3f(v1.x, v1.y, v1.z);
        // glVertex3f(v2.x, v2.y, v2.z);
        // glColor3f(255/255.0, 255/255.0, 0/255.0);
        // glVertex3f(v3.x, v3.y, v3.z);
        // glEnd();

        //画边
        glEnable(GL_COLOR_MATERIAL);
        glColorMaterial(GL_FRONT, GL_AMBIENT);
        glColor3f(25/255.0, 118/255.0, 210/255.0);
        glLineWidth(2);
        glBegin(GL_LINE_STRIP);
        glVertex3f(v1.x, v1.y, v1.z);
        glVertex3f(v2.x, v2.y, v2.z);
        glEnd();
        glBegin(GL_LINE_STRIP);
        glVertex3f(v2.x, v2.y, v2.z);
        glVertex3f(v3.x, v3.y, v3.z);
        glEnd();
        glBegin(GL_LINE_STRIP);
        glVertex3f(v1.x, v1.y, v1.z);
        glVertex3f(v3.x, v3.y, v3.z);
        glEnd();
    }

    glEnable(GL_COLOR_MATERIAL);
    glColorMaterial(GL_FRONT, GL_AMBIENT);


    for(auto ite=pointInds.begin();ite!=pointInds.end();ite++){
        //寻找邻居半边
        std::vector<halfedge*> halfEdges;
        vertex vt = vertexs[*ite];
        halfedge* he=vt.edge;
        halfedge* phe=he;
        do
        {
            // if (phe->isBoundary) {
            // 	halfEdges.push_back(phe);
            // 	break;
            // }
            halfEdges.push_back(phe);
            phe = phe->opposite->next;
            // cout<<1<<endl;
        } while (phe!= he);

        //寻找邻居半面
        std::vector<he_face*> hefaces;
        auto edges = halfEdges;
        for (int i = 0; i < edges.size(); i++) {
            hefaces.push_back(edges[i]->face);
        }

        std::set<vertex> neighbors;
        // cout<<hefaces.size()<<endl;

        //从各邻居半面寻找邻居点
        for(auto ite=hefaces.begin();ite!=hefaces.end();ite++){
            halfedge* e = (**ite).edge;
            neighbors.insert(vertexs[e->end]);
            neighbors.insert(vertexs[e->next->end]);
            neighbors.insert(vertexs[e->next->next->end]);
        }

        //绘制邻居点，并连线
        for(auto ite=neighbors.begin();ite!=neighbors.end();ite++){
            glLineWidth(6);
            glColor3f(255/255.0, 138/255.0, 101/255.0);
            glBegin(GL_LINE_STRIP);
            glVertex3f(vt.x, vt.y, vt.z);
            glVertex3f(ite->x, ite->y, ite->z);
            glEnd();

            glPointSize(7);
            glColor3f(255/255.0, 241/255.0, 118/255.0);
            glBegin(GL_POINTS);
            glVertex3f(ite->x, ite->y, ite->z);
            glEnd();
        }


        //绘制中心点
        glColor3f(124/255.0, 77/255.0, 255/255.0);
        glPointSize(10);
        glBegin(GL_POINTS);
        glVertex3f(vt.x, vt.y, vt.z);
        glEnd();
    }


    // 特定顶点
    // vertex v1 = vertexs[160];
    // vertex e1e = vertexs[v1.edge->end];
    // vertex e2e = vertexs[v1.edge->next->end];

    // glEnable(GL_COLOR_MATERIAL);
    // glColorMaterial(GL_FRONT, GL_AMBIENT);
    // glColor3f(124/255.0, 77/255.0, 255/255.0);
    // glPointSize(7);
    // glBegin(GL_POINTS);
    // glVertex3f(v1.x, v1.y, v1.z);
    // glColor3f(255/255.0, 241/255.0, 118/255.0);
    // glVertex3f(e1e.x, e1e.y, e1e.z);
    // glVertex3f(e2e.x, e2e.y, e2e.z);
    // glEnd();

    // glLineWidth(6);
    // glColor3f(255/255.0, 138/255.0, 101/255.0);
    // glBegin(GL_LINE_STRIP);
    // glVertex3f(v1.x, v1.y, v1.z);
    // glVertex3f(e1e.x, e1e.y, e1e.z);
    // glEnd();
    // glBegin(GL_LINE_STRIP);
    // glVertex3f(v1.x, v1.y, v1.z);
    // glVertex3f(e2e.x, e2e.y, e2e.z);
    // glEnd();


    glutSwapBuffers();
    glFlush();
}


void insertIedge(iedge** iedges, iedge* ie) {
    iedge* it = iedges[ie->start];
    if (it == NULL) {
        iedges[ie->start] = ie;
    }
    else {
        while (it->next != NULL)
        {
            it = it->next;
        }
        it->next = ie;
    }
}

void computeNormalVec() {
    normalvectors = new normalVec[numofface];

    for (int i = 0; i < numofface; i++)
    {
        halfedge* hef = hefaces[i]->edge;
        int v0 = hef->next->next->end;
        int v1 = hef->end;
        int v2 = hef->next->end;
        float p1[] = { vertexs[v1].x - vertexs[v0].x, vertexs[v1].y - vertexs[v0].y,vertexs[v1].z - vertexs[v0].z };
        float p2[] = { vertexs[v2].x - vertexs[v1].x,vertexs[v2].y - vertexs[v1].y,vertexs[v2].z - vertexs[v1].z };
        float nx = p1[1] * p2[2] - p1[2] * p2[1];
        float ny = p1[2] * p2[0] - p1[0] * p2[2];
        float nz = p1[0] * p2[1] - p1[1] * p2[0];
        float len = sqrt(pow(nx, 2) + pow(ny, 2) + pow(nz, 2));
        nx = nx / len;
        ny = ny / len;
        nz = nz / len;
        normalvectors[i] = normalVec(nx, ny, nz);

    }

}

void loopDivision() {
    vertex* newvertexs = new vertex[numofvertex + (int)(1.5*numofface)+1];
    he_face** nfaces = new he_face*[4 * numofface];
    iedge** niedges = new iedge*[numofvertex +  (int)(1.5*numofface)+1];
    int numoff = 0;
    int numofv = 0;

    for (int i = 0; i < numofvertex + 1.5*numofface; i++)
    {
        niedges[i] = NULL;
    }

    for (int i = 0; i < numofvertex; i++)
    {
        //更新旧顶点
        int n = 0;
        halfedge* hedge = vertexs[i].edge;
        do
        {
            n++;
            hedge = hedge->opposite->next;
        } while (hedge != vertexs[i].edge);
        float beta = (5.0 / 8 - pow((3.0 / 8 + cos(2 * PI / n) / 4), 2)) / n;
        float sumpx = 0;
        float sumpy = 0;
        float sumpz = 0;
        do
        {
            sumpx += vertexs[hedge->end].x;
            sumpy += vertexs[hedge->end].y;
            sumpz += vertexs[hedge->end].z;
            hedge = hedge->opposite->next;
        } while (hedge != vertexs[i].edge);
        float npx = (1 - n * beta)*vertexs[i].x + beta * sumpx;
        float npy = (1 - n * beta)*vertexs[i].y + beta * sumpy;
        float npz = (1 - n * beta)*vertexs[i].z + beta * sumpz;
        vertex nv = vertex();
        nv.x = npx;
        nv.y = npy;
        nv.z = npz;
        nv.edge = vertexs[i].edge;
        newvertexs[i] = nv;
        //为了统计新的v个数
        numofv++;
    }
    for (int i = 0; i < numofface; i++)
    {
        halfedge* fedge = hefaces[i]->edge;
        do
        {
            int v0 = fedge->next->next->end;
            int v1 = fedge->end;
            int v2 = fedge->opposite->next->end;
            int v3 = fedge->next->end;
            iedge* it = iedges[v0];
            int middle = -1;
            middle = getMiddle(v0, v1, iedges);
            if (middle == -1) {

                //创建新点
                vertex newv = vertex();
                newv.x = 3 * (vertexs[v0].x + vertexs[v1].x) / 8 + (vertexs[v2].x + vertexs[v3].x) / 8;
                newv.y = 3 * (vertexs[v0].y + vertexs[v1].y) / 8 + (vertexs[v2].y + vertexs[v3].y) / 8;
                newv.z = 3 * (vertexs[v0].z + vertexs[v1].z) / 8 + (vertexs[v2].z + vertexs[v3].z) / 8;

                newvertexs[numofv] = newv;

                //创建新边
                iedge* itemp = iedges[v0];
                while (itemp != NULL) {
                    if (itemp->he == fedge) {
                        itemp->middle = numofv;
                        break;
                    }
                    itemp = itemp->next;
                }
                itemp = iedges[v1];
                while (itemp != NULL) {
                    if (itemp->he == fedge->opposite) {
                        itemp->middle = numofv;
                        break;
                    }
                    itemp = itemp->next;
                }

                middle = numofv;

                //更新v个数
                numofv++;
            }

            //创建两个新边
            halfedge* newhe1 = new halfedge();
            halfedge* newhe2 = new halfedge();
            newhe1->end = getMiddle(v0, v1, iedges);
            iedge* newie1 = new iedge();
            newie1->start = v0;
            newie1->he = newhe1;
            insertIedge(niedges, newie1);
            halfedge* op1 = getHalfEdge(middle, v0, niedges);
            newhe1->opposite = op1;
            if (op1 != NULL)
            {
                op1->opposite = newhe1;
            }


            newhe2->end = v1;
            iedge* newie2 = new iedge();
            newie2->start = middle;
            newie2->he = newhe2;
            insertIedge(niedges, newie2);
            halfedge* op2 = getHalfEdge(v1, middle, niedges);
            newhe2->opposite = op2;
            if (op2 != NULL)
            {
                op2->opposite = newhe2;
            }


            newvertexs[v0].edge = newhe1;
            newvertexs[middle].edge = newhe2;


            fedge = fedge->next;
        } while (fedge != hefaces[i]->edge);


        //创建新面
        do
        {
            int v0 = fedge->next->next->end;
            int v1 = fedge->end;
            int v3 = fedge->next->end;
            int middle1 = getMiddle(v0, v1, iedges);
            int middle2 = getMiddle(v3, v0, iedges);

            halfedge* middlehe = new halfedge();
            middlehe->end = middle2;
            halfedge* fhe1 = getHalfEdge(v0, middle1, niedges);
            fhe1->next = middlehe;
            halfedge* fhe2 = getHalfEdge(middle2, v0, niedges);
            middlehe->next = fhe2;
            fhe2->next = fhe1;

            he_face* nface = new he_face();
            nface->edge = fhe1;
            nfaces[numoff] = nface;
            numoff++;
            fhe1->face = nface;
            fhe2->face = nface;
            middlehe->face = nface;

            iedge* middleiedge = new iedge();
            middleiedge->start = middle1;
            middleiedge->he = middlehe;
            insertIedge(niedges, middleiedge);

            fedge = fedge->next;
        } while (fedge != hefaces[i]->edge);

        int middle1 = -1;
        int middle2 = -1;
        int middle3 = -1;
        middle1 = getMiddle(fedge->next->next->end, fedge->end, iedges);
        middle2 = getMiddle(fedge->end, fedge->next->end, iedges);
        middle3 = getMiddle(fedge->next->end, fedge->next->next->end, iedges);

        halfedge* middlefhe1 = new halfedge();
        halfedge* middlefhe2 = new halfedge();
        halfedge* middlefhe3 = new halfedge();

        middlefhe1->end = middle1;
        middlefhe2->end = middle2;
        middlefhe3->end = middle3;

        middlefhe1->next = middlefhe2;
        middlefhe2->next = middlefhe3;
        middlefhe3->next = middlefhe1;

        halfedge* middleo1 = getHalfEdge(middle1, middle3, niedges);
        middleo1->opposite = middlefhe1;
        middlefhe1->opposite = middleo1;
        halfedge* middleo2 = getHalfEdge(middle2, middle1, niedges);
        middleo2->opposite = middlefhe2;
        middlefhe2->opposite = middleo2;
        halfedge* middleo3 = getHalfEdge(middle3, middle2, niedges);
        middleo3->opposite = middlefhe3;
        middlefhe3->opposite = middleo3;

        he_face* middlehf = new he_face();
        middlehf->edge = middlefhe1;
        middlefhe1->face = middlehf;
        middlefhe2->face = middlehf;
        middlefhe3->face = middlehf;
        nfaces[numoff] = middlehf;
        numoff++;
        iedge* mie1 = new iedge();
        mie1->start = middle3;
        mie1->he = middlefhe1;
        insertIedge(niedges, mie1);

        iedge* mie2 = new iedge();
        mie2->start = middle1;
        mie2->he = middlefhe2;
        insertIedge(niedges, mie2);

        iedge* mie3 = new iedge();
        mie3->start = middle2;
        mie3->he = middlefhe3;
        insertIedge(niedges, mie3);

    }
    free(vertexs);
    vertexs = newvertexs;
    numofvertex = numofv;
    free(hefaces);
    hefaces = nfaces;

    numofface = numoff;
    free(iedges);
    iedges = niedges;
    computeNormalVec();
    drawModel();
}

void setLightRes() {


    glEnable(GL_LIGHTING);
    GLfloat light_position[] = { 1.0, 1.0, 1.0, 0.0 };
    GLfloat light_ambient[] = { 1.0, 1.0, 1.0, 1.0 };
    GLfloat light_diffuse[] = { 1.0, 1.0, 1.0, 1.0 };
    GLfloat light_specular[] = { 1.0, 1.0, 1.0, 1.0 };
    glLightfv(GL_LIGHT0, GL_POSITION, light_position);
    glLightfv(GL_LIGHT0, GL_AMBIENT, light_ambient);
    glLightfv(GL_LIGHT0, GL_DIFFUSE, light_diffuse);
    glLightfv(GL_LIGHT0, GL_SPECULAR, light_specular);
    glEnable(GL_LIGHT0);
}

void centralModel() {
    float centerx = 0;
    float centery = 0;
    float centerz = 0;
    for (int i = 0; i < numofvertex; i++)
    {
        centerx += vertexs[i].x;
        centery += vertexs[i].y;
        centerz += vertexs[i].z;
    }
    centerx /= numofvertex;
    centery /= numofvertex;
    centerz /= numofvertex;
    for (int i = 0; i < numofvertex; i++)
    {
        vertexs[i].x -= centerx;
        vertexs[i].y -= centery;
        vertexs[i].z -= centerz;
        if (vertexs[i].x > maxx)
            maxx = vertexs[i].x;
        if (vertexs[i].y > maxy)
            maxy = vertexs[i].y;
        if (vertexs[i].z > maxz)
            maxz = vertexs[i].z;
        if (vertexs[i].x < minx)
            minx = vertexs[i].x;
        if (vertexs[i].y < miny)
            miny = vertexs[i].y;
        if (vertexs[i].z < minz)
            minz = vertexs[i].z;


    }
    float max;
    if (maxx > maxy&&maxx > maxz) {
        max = maxx;
    }
    else if (maxx > maxx&&maxy > maxz) {
        max = maxy;
    }
    else {
        max = maxz;
    }
    ShootPosition[2] = maxz;
    radius = max;
    ShootDirect[1] = 1;
}

void onMouseClick(int button, int state, int x, int y) {

    if (button == GLUT_LEFT_BUTTON) {
        if (state == GLUT_DOWN)
        {
            px = x;
            py = y;
        }
    }

}

void rotate(float t1, float t2) {
    float x = radius * cos(t2)* sin(t1);
    float y = radius * sin(t2);
    float z = radius * cos(t2)*cos(t1);
    float x2 = 1 * sin(t2)*-1 * sin(t1);
    float y2 = 1 * cos(t2);
    float z2 = 1 * sin(t2)*-1 * cos(t1);

    ShootDirect[0] = x2;
    ShootDirect[1] = y2;
    ShootDirect[2] = z2;


    ShootPosition[0] = x;
    ShootPosition[1] = y;
    ShootPosition[2] = z;
    // gluLookAt(ShootPosition[0], ShootPosition[1], ShootPosition[2], 0.0, 0.0, 0.0, ShootDirect[0], ShootDirect[1], ShootDirect[2]);
    gluLookAt(0,1, 0, 0.0, 0.0, 0.0, ShootDirect[0], ShootDirect[1], ShootDirect[2]);
    glutPostRedisplay();
}

void onMouseMove(int x, int y) {
    float dx = 20.0f / WIDTH;
    float dy = 20.0f / HEIGHT;

    if (x - px > 2) {
        theta1 -= 0.1;
        px = x;
        rotate(theta1, theta2);
    }
    else if (x - px < -2) {
        theta1 += 0.1;
        px = x;
        rotate(theta1, theta2);
    }

    if (y - py > 5) {
        theta2 += 0.1;
        py = y;
        rotate(theta1, theta2);
    }

    else if (y - py < -5) {
        theta2 -= 0.1;
        py = y;
        rotate(theta1, theta2);
    }

}

// void onKeyboardPress(unsigned char key, int mouseX, int mouseY) {
// 	switch (key)
// 	{
// 	case '=':
// 	{
// 		scale += 0.3;
// 		break;
// 	}
// 	case '-': {
// 		if (scale>0)
// 			scale -= 0.3;
// 		break;
// 	}

// 	case 'w': {
// 		ShootPosition[0]+=0.01;
// 		break;
// 	}

// 	case '0':
// 	{
// 		loopDivision();
// 		break;
// 	}
// 	}
// 	glutPostRedisplay();
// }


static float angle = 0.0;//angle绕y轴的旋转角
static float angleUp = 0.0;//angle绕y轴的旋转角
static float x = 0.0f, y = 0.0f, z = 0.0f;//相机位置
static float lx = 0.0f, ly = 0.0f, lz = -1.0f;//视线方向，初始设为沿着Z轴负方向

void updateCamera(){
    //更新相机姿态
    gluLookAt(x, y, z, x + lx, y + ly, z + lz, 0.0f, 1.0f, 0.0f);
    // gluLookAt(x, y, z, 0.0f,0.0f,-1.0f, 0.0f, 1.0f, 0.0f);
    // gluLookAt(x, y, z, 0.0f,-1.0f,-0.003f, 0.0f, 1.0f, 0.0f);
}

//旋转相机，绕y轴旋转
void orientMe(float ang)
{
    lx = sin(ang);
    lz = -cos(ang);
    glLoadIdentity();
    updateCamera();
    //把所看的点（即视线方向上的点）理解为在一个圆上旋转，那设置的点的坐标应该是旋转的，通过圆半径计算坐标
    //！！！画图好理解！！！
    glutPostRedisplay();
}

// 前后移动相机
// void move_Front_Back(int direction)
// {
// 	x = x + direction*(lx)*0.1;
// 	z = z + direction*(lz)*0.1;
// 	glLoadIdentity();
// 	updateCamera();
//     //同时移动相机和所看的点坐标，只用修改x和z，视线参数不用修改，
//     glutPostRedisplay();
// }

//左右移动相机，一定要画图理解
void move_Left_Right(int direction)
{
    x = x + direction*(lz)*0.005;
    z = z - direction*(lx)*0.005;

    // z-=0.05*direction;
    glLoadIdentity();
    updateCamera();
    glutPostRedisplay();
}

void move_High_Low(int direction)
{
    y = y + direction * 0.005;
    glLoadIdentity();
    updateCamera();
    glutPostRedisplay();
}

//键盘响应
void onKeyboardPress(unsigned char key, int x, int y) {
    switch (key)
    {
        case 'l':
            angle -= 0.09f;
            orientMe(angle);
            break;
        case '\'':               //q,e键调用相机旋转
            angle += 0.09f;
            orientMe(angle);
            break;
        case 'w':
            //   move_Front_Back(1);
            scale+=0.25;
            glutPostRedisplay();
            break;
        case 's':
            //   move_Front_Back(-1);
            scale-=0.25;
            glutPostRedisplay();
            break;
        case 'a':
            move_Left_Right(1);
            break;
        case 'd':
            move_Left_Right(-1);
            break;              //wasd调整相机前后左右移动

        case 'p':
            angleUp-=0.9f;
            glutPostRedisplay();
            break;
        case ';':
            angleUp+=0.9f;
            glutPostRedisplay();
            break;
        case '1':
            move_High_Low(1);
            break;
        case '2':
            move_High_Low(-1);
            break;              //1,2键上下移动相机

        case '0':
            loopDivision();
            break;
        default:
            break;
    }
}

void myDisplay() {
    glClearColor(0.0f, 0.0f, 0.0f, 0.0f);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
    glScalef(scale, scale, scale);
    glRotatef(angleUp,-1,0,0);
    glTranslatef(0.0,0.0,0.0);
    setLightRes();
    // gluLookAt(ShootPosition[0], ShootPosition[1], ShootPosition[2], 0.0, 0.0, 0.0, ShootDirect[0], ShootDirect[1], ShootDirect[2]);
    // gluLookAt(ShootPosition[0], ShootPosition[1], ShootPosition[2], 0.0, 0.0, 0.0, ShootDirect[0], ShootDirect[1], ShootDirect[2]);
    updateCamera();

    glPushMatrix();
    drawModel();
    glPopMatrix();

}

void reshape(int width, int height)
{
    glViewport(0, 0, (GLsizei)width, (GLsizei)height);

    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();



    float scale = 0.5;
    if (width <= height)
        glOrtho(-1.5*scale, 1.5*scale, -1.5*scale*(GLfloat)height / (GLfloat)width, 1.5*scale*(GLfloat)height / (GLfloat)width, -10.0*scale, 10.0*scale);
    else
        glOrtho(-1.5*scale*(GLfloat)width / (GLfloat)height, 1.5*scale*(GLfloat)width / (GLfloat)height, -1.5*scale, 1.5*scale, -10.0*scale, 10.0*scale);

    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();

}


int main(int argc, char *argv[]) {

    glutInit(&argc, argv);

    glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB | GLUT_DEPTH);
    glutInitWindowPosition(100, 100);
    glutInitWindowSize(WIDTH, HEIGHT);
    glutCreateWindow("201900302030 - expe5");
    glEnable(GL_CULL_FACE);
    glEnable(GL_DEPTH_TEST);

    glShadeModel(GL_SMOOTH);


    readFile();

    iedges = new iedge*[numofvertex];

    //随机产生测试样例
    srand((int)time(NULL));
    for (int i = 0; i < 10; i++)
        pointInds.push_back((int)(rand()%360));

    initHalfedge();

    computeNormalVec();

    centralModel();

    glutKeyboardFunc(&onKeyboardPress);

    glutMotionFunc(&onMouseMove);

    glutMouseFunc(&onMouseClick);

    glEnable(GL_LIGHT0);

    glEnable(GL_NORMALIZE);

    glutDisplayFunc(&myDisplay);

    glutReshapeFunc(&reshape);

    glutSwapBuffers();

    glutMainLoop();

    return 0;
}
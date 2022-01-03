#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <time.h>
#include <GL/glut.h>
#include "ArcBall.h"


ArcBallT arcBall(600.0f,400.0f);
ArcBallT*    ArcBall =&arcBall;// new ArcBallT(600.0f,400.0f);//&arcBall;

void reshape(int w, int h){
    glViewport(0,0, w, h);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    glFrustum(-1, 1, -1, 1, 1.5, 20);
    glMatrixMode(GL_MODELVIEW);
    ////ball
    ArcBall->setBounds((GLfloat)w, (GLfloat)h);//1. 设置窗口边界
}
void init(){
    glClearColor(0,0,0,0);
    glShadeModel(GL_FLAT);
}


void display (void)
{

    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glColor3f(1.0,1.0,1.0);
    glLoadIdentity();
    gluLookAt(0.0, 0.0, 5.0,
              0.0, 0.0, 0.0,
              0.0, 1.0, 0.0);
    glScalef(1.0, 2.0, 1.0);

    //glPushMatrix();
    glTranslatef(0,0,-3);
    glScalef(ArcBall->zoomRate, ArcBall->zoomRate, ArcBall->zoomRate);//2. 缩放
    glMultMatrixf(ArcBall->Transform.M);                        //3. 旋转
    //glutWireCube(1.0);
    glBegin(GL_POLYGON);
        glVertex3d(0,0,1);
        glVertex3d(0,1,0);
        glVertex3d(1,0,0);
    glEnd();
    //glPopMatrix();

    glFlush ();
}
//移动
void move(int x, int y)
{
    ArcBall->MousePt.s.X = x;
    ArcBall->MousePt.s.Y = y;
    ArcBall->upstate();
    glutPostRedisplay();
}
//点击
void mouse(int button, int state, int x, int y)
{
    if(button == GLUT_LEFT_BUTTON && state==GLUT_DOWN){
        ArcBall->isClicked = true;
        move(x,y);
    }
    else if(button == GLUT_LEFT_BUTTON && state==GLUT_UP)
        ArcBall->isClicked = false;
    else if(button == GLUT_RIGHT_BUTTON && state==GLUT_DOWN){
        ArcBall->isRClicked = true;
        move(x,y);
    }
    else if(button == GLUT_RIGHT_BUTTON && state == GLUT_UP)
        ArcBall->isRClicked = false;
    ArcBall->upstate();
    glutPostRedisplay();
}

int main(int argc, char** argv){
    glutInit(&argc, argv);
    glutInitDisplayMode(GLUT_SINGLE|GLUT_RGB);
    glutInitWindowSize(640,480);
    glutCreateWindow("TEST_Arcball");

    init();
    glutDisplayFunc(display);
    glutReshapeFunc(reshape);

    glutMouseFunc(mouse);        //registered the mouse event.
    glutMotionFunc(move);         //registered the move event

    glutMainLoop();

    return 0;
}
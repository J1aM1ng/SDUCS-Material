#include <bits/stdc++.h>
#include <GL/glut.h>
using namespace std;
double dx = 0, dy = 0, oldx, oldy;
int w = 500, h = 500;
int mode = 0;//展示模式：拖动/旋转 三角/圆
double dxt, dyt, dxc, dyc, anglezt = 0, anglezc = 0;

//初始化参数
void init() {
	//背景色
	glClearColor(0.1, 0.3, 0.4, 0.0);
	glShadeModel(GL_SMOOTH);
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	gluOrtho2D(0, w, 0, h);
}

void display() {//主体功能函数
	int n = 1000;
	GLfloat r = 50;
	GLfloat pi = acos(-1);

	glClear(GL_COLOR_BUFFER_BIT);

	//绘制三角形
	if (mode == 1) {
		dxt = dx;
		dyt = dy;
	}
	glPushMatrix();
	glLoadIdentity();
	glTranslatef(dxt, dyt, 0);
	glRotatef(anglezt, 0, 0, 1);

	glBegin(GL_TRIANGLES);
	glColor3f(1, 0, 0);
	glVertex2f(-69.282, -40);
	glColor3f(0, 1, 0);
	glVertex2f(0, 69.282);
	glColor3f(0, 0, 1);
	glVertex2f(69.282, -40);
	glEnd();

	glPopMatrix();
	//绘制圆形
	if (mode == 2) {
		dxc = dx;
		dyc = dy;
	}
	glPushMatrix();
	glLoadIdentity();
	glTranslatef(dxc, dyc, 0);
	glRotatef(anglezc, 0, 0, 1);

	glBegin(GL_POLYGON);
	glColor3f(0.4, 0.3, 0.3);
	for (int i = 0; i < n; i++) {
		if (i == 500) {
			glColor3f(0.9, 0.8, 0.8);
		}
		glVertex2f(r * cos(2 * pi / n * i), r * sin(2 * pi / n * i));
	}
	glEnd();
	glPopMatrix();

	glFlush();
}

//窗口大小变化回调函数
void reshape(int w, int h) {

	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	gluOrtho2D(0, w, 0, h);
	glViewport(0, 0, w, h);

	glMatrixMode(GL_MODELVIEW);
}

void myMouse(int x, int y, int button, int state)
{//绑定鼠标
	if (state == GLUT_DOWN && button == GLUT_LEFT_BUTTON) {
		oldx = x;
		oldy = h - y;
	}
}

void myMotion(int x, int y)
{//鼠标在窗口中按下并移动时调用
	y = h - y;
	dx += x - oldx;
	dy += y - oldy;

	GLfloat deltax = x - oldx;
	GLfloat deltay = y - oldy;
	if (mode == 3) {
		anglezt += deltay;
	}
	if (mode == 4) {
		anglezc += deltay;
	}
	glutPostRedisplay();

	oldx = x;
	oldy = y;
}

void mykeyboard(unsigned char key, int x, int y)
{
	mode = key - '0';
}

int main(int argc, char** argv) {
	cout << "输入1移动三角形\n输入2移动圆形\n输入3旋转三角形\n输入4旋转圆形\n" << endl;
	//初始化显示模式
	glutInit(&argc, argv);
	glutInitDisplayMode(GLUT_SINGLE | GLUT_RGB);

	//初始化窗口
	glutInitWindowSize(w, h);
	glutInitWindowPosition(100, 100);
	glutCreateWindow("实验零：OpenGL基本使用");

	init();
	glutReshapeFunc(reshape);
	glutDisplayFunc(display);
	glutKeyboardFunc(mykeyboard);
	glutMouseFunc(myMouse);
	glutMotionFunc(myMotion);

	// 开始主循环绘制
	glutMainLoop();
	return 0;
}
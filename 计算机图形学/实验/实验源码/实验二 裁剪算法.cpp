#include <bits/stdc++.h>
#include <GL/glut.h>
const int N = 1000;
using namespace std;
// line[][].k表示第k条线，第二坐标的0 1表示线起始点的xy坐标，2 3表示线终止点的xy坐标
int line[N][4], k = 0;
int oldx = 0, oldy = 0, dxp = 0, dyp = 0;
// 裁剪窗口的宽高
int w = 600, h = 600;
int mode = 1;

void init() {
	//初始化 窗口颜色等
	glClearColor(0.67, 0.5, 1.0, 0.0);
	glLineWidth(3.0);
	glShadeModel(GL_FLAT);
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	gluOrtho2D(0, w, 0, h);
}

void reshape(int w, int h) {

	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	gluOrtho2D(0, w, 0, h);
	glViewport(0, 0, w, h);
	glMatrixMode(GL_MODELVIEW);
}

void myMouse(int button, int state, int x, int y) {
	// 绑定鼠标事件
	if (state == GLUT_DOWN && button == GLUT_LEFT_BUTTON) {
		// 按下鼠标左键
		line[k][0] = x;
		line[k][1] = h - y;
		mode = 1;
	}
	if (state == GLUT_UP && button == GLUT_LEFT_BUTTON) {
		// 松开鼠标左键，显示画出的线
		line[k][2] = x;
		line[k][3] = h - y;
		k++;
		glutPostRedisplay();
	}
	if (state == GLUT_DOWN && button == GLUT_RIGHT_BUTTON) {
		// 按下鼠标右键 ,拖动裁剪窗口
		oldx = x;
		oldy = h - y;
		mode = 2;
	}
}

void myMotion(int x, int y) {
	// 鼠标在窗口中按下并移动时调用
	if (mode == 2) {
		// 模式2，拖动裁剪窗口
		y = h - y;
		dxp += x - oldx;
		dyp += y - oldy;
		glutPostRedisplay();
		oldx = x;
		oldy = y;
	}
}

bool check(float p, float q, float &u1, float &u2) {
	// 通过计算参数u1和u2来判断该直线 被舍弃 or 被保留
	float u;
	if (p > 0) {
		// p>0时，线段从裁剪边界所在直线的内部指向外部
		// 对于每条直线段，可以计算出u1和u2
		// u1的值由线段从外到内遇到的矩形边界所决定(p<0)，u1取0和各个rk值之中的最大值
		// u2的值由线段从内到外遇到的矩形边界所决定(p>0)，u2取1和各个rk值之中的最小值
		u = q / p; // rk
		// 计算、比较得出u1、u2
		if (u < u1) {
			return false;
		}
		else if (u < u2) {
			u2 = u;
		}
	}
	else if (p < 0) {
		u = q / p;
		if (u > u2) {
			return false;
		}
		else if (u > u1) {
			u1 = u;
		}
	}
	else {
		// p == 0
		if (q < 0) {
			// 线段完全在边界外，舍弃该线段
			return false;
		}
	}
	// 该线段平行于裁剪边界并且在窗口内
	return true;
}

void clip(float xleft, float xright, float ybottom, float ytop, float x1, float y1, float x2, float y2) {
	// 梁友栋-Barskdy算法，参数化裁剪
	float u1 = 0, u2 = 1;
	// Δy=y2-y1 Δx=x2-x1
	float dx = x2 - x1, dy = y2 - y1;
	float x3 = x1, y3 = y1, x4 = x2, y4 = y2;
	// 按参数化形式的裁剪条件进行判断
	// xleft<=x1+uΔx<=xright
	// ybottom<=y1+uΔy<=ytop
	if (check(-dx, x1 - xleft, u1, u2)) {
		if (check(dx, xright - x1, u1, u2)) {
			dy = y2 - y1;
			if (check(-dy, y1 - ybottom, u1, u2)) {
				if (check(dy, ytop - y1, u1, u2)) {
					if (u2 < 1) {
						// 决定裁剪线段的u，以算出裁剪后线段的x和y值
						x4 = x1 + u2 * dx;
						y4 = y1 + u2 * dy;
					}
					if (u1 > 0) {
						// 决定裁剪线段的u，以算出裁剪后线段的x和y值
						x3 = x1 + u1 * dx;
						y3 = y1 + u1 * dy;
					}
					// 绘制线段 (x3,y3) - (x4,y4)
					glBegin(GL_LINE_STRIP);
					glClear(GL_COLOR_BUFFER_BIT);
					glColor3f(1, 1, 1);
					glVertex2f(x1, y1);
					glVertex2f(x3, y3);
					glColor3f(0, 0, 0);
					glVertex2d(x4, y4);
					glColor3f(1, 1, 1);
					glVertex2f(x2, y2);
					glEnd();
					return;
				}
			}
		}
	}
	glBegin(GL_LINE_STRIP);
	glClear(GL_COLOR_BUFFER_BIT);
	glColor3f(1, 1, 1);
	glVertex2f(x1, y1);
	glVertex2f(x2, y2);
	glEnd();
}

void display() {
	glClear(GL_COLOR_BUFFER_BIT);
	//绘制裁剪矩形窗口
	glPushMatrix();
	glLoadIdentity();
	glTranslatef(dxp, dyp, 0);
	glBegin(GL_LINE_STRIP);
	glColor3f(0.1, 0.1, 0.9);
	glVertex2d(-150, -150);
	glVertex2d(-150, 150);
	glVertex2d(150, 150);
	glVertex2d(150, -150);
	glVertex2d(-150, -150);
	glEnd();
	glPopMatrix();

	//绘制直线
	for (int i = 0; i < k; i++) {
		clip(-150 + dxp, 150 + dxp, -150 + dyp, 150 + dyp, line[i][0], line[i][1], line[i][2], line[i][3]);
	}
	glFlush();
}

int main(int argc, char** argv) {
	cout << "按住鼠标左键画线，按住鼠标右键拖动裁剪窗口";
	// 初始化一个glut
	// 初始化显示模式
	glutInit(&argc, argv);
	glutInitDisplayMode(GLUT_SINGLE | GLUT_RGB);

	// 初始化窗口
	// 设置显示窗口的初始化宽度和高度的像素数
	glutInitWindowSize(w, h);
	// 设置显示窗口的左上角应该在屏幕左上角向右100个像素，屏幕上边界向下100个像素的位置上
	glutInitWindowPosition(100, 100);
	glutCreateWindow("实验二：裁剪算法");

	init();
	glutReshapeFunc(reshape);
	// 调用函数，但是窗口还没有出现在屏幕上，我们需要另一个GLUT函数来完成窗口处理操作
	glutDisplayFunc(display);
	glutMouseFunc(myMouse);
	glutMotionFunc(myMotion);

	// 开始主循环绘制
	// 该函数必须是最后一个
	glutMainLoop();
	return 0;
}




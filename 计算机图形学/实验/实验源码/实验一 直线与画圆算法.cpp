#include <bits/stdc++.h>
#include <GL/glut.h>
#include <cmath>
const int N = 1000;
using namespace std;

int line[N][4], k = 0;
int w = 500, h = 500, mode = 0;//mode:绘制模式，共三种
int x1, yl, x2, y2;
int x3, y3, r;//r：圆的半径

void cirpot(int x3, int y3, int x, int y) {//绘制圆上的点
	//改进的中点画圆法－Bresenham算法，利用圆的八分对成性
	glVertex2d(x3 + x, y3 - y);
	glVertex2d(x3 + x, y3 + y);
	glVertex2d(x3 - x, y3 - y);
	glVertex2d(x3 - x, y3 + y);
	glVertex2d(x3 + y, y3 + x);
	glVertex2d(x3 + y, y3 - x);
	glVertex2d(x3 - y, y3 - x);
	glVertex2d(x3 - y, y3 + x);
}

void display() {//三种画图算法的处理逻辑
	if (mode == 2) {//BresenhamLine画线算法
		//判断e=d-0.5的正负来决定
		//若e>0,则(x,y)更新为(x+1,y+1)
		//否则(x,y)更新为(x+1,y)
		glClear(GL_COLOR_BUFFER_BIT);//用当前值清除缓冲区
		for (int i = 0; i < k; i++) {
			glBegin(GL_POINTS);//定义一个原始顶点
			glColor3f(0, 1, 0);//设置颜色模式 绿色
			x1 = line[i][0];
			yl = line[i][1];
			x2 = line[i][2];
			y2 = line[i][3];
			int dx = x2 - x1, dy = y2 - yl, e, x, y;
			int ux = dx > 0 ? 1 : -1;
			int uy = dy > 0 ? 1 : -1;
			//dx:Δx，dy:Δy
			dx = abs(x2 - x1);
			dy = abs(y2 - yl);
			x = x1;
			y = yl;
			if (dx > dy) {
				//e初始值为-Δx
				e = -dx;
				while (x != x2 + ux) {
					glVertex2d(x, y);
					//每走一步有e=e+2Δy
					e += 2 * dy;
					if (e > 0) {
						if (y != y2) {
							y += uy;
						}
						//if(e>0)then e=e-2Δx
						e = e - 2 * dx;
					}
					x += ux;
				}
			}
			else {//dx <= dy
				e = -dy;
				while (y != y2 + uy) {
					glVertex2d(x, y);
					e += 2 * dx;
					if (e > 0) {
						if (x != x2) {
							x += ux;
						}
						e = e - 2 * dy;
					}
					y += uy;
				}
			}
			glEnd();

		}
		glutSwapBuffers();
	}
	if (mode == 1) {//DDA(数值微分法)画线算法
		glClear(GL_COLOR_BUFFER_BIT);//用当前值清除缓冲区
		for (int i = 0; i < k; i++) {
			glBegin(GL_POINTS);//定义一个原始顶点
			glColor3f(1, 0, 0);//设置颜色模式 红色
			int step;
			float x, y, dx, dy;
			x1 = line[i][0];
			yl = line[i][1];
			x2 = line[i][2];
			y2 = line[i][3];
			//step:增量，只需计算一个加法
			if (abs(x2 - x1) >= abs(yl - y2))
				step = abs(x2 - x1);
			else
				step = abs(y2 - yl);
			dx = float(1.0 * (x2 - x1) / step);
			dy = float(1.0 * (y2 - yl) / step);
			x = x1;
			y = yl;
			glVertex2d(x, y);

			for (int i = 0; i < step; i++) {
				x = x + dx;
				y = y + dy;
				glVertex2d(x, int(y + 0.5));
			}
			glEnd();

		}
		glutSwapBuffers();
	}
	if (mode == 3) {//画圆算法
		glClear(GL_COLOR_BUFFER_BIT);//用当前值清除缓冲区
		glBegin(GL_POINTS);//定义一个原始顶点
		glColor3f(0, 2, 1);//设置颜色模式 
		int x = 0, y = int(r), e = 1 - int(r);
		cirpot(x3, y3, x, y);//绘制圆上的点
		while (x < y) {
			if (e < 0) {
				e += 2 * x + 3;
			}
			else {
				e += 2 * (x - y) + 5;
				y--;
			}
			x++;
			////改进的中点画圆法－Bresenham算法，利用圆的八分对成性
			cirpot(x3, y3, x, y);
		}
		glEnd();//结束顶点定义
		glutSwapBuffers();//交换缓冲指针
	}
	glFlush();//清空缓冲区，将指令送往缓硬件立即执行，将命令传送完毕之后立即返回
}

void mykeyboard(unsigned char key, int x, int y) {//处理控制台键盘交互 用户输入
	mode = key - '0';
}

void mymouse(int button, int state, int x, int y) {//处理控制台鼠标交互 用户点击
	//按下左键，起始坐标（画线算法）
	if (state == GLUT_DOWN && button == GLUT_LEFT_BUTTON) {
		line[k][0] = x;
		line[k][1] = h - y;
	}
	//松开左键，结束坐标（画线算法）
	if (state == GLUT_UP && button == GLUT_LEFT_BUTTON) {
		line[k][2] = x;
		line[k][3] = h - y;
		k++;
		glutPostRedisplay();
	}
	//按下右键，选中所画圆的圆心坐标（画圆算法）
	if (state == GLUT_DOWN && button == GLUT_RIGHT_BUTTON) {
		x3 = x;
		y3 = h - y;
	}
	//松开左键，指定所画圆的半径（画圆算法）
	if (state == GLUT_UP && button == GLUT_LEFT_BUTTON) {
		r = pow((x - x3)*(x - x3) + (h - y - y3)*(h - y - y3), 0.5);
		glutPostRedisplay();
	}
}

void mymotion(int x, int y) {
	//鼠标在窗口中按下并移动时调用
	line[k][2] = x;
	line[k][3] = h - y;
	r = pow((x - x3) ^ 2 + (h - y - y3) ^ 2, 0.5);
	glutPostRedisplay();
}

void init() {
	glClearColor(0.1, 0.1, 0.4, 0.0);
	glShadeModel(GL_SMOOTH);
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	gluOrtho2D(-1, 1, -1, 1);
}

void reshape(int w, int h) {

	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	gluOrtho2D(0, w, 0, h);
	glViewport(0, 0, w, h);
	glMatrixMode(GL_MODELVIEW);
}

int main(int argc, char** argv) {

	cout << "输入1采用DDA算法画线\n输入2采用Bresenham算法画线\n输入3采用画圆算法画圆：鼠标右键确定圆心  左键确定半径" << endl;
	//初始化显示模式
	glutInit(&argc, argv);
	glutInitDisplayMode(GLUT_SINGLE | GLUT_RGB);

	//初始化窗口配置
	glutInitWindowSize(w, h);
	glutInitWindowPosition(100, 100);
	glutCreateWindow("实验一：直线与画圆算法");

	init();
	//配置（绑定）各个功能函数
	glutReshapeFunc(reshape);
	glutDisplayFunc(display);
	glutKeyboardFunc(mykeyboard);
	glutMouseFunc(mymouse);
	glutMotionFunc(mymotion);

	//开始主循环绘制，进入glut事件处理循环
	glutMainLoop();
	return 0;
}
#include <iostream>
#include <string>
#include <stack>
using namespace std;
const int maxSize = 100;
typedef struct
{
	int x,y;
}point;
typedef struct
{
	int x,y;
	int dir; 
}Elem;
typedef struct
{
	Elem data[maxSize];
	int top;
}smStack;
typedef struct 
{
	int addX,addY;
}direction;  

void initStack(smStack &S)
{
	S.top=-1;
}

bool StackEmpty(smStack S)
{
	if(S.top==-1) 
	    return true;
	else 
	    return false;
}

bool pushIn(smStack &S,Elem x)
{
	if(S.top==maxSize-1) return false;
	S.top++;
	S.data[S.top]=x; 
	return true;
}

bool popOut(smStack &S,Elem &x)
{
	if(S.top==-1) return false;
	x=S.data[S.top--]; 
	return false;
}
bool findpath(int maze[10][10],direction direct[],smStack &S){
	Elem temp;
	int x,y,dir;
	int nowX,nowY;
	maze[1][1]=-1;
	temp={1,1,-1}; 
	pushIn(S,temp);
	while(!StackEmpty(S))
	{
		popOut(S,temp);
		x=temp.x; y=temp.y; dir=temp.dir+1;
		while(dir<4)
		{
			nowX=x+direct[dir].addX;
			nowY=y+direct[dir].addY;
			if(maze[nowX][nowY]==0){
                temp={x,y,dir};
				pushIn(S,temp);
				x=nowX; y=nowY; maze[x][y]=-1;
				if(x==8&&y==8) return true; 
				else dir=0;
			}
			else{
				dir++;
			}
		}
	}
	return false;
	 
} 
int main()
{
	smStack S;
	int maze[10][10];
	string str[10];
	cout<<"Input"<<endl;
	for(int i=0;i<10;++i)
	{
		cin>>str[i];
	}
	for(int i=0;i<10;++i)
	{
		for(int j=0;j<10;++j)
		{
			maze[i][j]=str[i][j]-'0';
		}
	}
	direction direct[4]={{0,1},{1,0},{0,-1},{-1,0}};
	initStack(S);
    bool y=findpath(maze,direct,S);
    cout<<"Output"<<endl;
    stack<point> pathStack;
    point temp;
    temp.x=8;temp.y=8;
    pathStack.push(temp);
    for(;S.top!=-1;--S.top)
	{
		point temp;
		temp.x=S.data[S.top].x;
		temp.y=S.data[S.top].y;
		pathStack.push(temp);
	}
	int size=pathStack.size();
	for(int i=0;i<size;++i)
	{
		cout<<'('<<pathStack.top().x<<','<<pathStack.top().y<<')'<<endl;
		pathStack.pop();
	}
    cout<<"End";
    return 0;
}

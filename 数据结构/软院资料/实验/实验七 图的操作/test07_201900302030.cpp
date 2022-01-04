#include <iostream>
#include <queue>
#include <cstdio>
#include <stdlib.h>
#include <string.h> 
#include <string> 
#include <vector>
#include <algorithm>
using namespace std;
int num_01,num_02,array_01[11][11],array_02[11],require[11],bfs_require[11],dfs_require[11];
int check_count{0};
void bfs_func(int valueIn)
{
	int count{1};
	queue<int> queue_00;
	bfs_require[valueIn]=1;
	queue_00.push(valueIn);
	cout<<'1'<<",";
	while(!queue_00.empty())
	{
		int w=queue_00.front();
		queue_00.pop();
		for(int u{1};u<=num_01;++u)
			if(array_01[w][u]!=0&&bfs_require[u]==0)
			{
				queue_00.push(u);
				++count;
				if(count==check_count)cout<<u<<endl;
				else cout<<u<<',';
				bfs_require[u]=1;
			}
	}
}
void dfs_func(int valueIn)
{
	dfs_require[valueIn]=1;
	++check_count;
	for(int k{1};k<=num_01;++k)
	{
		if(array_01[valueIn][k]!=0&&dfs_require[k]==0)dfs_func(k);	
	}
}
void min_path()
{
	for(int i{2};i<=num_01;++i)
	{
		if(array_01[1][i]!=0)array_02[i]=array_01[1][i];
		else array_02[i]=99999;
	}
	require[1]=1;
    	for(int i{1};i<=num_01;++i)
		{
        int temp{99999},u{1};
        for(int j{1};j<=num_01;++j)
		{
            if(require[j]==0&&array_02[j]<temp)
			{
                temp=array_02[j];
                u=j;
            }
        }
        require[u]=1;
        for(int j=1;j<=num_01;j++)
            if(require[j]==0&&array_01[u][j]!=0)
            	if(array_02[j]>array_02[u]+array_01[u][j])
				array_02[j]=array_02[u]+array_01[u][j];

	}
	cout<<array_02[num_01]<<endl;
}
int main(int argc, char *argv[])
{
	cout<<"Input"<<endl;
	char char_00;
	cin>>num_01>>char_00>>num_02;
	int tempA,tempB,tempC;
	for(int i=1;i<=num_02;i++)
	{
		cin>>tempA>>char_00>>tempB>>char_00>>tempC;
		array_01[tempA][tempB]=array_01[tempB][tempA]=tempC;
	}
	cout<<"Output"<<endl;
	dfs_func(1);
	bfs_func(1);	
	for(int i=1,j=1;i<=num_01;i++){
		if(dfs_require[i]!=0){
			if(j==check_count)
			{
				cout<<i<<endl;
				break;
			}
			else cout<<i<<",";
			++j;
		}
	}
	if(bfs_require[num_01]==0)cout<<'0'<<endl;
	else min_path();
	cout<<"End"<<endl;
	return 0;
} 

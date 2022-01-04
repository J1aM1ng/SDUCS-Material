#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
#include <iomanip>
using namespace std;
const int n_max=10000;
int a[n_max], n;
int b[n_max],previous[n_max], in[n_max], pren_01, inn_01;
struct tree_Node
{
	int data;
	struct tree_Node *leftChi, *rightChi;
};
tree_Node *nodeInsert(tree_Node *result, int value)
{
	if (result == NULL)
	{
		result = (tree_Node*)malloc(sizeof(tree_Node));
		result->data = value;
		result->leftChi = result->rightChi = NULL;
	}
	else if (value == result->data) return result;
	else if (value < result->data) result->leftChi = nodeInsert(result->leftChi, value);
	else result->rightChi = nodeInsert(result->rightChi, value);
	return result;
}
void Previous(tree_Node *result)
{
	if (result == NULL) return;
	previous[pren_01++] = result->data;
	Previous(result->leftChi);
	Previous(result->rightChi);
}
void plugIn(tree_Node *result)
{
	if (result == NULL) return;
	plugIn(result->leftChi);
	in[inn_01++] = result->data;
	plugIn(result->rightChi);
}
void nodeShift()
{
	int temp, update;
	while (1)
	{
		update = 0;
		for (int i = n / 2; i >= 1; --i)
		{
			int rightSon = 2 * i + 1;
			if (rightSon <= n && a[rightSon] > a[i])
			{
				temp = a[i];
				a[i] = a[rightSon];
				a[rightSon] = temp;
				update = 1;
			}
			int leftSon = 2 * i;
			if (a[leftSon] > a[i] && leftSon <= n)
			{
				temp = a[i];
				a[i] = a[leftSon];
				a[leftSon] = temp;
				update = 1;
			}
		}
		if (!update) break;
	}
}
int main()
{
	cout<<"Input"<<endl;
	while (cin>>a[n+1] && a[n+1])++n;
	cout<<"Output"<<endl;
	tree_Node *result = NULL;
	for (int i = 1; i <= n; ++i)
	{
		result = nodeInsert(result, a[i]);
	}
	nodeShift();
	for (int j = 1; j <= n; ++j)
	{
		cout<<a[j]<<(j == n ? '\n' : ',');
	}
	int count = 0;
	while (n > 0)
	{
		b[++count] = a[1];
		a[1] = a[n];
		--n;
		nodeShift();
	}
	for (int i = count; i >= 1; --i)
	{
		cout<<b[i]<<(i == 1 ? '\n' : ',');
	}
	Previous(result);
	plugIn(result);
	for (int i = 0; i < pren_01; i++)
	{
		cout<<previous[i]<<(i == pren_01 - 1 ? '\n' : ',');
	}
	for (int i = 0; i < inn_01; i++)
	{
		cout<<in[i]<<(i == inn_01 - 1 ? '\n' : ',');
	}
	cout<<"End"<<endl;
	return 0;
}

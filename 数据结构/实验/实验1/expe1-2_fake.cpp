#include <iostream>
#include <vector>
using namespace std;
int n;
template<class T>
void Swap(T &a, T &b) {
    T tmp = a;
    a = b;
    b = tmp;
}
template<class T>
void permutations(T list[],int k,int m) {
    // 生成list[k:m]的所有排列
    // 排列的前缀为list[0:k-1],后缀为list[k:m]
    if(k == m) {
        // 此时，仅有前缀，仅有一个排列，输出它
        for(int i=0;i<=m;i++) {
            cout<<list[i];
        }
        cout<<endl;
    } else {
        // list[k:m]有多于一个的排列，递归地（向后）生成这些排列，不断加长前缀，减短后缀
        for(int i=k;i<=m;i++) {
            // 交换元素ek和ei
            Swap(list[k],list[i]);
            // 调用permutations计算ei*perm(Ei)，最终开出n个分支，分别是第[0:n-1]个数为前缀，后面的数为后缀的排列
            // 这n个分支再进行递归，最终求出各个排列
            permutations(list,k+1,m);
            // 将list[k:m]恢复到第一个swap调用之前的状态，表明已经生成了第i个数为前缀的所有排列，已经递归跳回来
            // 准备下一轮for循环时，再以下一个数（第i+1个数）为前缀，递归地生成排列
            Swap(list[k],list[i]);
        }
    }
}

int main() {
    cin>>n;
    int *arr = new int[n];
    for(int i=0;i<n;i++) {
        int tmp;
        cin>>tmp;
        arr[i] = tmp;
    }
    permutations(arr, 0, n-1);
    delete[] arr;
    return 0;
}

#include <iostream>
using namespace std;
int n;
int vIndex = 0;
template<class T>
void Swap(T &a, T &b) {
    T tmp = a;
    a = b;
    b = tmp;
}
int factorial(int num)
{
    // 基本情况返回1;
    if (num == 0 || num == 1) {
        return 1;
    } else {
        int tmp = 1;
        for(int i=num;i>=1;i--) {
            tmp *= i;
        }
        return tmp;
    }
}
template<class T>
void permutations(T list[],T value[], int k,int m) {
    // 生成list[k:m]的所有排列
    // 排列的前缀为list[0:k-1],后缀为list[k:m]
    if(k == m) {
        // 此时，仅有前缀，仅有一个排列，即得到了"一个排列"
        /*for(int i=0;i<=m;i++) {
            cout<<list[i];
        }
        cout<<endl;*/
        int tmpValue = 0;
        for(int i=0;i<=m;i++) {
            tmpValue += (list[i] ^ (i+1));
        }
        value[vIndex] = tmpValue;
        vIndex ++;
    } else {
        // list[k:m]有多于一个的排列，递归地（向后）生成这些排列，不断加长前缀，减短后缀
        for(int i=k;i<=m;i++) {
            // 交换元素ek和ei
            Swap(list[k],list[i]);
            // 调用permutations计算ei*perm(Ei)，最终开出n个分支，分别是第[0:n-1]个数为前缀，后面的数为后缀的排列
            // 这n个分支再进行递归，最终求出各个排列
            permutations(list,value,k+1,m);
            // 将list[k:m]恢复到第一个swap调用之前的状态，表明已经生成了第i个数为前缀的所有排列，已经递归跳回来
            // 准备下一轮for循环时，再以下一个数（第i+1个数）为前缀，递归地生成排列
            Swap(list[k],list[i]);
        }
    }
}

int main() {
    cin>>n;
    int *arr = new int[n];
    int *value = new int[factorial(n)];
    for(int i=0;i<n;i++) {
        int tmp;
        cin>>tmp;
        arr[i] = tmp;
    }
    permutations(arr,value, 0, n-1);
    // 求所有排列的价值的或
    int orRes = 0;
    for(int i=0;i<vIndex;i++) {
        if(i == 0)orRes = value[i];
        else orRes |= value[i];
    }
    cout<<orRes;
    delete [] arr;
    delete [] value;
    return 0;
}

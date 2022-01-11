//
// Created by 邵嘉明 on 2021/9/28.
//
#include <iostream>
#include <cmath>
using namespace std;
int n;
int vIndex = 0;
template<class T>
void subSet(T arr[], T Sup[], T value[], int index) {
    // arr: 待求子集的数组
    // Sup: 辅助数组，bitset
    // value: （子集）价值数组
    // index: 当前求二进制数求到数组中那个数的索引
    for(int i=0;i<=1;i++) {
        Sup[index] = i;
        if(index == n-1) {
            // 递归已到头，对任意元素，其sup[]均已赋值0/1，求出每个子集的价值放入其对应value[]项中
            // 某子集的异或值
            int tmpSum = 0;
            // 子集数组
            int *tmp = new int[n];
            // 子集数组索引
            int tmpIndex = 0;
            // 得到一个子集
            for(int j=0;j<n;j++) {
                if(Sup[j] == 1) {
                    tmp[tmpIndex] = arr[j];
                    ++ tmpIndex;
                }
            }
            for(int j=0;j<tmpIndex;j++) {
                tmpSum += (tmp[j] * (j+1));
            }
            value[vIndex] = tmpSum;
            vIndex ++;
            delete[] tmp;
        } else {
            // 继续递归，对下一个元素的sup[]赋值
            subSet(arr, Sup,value, index+1);
        }
        // 递归退回，重置后等待下一个for循环使该递归层次的元素的sup取下一个值
        // 并重复以上递归过程，相当于以该层递归所属元素开始，对后面的元素的sup[]依次取0/1
        Sup[index] = -1;
    }
}
int main() {
    cin>>n;
    int *arr = new int[n];
    int *value = new int[(int)(pow(2.0,n))];
    for(int i=0;i<n;i++) {
        int tmp;
        cin>>tmp;
        arr[i] = tmp;
    }
    int *sup = new int[n];
    subSet<int>(arr,sup,value, 0);
    int xorSum = 0;
    // 求异或（按位异或）
    for(int i=0;i<(int)(pow(2,n));i++) {
        if(i == 0) {
            xorSum = value[i];
        }
        else {
            xorSum ^= value[i];
        }
    }
    cout<<xorSum;
    delete[] arr;
    delete[] value;
    return 0;
}



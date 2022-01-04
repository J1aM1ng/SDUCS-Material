//
// Created by 邵嘉明 on 2021/9/28.
//
#include <iostream>
#include <vector>
using namespace std;
int n;

template<class T>
void subSet(T arr[], T Sup[], int index) {
    // arr: 待求子集的数组
    // sup: 辅助数组，bitset
    // index: 当前求二进制数求到数组中那个数的索引
    for(int i=0;i<=1;i++) {
        Sup[index] = i;
        if(index == n-1) {
            // 递归已到头，对任意元素，其sup[]均已赋值0/1，输出该子集
            cout<<"( ";
            for(int j=0;j<n;j++) {
                if(Sup[j] == 1) {
                    cout<<arr[j]<<" ";
                }
            }
            cout<<")\n";
        } else {
            // 继续递归，对下一个元素的sup[]赋值
            subSet(arr, Sup, index+1);
        }
        // 递归退回，重置后等待下一个for循环使该递归层次的元素的sup取下一个值
        // 并重复以上递归过程，相当于以该层递归所属元素开始，对后面的元素的sup[]依次取0/1
        Sup[index] = -1;
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
    int *sup = new int[n];
    subSet<int>(arr,sup, 0);
    delete[] arr;
    return 0;
}



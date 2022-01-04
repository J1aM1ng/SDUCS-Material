#include<iostream>
using namespace std;
// 前序
int preOrder[100000];
// 中序
int inOrder[100000];
// 后序
void postOrder(int pre, int post, int n) {
    // 直接输出
    if (n == 1) {
        cout << preOrder[pre]<<" ";
        return;
    }
    // 异常情况
    if (n == 0) return;
    int i = 0;
    // 找到根节点，i即为根节点在中序序列中的索引
    for (; preOrder[pre] != inOrder[post + i]; i++);
    // 分治，递归DFS
    // 实际上是递归地对左子树和右子树分别DFS，将前序改为后序
    postOrder(pre + 1, post, i);
    postOrder(pre + i + 1, post + i + 1, n - i - 1);
    cout << preOrder[pre]<<" ";
}

int main() {
    // 节点数
    int n;
    cin >> n;
    for (int i = 0; i < n; i++) {
        cin >> preOrder[i];
    }
    for (int i = 0; i < n; i++) {
        cin >> inOrder[i];
    }
    postOrder(0, 0, n);
    return 0;
}


#include <iostream>
using namespace std;
template <class T>
// 二叉搜索树节点
struct binarySearchNode{
    T element;
    // 左右子树指针
    binarySearchNode<T>* leftChild;
    binarySearchNode<T>* rightChild;
    int noteSize;
    binarySearchNode(const T& theElement) {
        element = theElement;
        leftChild = NULL;
        rightChild = NULL;
        noteSize = 0;
    }
    // 通过leftTreeSize初始化
    binarySearchNode(const T& theElement, binarySearchNode<T>* theLeft, binarySearchNode<T>* theRight, int LeftTreeSize){
        element = theElement;
        leftChild = theLeft;
        rightChild = theRight;
        noteSize = LeftTreeSize;
    }
};
// 二叉搜索树
template <class T>
class binarySearchTree{
public:
    binarySearchTree(){
        root = NULL;
        size = 0;
    }
    int insert(const T& theElement);
    int erase(const T& theElement);
    int eraseByRank(int a);
    int find(const T& theElement);
    int Search(int a);
private:
    // 根节点
    binarySearchNode<T>* root;
    // 二叉搜索树元素数
    int size;
};
// 插入
template <class T>
int binarySearchTree<T>::insert(const T& theElement){
    // 首先进行搜索
    // 插入一个数对theElement，如果存在关键字相同的数对，则覆盖
    // 搜索指针
    binarySearchNode<T>* p = root;
    // p的父节点指针
    binarySearchNode<T>* pp = NULL;
    // 操作过程中元素的异或值
    int sum = 0;
    // 寻找插入点
    while (p != NULL){
        // 待插入元素大于当前元素
        if (p->element < theElement){
            sum ^= p->element;
            pp = p;
            // 搜索右子树
            p = p->rightChild;
        } else if (p->element > theElement) {
            // 待输入元素小于当前元素
            sum ^= p->element;
            pp = p;
            // 搜索左子树
            p = p->leftChild;
        } else if (p->element == theElement) {
            // 相等则返回
            return 0;
        }
    }
    // 创建新节点
    binarySearchNode<T>* newNode = new binarySearchNode<T>(theElement);
    if (pp != NULL){
        // 根据保存的pp来插入新节点
        if (theElement > pp->element)
            pp->rightChild = newNode;
        else if (theElement < pp->element)
            pp->leftChild = newNode;
    } else {
        // 二叉搜索树为空，新元素作根节点
        root = newNode;
    }
    size++;
    p = root;
    // 更新noteSize
    while (p->element != theElement) {
        if (p->element < theElement) {
            p = p->rightChild;
        } else if (p->element > theElement) {
            // 该节点左子树节点个数++
            p->noteSize++;
            p = p->leftChild;
        }
    }
    return sum;
}
// 删除
template <class T>
int binarySearchTree<T>::erase(const T& theElement) {
    // 首先进行搜索
    // 搜索指针
    binarySearchNode<T>* p = root;
    // p的父节点指针
    binarySearchNode<T>* pp = NULL;
    // 操作过程中元素的异或值
    int sum = 0;
    // 直至找到该元素
    while (p != NULL && p->element != theElement) {
        // 异或
        sum ^= p->element;
        // 移动到p的孩子
        pp = p;
        // 若待删除元素大于当前元素，则从右子树继续找
        if (p->element < theElement) {
            p = p->rightChild;
        } else if (p->element > theElement) {
            // 若待删除元素小于当前元素，则从左子树继续找
            p = p->leftChild;
        }
    }
    // 没找到
    if (p == NULL) {
        return 0;
    }
    // 最后把p指向的元素也异或一下
    sum ^= p->element;
    p = root;
    while (p != NULL && p->element != theElement) {
        if (p->element < theElement) {
            p = p->rightChild;
        } else if (p->element > theElement) {
            // 该节点左子树节点个数--
            p->noteSize--;
            p = p->leftChild;
        }
    }
    // 对二叉搜索树进行重构
    // 若p有两个孩子
    if (p->leftChild != NULL && p->rightChild != NULL) {
        // 在p的左子树中寻找最大元素来代替p的位置
        binarySearchNode<T>* ps = p->rightChild;
        // ps的父节点
        binarySearchNode<T>* s = p;
        // 由于二叉搜索树结构的性质，循环一直移动到最大元素时才停
        while (ps->leftChild != NULL) {
            ps->noteSize--;
            s = ps;
            ps = ps->leftChild;
        }
        // 以ps所指元素建立新元素
        binarySearchNode<T>* newNode = new binarySearchNode<T>(ps->element, p->leftChild, p->rightChild, p->noteSize);
        // 空树，则以新节点为根
        if (pp == NULL)
            root = newNode;
        // 确定新节点放置的位置，和父节点的左子树相等的话赋给左子树
        else if (p == pp->leftChild)
            pp->leftChild = newNode;
        // 其余情况一律放到右子树
        else
            pp->rightChild = newNode;
        // p指向新的删除节点ps，pp是p的父节点
        if (s == p)
            pp = newNode;
        else
            pp = s;
        delete p;
        p = ps;
    }
    // p最多有一个孩子
    // 用c保存孩子指针
    binarySearchNode<T>* c;
    if (p->leftChild != NULL)
        c = p->leftChild;
    else
        c = p->rightChild;
    // 删除p
    // 若为根，则用其孩子覆盖自身即可
    if (p == root)
        root = c;
    else {
        // 判断p是pp的左孩子还是右孩子，然后给pp的指针绑上
        if (p == pp->leftChild)
            pp->leftChild = c;
        else
            pp->rightChild = c;
    }
    size--;
    delete p;
    return sum;
}
// 按名次删除
template <class T>
int binarySearchTree<T>::eraseByRank(int a) {
    // 首先进行搜索
    // 搜索指针
    binarySearchNode<T>* p = root;
    // p的父节点指针
    binarySearchNode<T>* pp = NULL;
    // 异或和
    int sum = 0;
    // noteSize即为该节点在二叉搜索树中的名次
    while (p != NULL && p->noteSize != a) {
        // 异或
        sum ^= p->element;
        // 下移
        pp = p;
        if (p->noteSize > a) {
            // 名次小于当前值，则去左子树继续找
            p = p->leftChild;
        } else if (p->noteSize < a) {
            // 名次大于当前值，则去右子树继续找
            // 重新计算名次（根据二叉搜索树的结构性质）
            a = a - p->noteSize - 1;
            p = p->rightChild;
        }
    }
    // 空树，直接返回，没什么好删的
    if (p == NULL)
        return 0;
    // 将最后的p也异或上
    sum ^= p->element;
    int theElement = p->element;
    p = root;
    // 重新计算noteSize
    while (p != NULL && p->element != theElement) {
        if (p->element < theElement) {
            p = p->rightChild;
        } else if (p->element > theElement) {
            // noteSize --
            p->noteSize--;
            p = p->leftChild;
        }
    }
    // 对二叉搜索树进行重构
    // 若p有两个孩子
    if (p->leftChild != NULL && p->rightChild != NULL) {
        // 在p的左子树中寻找最大元素来代替p的位置
        binarySearchNode<T>* ps = p->rightChild;
        // ps的父节点
        binarySearchNode<T>* s = p;
        while (ps->leftChild != NULL) {
            ps->noteSize--;
            s = ps;
            ps = ps->leftChild;
        }
        binarySearchNode<T>* newNode = new binarySearchNode<T>(ps->element, p->leftChild, p->rightChild, p->noteSize);
        if (pp == NULL)
            root = newNode;
        else if (p == pp->leftChild)
            pp->leftChild = newNode;
        else
            pp->rightChild = newNode;

        if (s == p)
            pp = newNode;
        else
            pp = s;
        delete p;
        p = ps;
    }
    binarySearchNode<T>* c;
    if (p->leftChild != NULL)
        c = p->leftChild;
    else
        c = p->rightChild;
    if (p == root)
        root = c;
    else {
        if (p == pp->leftChild)
            pp->leftChild = c;
        else
            pp->rightChild = c;
    }
    size--;
    delete p;
    return sum;
}
// 查找
template <class T>
int binarySearchTree<T>::find(const T& theElement) {
    // 搜索指针，从根节点开始
    binarySearchNode<T>* p = root;
    // 异或
    int sum = 0;
    while (p != NULL && p->element != theElement) {
        sum ^= p->element;
        // 待搜索节点小于当前节点，则从左子树继续
        if (p->element > theElement) {
            p = p->leftChild;
        } else if (p->element < theElement) {
            // 待搜索节点大于当前节点，则从右子树继续
            p = p->rightChild;
        }
    }
    // 空树
    if (p == NULL)
        return 0;
    else {
        // 异或当前节点后输出
        sum ^= p->element;
        return sum;
    }
}
// 按名次查找
template <class T>
int binarySearchTree<T>::Search(int a) {
    // 搜索指针
    binarySearchNode<T>* p = root;
    // 异或
    int sum = 0;
    // noteSize === 名次
    while (p != NULL && p->noteSize != a) {
        sum ^= p->element;
        if (p->noteSize > a) {
            // 待搜索名次小于当前节点的名次，则从左子树继续找
            p = p->leftChild;
        } else if (p->noteSize < a) {
            // 待搜索名次大于当前节点的名次，则从右子树继续找，并重新计算名次（右子树中名次和左子树中规则不同）
            a = a - p->noteSize - 1;
            p = p->rightChild;
        }
    }
    // 空树
    if (p == NULL)
        return 0;
    else {
        // 异或当前节点后输出
        sum ^= p->element;
        return sum;
    }
}
int main(){
    // 二叉搜索树
    binarySearchTree<int> x;
    // m个操作，a和b为每个操作包含的两个数字
    int m, a, b;
    cin >> m;
    for(int i=0;i<m;i++) {
        cin >> a >> b;
        if (a == 0){
            // 插入
            cout << x.insert(b) << endl;
        } else if (a == 1) {
            // 查找
            cout << x.find(b) << endl;
        } else if (a == 2) {
            // 删除
            cout << x.erase(b) << endl;
        } else if (a == 3) {
            // 按名次查找
            b = b - 1;
            cout << x.Search(b) << endl;
        } else if (a == 4) {
            // 按名次删除
            b = b - 1;
            cout << x.eraseByRank(b) << endl;
        }
    }
    return 0;
}


#include <iostream>
using namespace std;
const int SIZE = 100001;
template<class T>
// 二叉树
class binaryTree {
public:
    virtual ~binaryTree() {}
    virtual bool empty() const = 0;
    virtual int size() const = 0;
    virtual void preOrder(void (*) (T*)) = 0;
    virtual void inOrder(void (*) (T*)) = 0;
    virtual void postOrder(void (*) (T*)) = 0;
    virtual void levelOrder(void (*) (T*)) = 0;
};
template<class T>
class queue {
public:
    virtual ~queue() {}
    virtual bool empty() const = 0;
    virtual int size() const = 0;
    virtual T& front() = 0;
    virtual T& back() = 0;
    virtual void pop() = 0;
    virtual void push(const T& theElement) = 0;
};
template<class T>
class arrayQueue : public queue<T> {
public:
    arrayQueue(int initialCapacity = 10);
    ~arrayQueue() { delete[] queue; }
    bool empty() const { return theFront == theBack; }
    int size() const
    {
        return (theBack - theFront + arrayLength) % arrayLength;
    }
    T& front()
    {
        return queue[(theFront + 1) % arrayLength];
    }
    T& back()
    {
        return queue[theBack];
    }
    void pop()
    {
        theFront = (theFront + 1) % arrayLength;
        queue[theFront].~T();
    }
    void push(const T& theElement);
private:
    int theFront;
    int theBack;
    int arrayLength;
    T* queue;
};
template<class T>
arrayQueue<T>::arrayQueue(int initialCapacity)
{
    arrayLength = initialCapacity;
    queue = new T[arrayLength];
    theFront = 0;
    theBack = 0;
}
template<class T>
void arrayQueue<T>::push(const T& theElement)
{
    if ((theBack + 1) % arrayLength == theFront)
    {
        T* newQueue = new T[2 * arrayLength];

        int start = (theFront + 1) % arrayLength;
        if (start < 2)

            copy(queue + start, queue + start + arrayLength - 1, newQueue);
        else
        {
            copy(queue + start, queue + arrayLength, newQueue);
            copy(queue, queue + theBack + 1, newQueue + arrayLength - start);
        }

        theFront = 2 * arrayLength - 1;
        theBack = arrayLength - 2;
        arrayLength *= 2;
        queue = newQueue;
    }

    theBack = (theBack + 1) % arrayLength;
    queue[theBack] = theElement;
}
template <class T>
// 二叉树节点
struct binaryTreeNode {
    T element;
    binaryTreeNode<T>* leftChild,
            * rightChild;

    binaryTreeNode() { leftChild = rightChild = NULL; }
    binaryTreeNode(const T& theElement) :element(theElement) {
        leftChild = rightChild = NULL;
    }
    binaryTreeNode(const T& theElement,
                   binaryTreeNode* theLeftChild,
                   binaryTreeNode* theRightChild)
            :element(theElement) {
        leftChild = theLeftChild;
        rightChild = theRightChild;
    }
};
struct booster {
    int degradeToLeaf,
            degradeFromParent;
    bool boosterHere;
    void output(ostream& out) const
    {
        out << boosterHere << ' ' << degradeToLeaf << ' '
            << degradeFromParent << ' ';
    }
};
ostream& operator<<(ostream& out, booster x) {
    x.output(out); return out;
}
// 链表存储的二叉树
template<class E>
class linkedBinaryTree : public binaryTree<binaryTreeNode<E> > {
public:
    linkedBinaryTree() { root = NULL; treeSize = 0; }
    ~linkedBinaryTree() { erase(); };
    bool empty() const { return treeSize == 0; }
    int size() const { return treeSize; }
    E* rootElement() const;
    void makeTree(const E& element,
                  linkedBinaryTree<E>&, linkedBinaryTree<E>&);
    linkedBinaryTree<E>& removeLeftSubtree();
    linkedBinaryTree<E>& removeRightSubtree();
    // 前序
    void preOrder(void(*theVisit)(binaryTreeNode<E>*)) {
        visit = theVisit; preOrder(root);
    }
    // 中序
    void inOrder(void(*theVisit)(binaryTreeNode<E>*)) {
        visit = theVisit; inOrder(root);
    }
    // 后序
    void postOrder(void(*theVisit)(binaryTreeNode<E>*)) {
        visit = theVisit; postOrder(root);
    }
    // 层次
    void levelOrder(void(*theVisit)(binaryTreeNode<E>*));
    void preOrderOutput() { preOrder(output); cout << endl; }
    void inOrderOutput() { inOrder(output); cout << endl; }
    void postOrderOutput() { postOrder(output); cout << endl; }
    void levelOrderOutput() { levelOrder(output); cout << endl; }
    void erase() {
        postOrder(dispose);
        root = NULL;
        treeSize = 0;
    }
    // 高度
    int height() const { return height(root); }
protected:
    // 根
    binaryTreeNode<E>* root;
    // 节点数
    int treeSize;
    static void (*visit)(binaryTreeNode<E>*);
    static int count;
    static void preOrder(binaryTreeNode<E>* t);
    static void inOrder(binaryTreeNode<E>* t);
    static void postOrder(binaryTreeNode<E>* t);
    // 计算二叉树节点数目
    static void countNodes(binaryTreeNode<E>* t) {
        visit = addToCount;
        count = 0;
        preOrder(t);
    }
    static void dispose(binaryTreeNode<E>* t) { delete t; }
    static void output(binaryTreeNode<E>* t) {
        if(t!=NULL)
            cout << t->element << ' ';
    }
    static void addToCount(binaryTreeNode<E>* t) {
        count++;
    }
    static int height(binaryTreeNode<E>* t);
};

template<class T>
void (*linkedBinaryTree<T>::visit)(binaryTreeNode<T>*);
template<class E>
E* linkedBinaryTree<E>::rootElement() const {
    if (treeSize == 0)
        return NULL;  // no root
    else
        return &root->element;
}
// 建立子树
template<class E>
void linkedBinaryTree<E>::makeTree(const E& element,
                                   linkedBinaryTree<E>& left, linkedBinaryTree<E>& right) {
    root = new binaryTreeNode<E>(element, left.root, right.root);
    treeSize = left.treeSize + right.treeSize + 1;
    left.root = right.root = NULL;
    left.treeSize = right.treeSize = 0;
}
template<class E>
linkedBinaryTree<E>& linkedBinaryTree<E>::removeLeftSubtree() {
    linkedBinaryTree<E> leftSubtree;
    leftSubtree.root = root->leftChild;
    count = 0;
    leftSubtree.treeSize = countNodes(leftSubtree.root);
    root->leftChild = NULL;
    treeSize -= leftSubtree.treeSize;

    return leftSubtree;
}
template<class E>
linkedBinaryTree<E>& linkedBinaryTree<E>::removeRightSubtree() {
    linkedBinaryTree<E> rightSubtree;
    rightSubtree.root = root->rightChild;
    count = 0;
    rightSubtree.treeSize = countNodes(rightSubtree.root);
    root->rightChild = NULL;
    treeSize -= rightSubtree.treeSize;

    return rightSubtree;
}
// 根左右
template<class E>
void linkedBinaryTree<E>::preOrder(binaryTreeNode<E>* t) {
    if (t != NULL) {
        linkedBinaryTree<E>::visit(t);
        preOrder(t->leftChild);
        preOrder(t->rightChild);
    }
}
// 左根右
template<class E>
void linkedBinaryTree<E>::inOrder(binaryTreeNode<E>* t) {
    if (t != NULL) {
        inOrder(t->leftChild);
        linkedBinaryTree<E>::visit(t);
        inOrder(t->rightChild);
    }
}
// 左右根
template<class E>
void linkedBinaryTree<E>::postOrder(binaryTreeNode<E>* t) {
    if (t != NULL) {
        postOrder(t->leftChild);
        postOrder(t->rightChild);
        linkedBinaryTree<E>::visit(t);
    }
}
// 用队列进行层次遍历，从根节点开始，维护一个队列，访问队首元素，并依次把其左右孩子节点放入队尾。
template <class E>
void linkedBinaryTree<E>::levelOrder(void(*theVisit)(binaryTreeNode<E>*)) {
    arrayQueue<binaryTreeNode<E>*> q;
    binaryTreeNode<E>* t = root;
    while (t != NULL) {
        theVisit(t);
        if (t->leftChild != NULL)
            q.push(t->leftChild);
        if (t->rightChild != NULL)
            q.push(t->rightChild);
        if (q.empty()) {
            return;
        } else {
            t = q.front();
            q.pop();
        }
    }
}
// max{left,right}为该树高度
template <class E>
int linkedBinaryTree<E>::height(binaryTreeNode<E>* t) {
    if (t == NULL)
        return 0;
    int hl = height(t->leftChild);
    int hr = height(t->rightChild);
    if (hl > hr)
        return ++hl;
    else
        return ++hr;
}
struct st {
    int left;
    int right;
};
int main() {
    linkedBinaryTree<int> a;
    // 节点数
    int n;
    cin >> n;
    // 链树
    linkedBinaryTree<int> t[SIZE];
    struct st s[SIZE];
    // 高度
    int height[SIZE];
    // 节点数目
    int size[SIZE];
    for (int i = 1; i <= n; i++) {
        int L, R;
        cin >> L >> R;
        s[i].left = L;
        s[i].right = R;
    }
    for (int i = n; i >= 1; i--) {
        if (s[i].left != -1 && s[i].right != -1) {
            t[i].makeTree(i, t[s[i].left], t[s[i].right]);
        } else if (s[i].left != -1 && s[i].right == -1) {
            t[i].makeTree(i, t[s[i].left], a);
        } else if (s[i].left == -1 && s[i].right != -1) {
            t[i].makeTree(i, a, t[s[i].right]);
        } else if (s[i].left == -1 && s[i].right == -1) {
            t[i].makeTree(i, a, a);
        }
        // 在建🌲的过程中维护高度和节点数
        height[i]=t[i].height();
        size[i] = t[i].size();
    }
    // 该树的层次遍历
    t[1].levelOrderOutput();
    // 节点数目
    for (int i = 1; i <= n; i++) {
        cout << size[i] << " ";
    }
    cout << endl;
    // 子树高度
    for (int i = 1; i <= n; i++) {
        cout << height[i] << " ";
    }
    return 0;
}



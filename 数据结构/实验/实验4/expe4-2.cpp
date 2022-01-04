#include<iostream>
using namespace std;
int N,M;

// 链表节点 结构体 chainNode
template <class T>
struct chainNode {
    // 数据成员
    // 数据域
    T element;
    // 后向指针域
    chainNode<T>* next;
    // 方法
    chainNode() = default;
    chainNode(const T& element) {
        this->element = element;
    }
    chainNode(const T& element, chainNode<T>* next) {
        this->element = element; this->next = next;
    }
};

// 链表类 chain
template <class T>
class chain {
public:
    // 构造函数和析构函数
    chain() {
        firstNode = NULL;
        listSize = 0;
    }
    chain(T* a, int length);
    ~chain();
    // 插入操作，在链表的 theIndex 位置插入 theElement
    void insert(int theIndex, const T& theElement);
    void listSort();
    void mergeList(chain &a, chain &b);
    // 链表开始和结束的迭代器
    class iterator;
    iterator begin() { return iterator(firstNode); }
    iterator end() { return iterator(NULL); }
    // 链表迭代器类
    class iterator {
    public:
        // C++ 需要的用于向前迭代器的 typedef
        typedef forward_iterator_tag iterator_category;
        typedef T value_type;
        typedef ptrdiff_t difference_type;
        typedef T* pointer;
        typedef T& reference;
        // 构造函数
        iterator(chainNode<T>* theNode = NULL) {
            node = theNode;
        }
        // 解引用操作符
        T& operator*() const { return node->element; }
        T* operator->() const { return &node->element; }

        // 迭代器加法操作
        iterator& operator++(){// 前置自增
            node = node->next; return *this;
        }
        iterator operator++(int) {// 后置自增
            iterator old = *this;
            node = node->next;
            return old;
        }
        // 相等检验
        bool operator!=(const iterator right) const {
            return node != right.node;
        }
        bool operator==(const iterator right) const {
            return node == right.node;
        }
    protected:
        chainNode<T>* node;
    };  // 链表迭代器类结束
protected:
    chainNode<T>* firstNode;
    int listSize;
};

template<class T>
chain<T>::chain(T* a, int length) {
    chainNode<T>* first;
    first = new chainNode<T>(a[0]);
    first->next = new chainNode<T>(a[1]);
    first->next->next = NULL;
    if (length > 1) {
        for (int i = 2; i < length; i++) {
            chainNode<T>* p = new chainNode<T>(a[i]);
            p->next = first->next;
            first->next = p;
        }
    }
    firstNode = first;
    listSize = length;
}

template <class T>
chain<T>::~chain()
{
    while (firstNode != NULL) {
        chainNode<T>* nextNode = firstNode->next;
        delete firstNode;
        firstNode = nextNode;
    }
}

template<class T>
void chain<T>::insert(int theIndex, const T& theElement) {
    if(theIndex < 0 || theIndex > listSize) return;
    if (theIndex == 0) {
        // 在链表头插入
        firstNode = new chainNode<T>(theElement, firstNode);
    } else {
        // 寻找新元素的前驱
        chainNode<T>* p = firstNode;
        for (int i = 0; i < theIndex - 1;i++)
            p = p->next;
        // 在 p 之后插入
        p->next =new chainNode<T>(theElement, p->next);
    }
    listSize++;
}

template<class T>
void chain<T>::listSort() {
    // 对链表元素进行冒泡排序，使链表变为有序链表
    if (listSize < 1) return;
    chainNode<T> *p = NULL;
    chainNode<T> *q = NULL;
    for (p = firstNode; p != NULL; p = p->next)
    {
        for (q = p->next; q != NULL; q = q->next)
        {
            if (p->element > q->element)
            {
                T tmp = q->element;
                q->element = p->element;
                p->element = tmp;
            }
        }
    }
}

template<class T>
void chain<T>::mergeList(chain &a,chain &b) {
    // 将链表 a 和 b 合并
    this->~chain();
    chain::iterator t1 = a.begin();
    chain::iterator t2 = b.begin();
    for (int i = 0; i < b.listSize; i++) {
        insert(i, *t2);
        t2++;
    }
    for (int i = 0; i < a.listSize; i++) {
        insert(i, *t1);
        t1++;
    }
    listSize = a.listSize + b.listSize;
}

int main() {
    // N为第一组整数序列的长度，M为第二组整数序列的长度
    cin >> N >> M;
    // 第一组整数序列
    int* arr1 = new int[N];
    // 第二组整数序列
    int* arr2 = new int[M];
    for (int i = 0; i < N; i++) {
        cin >> arr1[i];
    }
    for (int i = 0; i < M; i++) {
        cin >> arr2[i];
    }
    chain<int> cl1(arr1, N), cl2(arr2, M), res;
    if (N == 0) {
        // 第一组数异或和为0
        cout << 0 << endl;
    }
    else {
        // 对链表1进行排序
        cl1.listSort();
        int sum = 0, j = 0;
        // 计算链表1的对应异或和
        for (chain<int>::iterator i = cl1.begin(); i != cl1.end(); i++) {
            sum = sum + ((*i) ^ j);
            j++;
        }
        cout << sum << endl;
    }
    if (M == 0) {
        // 第二组数异或和为0
        cout << 0 << endl;
    }
    else {
        // 对链表2进行排序
        cl2.listSort();
        int sum = 0, j = 0;
        // 计算链表2的对应异或和
        for (chain<int>::iterator i = cl2.begin(); i != cl2.end(); i++) {
            sum = sum + ((*i) ^ j);
            j++;
        }
        cout << sum << endl;
    }


    if (N == 0 && M == 0) {
        // 合并后的结果链表对应异或和为0
        cout << 0 << endl;
    }
    else if (N == 0 && M != 0) {
        // 此时合并后的异或和即为链表2的异或和
        // 对链表2进行排序
        cl2.listSort();
        int sum = 0, j = 0;
        for (chain<int>::iterator i = cl2.begin(); i != cl2.end(); i++) {
            sum = sum + ((*i) ^ j);
            j++;
        }
        cout << sum << endl;
    }
    else if (N != 0 && M == 0) {
        // 此时合并后的异或和即为链表1的异或和
        // 对链表1进行排序
        cl1.listSort();
        int sum = 0, j = 0;
        for (chain<int>::iterator i = cl1.begin(); i != cl1.end(); i++) {
            sum = sum + ((*i) ^ j);
            j++;
        }
        cout << sum << endl;
    }
    else {
        // 合并链表
        res.mergeList(cl1, cl2);
        // 对结果链表进行排序
        res.listSort();
        int sum = 0, j = 0;
        // 计算结果链表对应异或和
        for (chain<int>::iterator i = res.begin(); i != res.end(); i++) {
            sum = sum + ((*i) ^ j);
            j++;
        }
        cout << sum << endl;
    }
    return 0;
}


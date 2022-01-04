#include<iostream>
using namespace std;
int N,Q;

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
        next = nullptr;
    }
    chainNode(const T& element, chainNode<T>* next) {
        this->element = element;
        this->next = next;
    }
};

// 链表类 chain
template <class T>
class chain {
public:
    // 构造函数
    chain(T* arr, int length);
    // 析构函数
    ~chain();
    // 使用链表迭代器，输出当前链表索引和链表元素的异或和
    int outputXorSum();
    // 查询操作，查询链表中某元素的索引，若链表中存在多个该元素，仅输出第一个的索引
    int indexOf(T& theElement) const;
    void reverse();
    void reverseForSort();
    // 插入操作，在链表的 theIndex 位置插入 theElement
    void insert(int theIndex, const T& theElement);
    // 删除操作，删除链表中的值为 theElement 的元素，若链表中存在多个该元素，则仅删除第一个
    void erase(T theElement);

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
        iterator& operator++() {// 前置自增
            node = node->next;
            return *this;
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
    // 链表首元素
    chainNode<T>* firstNode;
    // 链表长度
    int listSize;
};

template<class T>
chain<T>::chain(T* arr, int length) {
    chainNode<T>* first;
    first = new chainNode<T>(arr[0]);
    first->next = new chainNode<T>(arr[1]);
    first->next->next = NULL;
    if (length > 1) {
        for (int i = 2; i < length; i++) {
            chainNode<T>* p = new chainNode<T>(arr[i]);
            p->next = first->next;
            first->next = p;
        }
    }
    firstNode = first;
    listSize = length;
}

template <class T>
chain<T>::~chain()
{// 链表析构函数 删除链表的所有节点
    while (firstNode != NULL) {
        // 删除首节点
        chainNode<T>* nextNode = firstNode->next;
        delete firstNode;
        // 将首节点的后继节点赋给首节点指针，循环执行删除、赋地址操作
        // 直至首节点指针为 NULL 即链表为空
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
void chain<T>::erase(T theElement)
{
    chainNode<T>* p;
    // 若要删除的元素是首节点
    if (firstNode->element == theElement)
    {
        p = firstNode;
        firstNode = firstNode->next;
        delete p;
        listSize--;
        return;
    }
    // 若要删除的元素不是首节点，用迭代器遍历寻找该元素的前驱结点 pFront
    // 进行链表的删除操作即可
    for (chainNode<T>* pFront = firstNode; pFront->next; pFront = pFront->next)
    {
        if (pFront->next->element == theElement)
        {
            p = pFront->next;
            pFront->next = p->next;
            delete p;
            listSize--;
            return;
        }
    }
    // 若该元素不存在，输出 -1
    cout << -1 << endl;
}

template<class T>
int chain<T>::indexOf(T &theElement) const {
    // 返回元素 theElement 首次出现时的索引
    // 若该元素不存在，则返回 -1
    chainNode<T>* currentNode = firstNode;
    int index = 0; // 当前节点的索引
    while (currentNode != NULL && currentNode->element != theElement) {
        // 移向下一个节点
        currentNode = currentNode->next;
        index ++;
    }

    // 确定是否找到所需的元素
    if(currentNode == NULL) return -1;
    else return index;
}

template<class T>
void chain<T>::reverse() {
    chainNode<T>* p = firstNode;
    firstNode = firstNode->next;
    // 原链表的首节点（倒置后的尾结点）的后向指针指向 NULL
    p->next = NULL;
    // q 保存当前进行指针指向移动的元素在原链表中的后继节点
    chainNode<T>* q = firstNode->next;
    // 从原链表第二个节点开始，一直到原链表中倒数第二个元素，依次将链表元素的后向指针指向自己的前驱结点
    // firstNode 在每次操作开始时指向当前进行指针指向移动的元素
    // p 在每次操作开始时指向当前进行指针指向移动的元素的前驱节点
    for (int i = 0; i < listSize - 3; i++)
    {
        firstNode->next = p;
        p = firstNode;
        firstNode = q;
        q = firstNode->next;
    }
    // 更改原链表中尾结点的后向指针指向，并指定其为首节点
    firstNode->next = p;
    q->next = firstNode;
    firstNode = q;
}

template<class T>
void chain<T>::reverseForSort() {
    // 对头插法初始化的链表进行倒置操作
    T trans;
    int i, j;
    chainNode<T>* p = firstNode->next;
    chainNode<T>* q = firstNode;
    for (i = 0; i < listSize / 2; i++) {
        for (j = 0; j < listSize - i - 1; j++) {
            q = q->next;
        }
        trans = p->element;
        p->element = q->element;
        q->element = trans;
        p = p->next;
        q = firstNode;
    }
}

template<class T>
int chain<T>::outputXorSum() {
    int sum = 0;
    int i = 0;
    // 用链表迭代器进行遍历，求和
    for (chainNode<T>* currentNode = firstNode; currentNode != NULL; currentNode = currentNode->next) {
        sum = sum + ((currentNode->element) ^ i);
        i++;
    }
    return sum;
}

int main() {
    // N 为链表长度，Q 为操作个数
    cin >> N >> Q;
    int* tmpArr = new int[N];
    for (int i = 0; i < N; i++) {
        cin >> tmpArr[i];
    }
    chain<int> cl(tmpArr, N);
    cl.reverseForSort();
    // key: 操作对应的编号
    int key, idx, val;
    for (int i = 0; i < Q; i++) {
        cin >> key;
        switch (key) {
            case 1:
                // 插入操作
                cin >> idx >> val;
                cl.insert(idx, val);
                break;
            case 2:
                // 删除操作
                cin >> val;
                cl.erase(val);
                break;
            case 3:
                // 逆置操作
                cl.reverse();
                break;
            case 4:
                // 查询操作
                cin >> val;
                cout << cl.indexOf(val)<< endl;
                break;
            case 5:
                int sum = cl.outputXorSum();
                cout << sum << endl;
                break;
        }
    }
    return 0;
}




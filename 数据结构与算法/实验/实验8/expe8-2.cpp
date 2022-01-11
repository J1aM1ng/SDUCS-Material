#include <iostream>
#include <string>
using namespace std;
template <class K> class Hash;
template<>
// 哈希函数
class Hash<int> {
public:
    size_t operator()(const int theKey) const
    {
        return size_t(theKey);
    }
};
// 字典虚基类
template<class K, class E>
class dictionary {
public:
    virtual ~dictionary() {}
    virtual bool empty() const = 0;
    virtual int size() const = 0;
    virtual void erase(const K&) = 0;
    virtual void insert(const pair<const K, E>&) = 0;
};
// 链式散列每个桶的节点，其实就是链表节点
template <class K, class E>
struct pairNode {
    typedef pair<const K, E> pairType;
    pairType element;
    pairNode<K, E>* next;
    pairNode(const pairType& thePair) :element(thePair) {}
    pairNode(const pairType& thePair, pairNode<K, E>* theNext)
            :element(thePair) {
        next = theNext;
    }
};
// 散列表中每个节点都是一个有序（升序）链表
template<class K, class E>
class sortedChain : public dictionary<K, E> {
public:
    sortedChain() { firstNode = NULL; dSize = 0; }
    ~sortedChain();
    bool empty() const { return dSize == 0; }
    int size() const { return dSize; }
    // 查询
    pair<const K, E>* find(const K&) const;
    // 删除
    void erase(const K&);
    // 插入
    void insert(const pair<const K, E>&);
protected:
    pairNode<K, E>* firstNode;
    int dSize;
};
// 有序链表的析构
template<class K, class E>
sortedChain<K, E>::~sortedChain() {
    while (firstNode != NULL) {
        pairNode<K, E>* nextNode = firstNode->next;
        delete firstNode;
        firstNode = nextNode;
    }
}
// 在链表中查询x
template<class K, class E>
pair<const K, E>* sortedChain<K, E>::find(const K& theKey) const {
    pairNode<K, E>* currentNode = firstNode;
    // 顺序搜索
    while (currentNode != NULL &&
           currentNode->element.first != theKey)
        currentNode = currentNode->next;
    // 找到了x，输出x所在的链表长度
    if (currentNode != NULL && currentNode->element.first == theKey) {
        cout << dSize<<endl;
        return &currentNode->element;
    }
    // 标识着未找到
    return NULL;
}
// 在链表中插入
template<class K, class E>
void sortedChain<K, E>::insert(const pair<const K, E>& thePair) {
    // tp是p的前驱结点
    pairNode<K, E>* p = firstNode,* tp = NULL;
    // 顺序向后搜寻，一直到不符合升序关系为止，可能找到了对应元素，也可能没找到
    while (p != NULL && p->element.first < thePair.first) {
        tp = p;
        p = p->next;
    }
    // 如果找到了，则输出"Existed"，表明待插入元素已存在
    if (p != NULL && p->element.first == thePair.first) {
        cout << "Existed" << endl;
        return;
    }
    // 否则，执行插入操作
    pairNode<K, E>* newNode = new pairNode<K, E>(thePair, p);
    // 对应散列表桶是个空桶，那新插入的节点就应该是这个链表的首节点
    if (tp == NULL) firstNode = newNode;
    // 否则将该元素插到链表的最后
    else tp->next = newNode;
    dSize++;
    return;
}
// 链表元素删除
template<class K, class E>
void sortedChain<K, E>::erase(const K& theKey) {
    // tp是p的前驱结点
    pairNode<K, E>* p = firstNode,* tp = NULL;
    // 顺序向后搜寻，一直到不符合升序关系为止，可能找到了对应元素，也可能没找到
    while (p != NULL && p->element.first < theKey) {
        tp = p;
        p = p->next;
    }
    // 如果找到了，则执行删除
    if (p != NULL && p->element.first == theKey) {
        if (tp == NULL) firstNode = p->next;
        else tp->next = p->next;
        delete p;
        dSize--;
        cout << dSize<<endl;
        return;
    }
    // 没找到，则输出
    cout << "Delete Failed" << endl;
}
// 链式哈希表
template<class K, class E>
class hashChains : public dictionary<K, E> {
public:
    hashChains(int theDivisor = 11) {
        divisor = theDivisor;
        dSize = 0;
        table = new sortedChain<K, E>[divisor];
    }
    ~hashChains() { delete[] table; }
    bool empty() const { return dSize == 0; }
    int size() const { return dSize; }
    // 散列表 查询
    void find(const K& theKey) const {
        if (table[hash(theKey) % divisor].find(theKey) == NULL) {
            cout << "Not Found" << endl;
        }
    }
    // 散列表 插入
    void insert(const pair<const K, E>& thePair) {
        // 求出其所在桶（即链表）
        int homeBucket = (int)hash(thePair.first) % divisor;
        int homeSize = table[homeBucket].size();
        // 调用有序链表的插入
        table[homeBucket].insert(thePair);
        // 若插入成功，则散列表元素数++
        if (table[homeBucket].size() > homeSize)dSize++;
    }
    // 散列表 删除
    void erase(const K& theKey) {
        // 调用有序链表的删除
        table[hash(theKey) % divisor].erase(theKey);
    }
protected:
    sortedChain<K, E>* table;
    Hash<K> hash;
    // 散列表中元素数
    int dSize;
    int divisor;
};
int main() {
    // D为散列函数的除数，m为操作数。
    int D, m;
    cin >> D >> m;
    hashChains<int, int> a(D);
    pair<int, int> q;
    for (int i = 0; i < m; i++) {
        int op, number;
        cin >> op >> number;
        if (op == 0) {
            q.first = number; q.second = number;
            a.insert(q);
        }
        else if (op == 1) {
            q.first = number; q.second = number;
            a.find(q.first);
        }
        else if (op == 2) {
            q.first = number; q.second = number;
            a.erase(q.first);
        }
    }
    return 0;
}


#include<iostream>
using namespace std;
template<class T>
void changeLength1D(T*& a, int oldLength, int newLength) {
    T* tmp = new T[newLength];
    int number = min(oldLength, newLength);
    copy(a, a + number, tmp);
    delete[] a;
    a = tmp;
}
template<class T>
class minPriorityQueue {
public:
    virtual ~minPriorityQueue() {}
    virtual bool empty() const = 0;
    virtual int size() const = 0;
    virtual const T& top() = 0;
    virtual void pop() = 0;
    virtual void push(const T& theElement) = 0;
};
template<class T>
class minHeap : public minPriorityQueue<T> {
public:
    minHeap(int initialCapacity = 10);
    ~minHeap() { delete[] heap; }
    bool empty() const { return heapSize == 0; }
    int size() const {
        return heapSize;
    }
    const T& top() {
        return heap[1];
    }
    void pop();
    void push(const T&);
    void initialize(T*, int);
    void deactivateArray() {
        heap = NULL; arrayLength = heapSize = 0;
    }
    void output(ostream& out) const;
private:
    // 堆中元素个数
    int heapSize;
    // 存储堆的数组的容量
    int arrayLength;
    // 用于存储堆的数组
    T* heap;
};
template<class T>
minHeap<T>::minHeap(int initialCapacity) {
    arrayLength = initialCapacity + 1;
    heap = new T[arrayLength];
    heapSize = 0;
}
// 插入
template<class T>
void minHeap<T>::push(const T& theElement) {
    // 需扩容，倍增容量并复制
    if (heapSize == arrayLength - 1) {
        changeLength1D(heap, arrayLength, 2 * arrayLength);
        arrayLength *= 2;
    }
    // 将新元素插入到编号为n+1的位置
    int currentNode = ++heapSize;
    // 从n+1号位置开始，沿着该位置到根的路径，判断新元素能否放到该位置
    // 能则新元素放入，结束循环；不能则将父节点上元素和新元素交换位置，并继续判断
    while (currentNode != 1 && heap[currentNode / 2] > theElement) {
        heap[currentNode] = heap[currentNode / 2];
        currentNode /= 2;
    }
    // 插入新元素到最终位置
    heap[currentNode] = theElement;
}
// 删除
template<class T>
void minHeap<T>::pop() {
    // 删除根
    heap[1].~T();
    // 最后一个元素（将其放在根的位置）
    T lastElement = heap[heapSize--];
    int currentNode = 1,
            child = 2;
    // 从根开始，沿着从根到叶子结点的路径，为最后一个元素寻找合适的位置
    // 判断是否可以把最后一个元素放到当前位置，若可以，则放入，结束；若不可以，则交换位置后继续判断
    while (child <= heapSize) {
        if (child < heapSize && heap[child] > heap[child + 1])
            child++;
        if (lastElement <= heap[child])
            break;
        heap[currentNode] = heap[child];
        currentNode = child;
        child *= 2;
    }
    // 将最后一个元素放到最终位置
    heap[currentNode] = lastElement;
}
// 初始化
template<class T>
void minHeap<T>::initialize(T* theHeap, int theSize) {
    delete[] heap;
    heap = theHeap;
    heapSize = theSize;
    // 从数组最右一个有孩子的节点开始，这个元素的位置为i=n/2
    // 重构以i号元素为根的子树为大根堆
    for (int root = heapSize / 2; root >= 1; root--) {
        T rootElement = heap[root];
        int child = 2 * root;
        while (child <= heapSize) {
            if (child < heapSize && heap[child] < heap[child + 1])
                child++;
            if (rootElement >= heap[child])
                break;
            heap[child / 2] = heap[child];
            child *= 2;
        }
        heap[child / 2] = rootElement;
    }
}
int main() {
    int m, n;
    // 堆的大小
    cin >> n;
    // 最小堆
    minHeap<int> mh(n);
    for (int i = 0; i < n; i++) {
        int num;
        cin >> num;
        mh.push(num);
    }
    cout << mh.top() << endl;
    // 操作个数
    cin >> m;
    for (int i = 0; i < m; i++) {
        // 操作编码
        int op, num;
        cin >> op;
        // 插入操作
        if (op == 1){
            cin >> num;
            mh.push(num);
            cout << mh.top() << endl;
        } else if (op == 2) {
            // 删除操作
            mh.pop();
            cout << mh.top() << endl;
        } else if (op == 3) {
            // 排序操作，堆排序
            int p;
            // 待排序的数的数目
            cin >> p;
            minHeap<int> tmp(p);
            for (int j = 0; j < p; j++) {
                int number;
                cin >> number;
                tmp.push(number);
            }
            // 排序完输出后出堆
            for (int j = 0; j < p; j++) {
                cout << tmp.top() << " ";
                tmp.pop();
            }
        }
    }
    return 0;
}



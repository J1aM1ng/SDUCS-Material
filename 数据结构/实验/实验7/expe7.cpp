#include <iostream>
using namespace std;
// 抽象类队列
class queue {
public:
    virtual ~queue() {}
    // 返回true，当且仅当队列为空
    virtual bool empty() const = 0;
    // 返回队列中元素个数
    virtual int size() const = 0;
    // 返回队列中队首元素的引用
    virtual int& front() = 0;
    // 返回队列中队尾元素的引用
    virtual int& back() = 0;
    // 队首元素出队
    virtual void pop() = 0;
    // 把元素 theElement 从队尾入队
    virtual void push(const int& theElement) = 0;
    virtual void output() = 0;
};
// 数组描述的循环队列
class extendedArrayQueue : public queue {
public:
    // 构造函数
    extendedArrayQueue(int initialCapacity = 10);
    // 析构函数，释放动态数组空间
    ~extendedArrayQueue() { delete[] queue; }
    // 判空函数，仅当队首指针与队尾指针相等时，队列为空
    bool empty() const { return theFront == theBack; }
    // 由于是循环队列，所以需要对 arrayLength 取余
    int size() const {
        return (theBack - theFront + arrayLength) % arrayLength;
    }
    // 队首指针沿逆时针方向指向队列首元素的下一个位置,故需这样访问队首元素，且循环队列需取余
    int& front() {
        return queue[(theFront + 1) % arrayLength];
    }
    // 队尾指针指向队尾元素，循环队列需取余
    int& back() {
        return queue[theBack];
    }
    // 队首元素出队
    void pop() {
        // 队首指针顺时针移动一位
        theFront = (theFront + 1) % arrayLength;
        ~queue[theFront];
    }
    // 把元素 theElement 从队尾入队
    void push(const int& theElement);
    // 对卡片游戏所需的扑克牌队列进行初始化
    void init(int n);
    // 从队首到队尾输出当前队列中所有元素
    void output();
    // 对队列中的扑克牌进行操作
    void cardsOpe();
private:
    // 队首指针，沿逆时针方向指向队列首元素的下一个位置
    int theFront;
    // 队尾指针，指向队尾元素
    int theBack;
    // 用于存储队列的动态数组的大小
    int arrayLength;
    // 用于存储队列的动态数组
    int* queue;
};
// 构造函数
extendedArrayQueue::extendedArrayQueue(int initialCapacity) {
    // 初始化容量
    arrayLength = initialCapacity;
    queue = new int[arrayLength];
    // 队首指针 = 队尾指针 = 0
    theFront = 0;
    theBack = 0;
}
// 对卡片游戏所需的扑克牌队列进行初始化
void extendedArrayQueue::init(int n) {
    // 依次编号为1-n（从最上面开始，即从队首到队尾为1-n）
    for (int i = 1;  i <= n; i++) {
        push(i);
    }
}
// 对队列中的扑克牌进行操作
void extendedArrayQueue::cardsOpe() {
    // 当桌子上的扑克牌队列至少还有两张时
    while (size() >= 2) {
        // 队首元素出队：把第一张牌扔掉
        pop();
        // 保存新的队首元素
        int tmp = front();
        // 新的队首元素出队
        pop();
        // 将刚才保存的新的队首元素从队尾入队
        push(tmp);
    }
}
// 把元素 theElement 从队尾入队
void extendedArrayQueue::push(const int& theElement) {
    // 若本次入队会使队列变满（循环队列的最大长度为arrayLength-1),则倍增数组
    if ((theBack + 1) % arrayLength == theFront) {
        int* newQueue = new int[2 * arrayLength];
        // 队首元素的位置
        int queueFront = (theFront + 1) % arrayLength;
        if (queueFront < 2) {
            // queueFront == 0 || queueFront == 1
            // 直接 copy 即可
            copy(queue + queueFront, queue + queueFront + arrayLength - 1, newQueue);
        } else {
            // queueFront >=2
            // 先把从队首到 arrayLength 的序列 copy 到新数组，再将开头的剩余的 copy 过去
            // 目的是 copy 完后顺序在一维空间上是有序的
            copy(queue + queueFront, queue + arrayLength, newQueue);
            copy(queue, queue + theBack + 1, newQueue + arrayLength - queueFront);
        }
        // 队首指针指向 0 的前一个位置
        theFront = 2 * arrayLength - 1;
        // 队尾指针指向队尾，索引为arrayLength-2，队列长度为arrayLength-1
        theBack = arrayLength - 2;
        // 数组长度倍增
        arrayLength *= 2;
        // 新数组的指针赋给队列的私有数据成员
        queue = newQueue;
    }
    // 队尾指针后移一位
    theBack = (theBack + 1) % arrayLength;
    // 在当前队尾指针的位置插入 theElement
    queue[theBack] = theElement;
}
// 从队首到队尾输出当前队列中所有元素
void extendedArrayQueue::output() {
    for (int i = (theFront + 1) % arrayLength; i < (theFront + 1) % arrayLength + size(); i++) {
        cout << queue[i];
    }
    cout << endl;
}
int main() {
    // 一开始卡片的总数
    int n;
    cin >> n;
    // 扑克牌队列
    extendedArrayQueue A;
    // 对卡片游戏所需的扑克牌队列进行初始化
    A.init(n);
    // 对队列中的扑克牌进行操作
    A.cardsOpe();
    // 操作完后输出最后剩下的牌
    A.output();
    return 0;
}


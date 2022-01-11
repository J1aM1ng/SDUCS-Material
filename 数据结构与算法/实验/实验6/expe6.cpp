#include <iostream>
#include <algorithm>
#include <iomanip>
using namespace std;
template <class T>
class arrayStack {
public:
    // 构造函数
    arrayStack(int initialCapacity = 10);
    // 析构函数
    ~arrayStack() { delete[] stack; }
    // 判断栈是否为空
    bool empty() const { return stackTop == -1; }
    // 栈当前存储的元素数
    int size() const { return stackTop + 1; }
    // 得到栈顶元素
    T& top() {
        return stack[stackTop];
    }
    // 弹出栈顶
    void pop(){
        stack[stackTop--].~T();
    }
    // 从栈顶压入元素
    void push(const T& theElement);
    // 单步计算
    void singleCalc(arrayStack<double>& a, arrayStack<char>& b);
    // 表达式整体计算
    void solve(string s);

private:
    // 栈顶指针
    int stackTop;
    // 栈的大小（容量）
    int stackLength;
    // 存储栈的数组
    T* stack;
};
// 构造函数
template <class T>
arrayStack<T>::arrayStack(int initialCapacity) {
    stackLength = initialCapacity;
    stack = new T[stackLength];
    stackTop = -1;
}
// 从栈顶压入元素
template<class T>
void arrayStack<T>::push(const T& theElement) {
    // 栈满，倍增扩容
    if (stackTop == stackLength - 1) {
        // 倍增数组容量
        T* tmp = new T[2 * stackLength];
        int number = min(stackLength, 2 * stackLength);
        // copy 到新数组中
        copy(stack, stack + number, tmp);
        delete[] stack;
        // 使用新数组
        stack = tmp;
        stackLength *= 2;
    }
    // 将元素压入栈顶
    stack[++stackTop] = theElement;
}
// 执行单步计算：两个操作数，一个符号
template <class T>
void arrayStack<T>::singleCalc(arrayStack<double>& number, arrayStack<char>& signal){
    // 非法情况，符号栈顶为左括号，应执行入栈操作，而不应调用该函数
    if (signal.top() == '(') return;
    // 存储数字栈顶的前两个元素 x 和 y ，用于进一步计算
    double x, y;
    x = number.top();
    number.pop();
    y = number.top();
    number.pop();
    // 对x和y执行计算
    switch (signal.top()){
        // 说明在x和y之间是加号，对x和y执行加法操作
        case '+':
            // 保存单步运算的结果，入栈，继续进行后面的计算
            number.push(x + y);
            break;
        case '-':
            // y是在前面的数，故应y-x
            number.push(y - x);
            break;
        case '*':
            number.push(x * y);
            break;
        case '/':
            // 与减法同理
            number.push(y / x);
            break;
        default:
            break;
    }
    // 对x和y计算的该符号出（符号）栈，打破内层嵌套
    signal.pop();
}
// 表达式（整体）计算流程
template <class T>
void arrayStack<T>::solve(string s) {
    int length = s.size();
    // 数字栈，符号栈
    arrayStack<double> number(length);
    arrayStack<char> signal(length);
    for (int i = 0; i < length; i++) {
        // 若该字符为数字，由于仅可能为单个整数，故转换后入栈即可
        if (s[i] >= '0' && s[i] <= '9'){
            // 字符转数字
            double tmp = s[i] - '0';
            // 入（数字）栈
            number.push(tmp);
        } else {
            // 否则，该字符为符号，仅可能为6种符号之一，分别讨论
            switch (s[i]) {
                case '-':
                case '+': {
                    // 若符号栈顶为左括号 或符号栈为空，说明数字栈中还没有足够执行单步运算的（右）操作数
                    // 则推入符号栈，等待操作数到来
                    if (signal.empty() || signal.top() == '(')
                        signal.push(s[i]);
                    else {
                        // 否则，说明现在应该执行该符号之前的运算，无论是什么运算，因为优先级都是>=加法的，由于在先
                        // 故一定在该符号前执行，故需将前面运算单步执行完后再使该符号入栈
                        singleCalc(number, signal);
                        // 可能会有嵌套情况，若有这种情况，则继续将前面的运算单步执行完
                        // 由于加减法前面只可能有两个先于其的运算，例如1+2*3+4，在最后一个加法前的运算只可能有一加一乘
                        // 故我们"判断是否有在前的运算，若有则单步计算之"这样的操作最多需要执行两次即可
                        if (!signal.empty() && signal.top() != '(')
                            singleCalc(number, signal);
                        // 该符号入栈
                        signal.push(s[i]);
                    }
                    break;
                }
                case '/':
                case '*': {
                    // 若符号栈顶为左括号 或符号栈为空，说明数字栈中还没有足够执行单步运算的（右）操作数
                    // 则推入符号栈，等待操作数到来
                    if (signal.empty() || signal.top() == '(')
                        signal.push(s[i]);
                    else if (signal.top() == '+' || signal.top() == '-')
                        // 前面是加减法，则乘法优先级更高，可优先执行，该符号入栈
                        // 入栈操作表示的是：后面的符号会使栈内的符号依次计算，该乘除法在其前面的加减法之前计算
                        // 等待下一个<=当前运算优先级的符号，无论是加减还是乘除，都会先让自己计算，他们再入符号栈
                        signal.push(s[i]);
                    else if (signal.top() == '*' || signal.top() == '/') {
                        // 前面是乘除法，则应前面的计算先进行，故先进行前面的单步运算，再使该符号入栈
                        singleCalc(number, signal);
                        // 该符号入栈
                        signal.push(s[i]);
                    }
                    break;
                }
                case '(':
                    // 左括号直接入栈即可
                    signal.push(s[i]);
                    break;
                case ')': {
                    // 右括号代表优先求解的子表达式的范围，遇到右括号代表要将该（外层）左右括号内的内容完全执行完
                    // 最后使得左右括号内只剩一个数字，这个运算的过程可能是嵌套的
                    while (signal.top() != '(') {
                        singleCalc(number, signal);
                    }
                    // 右括号出栈
                    signal.pop();
                    break;
                }
                default:
                    break;
            }
        }
    }
    // 将优先级导致的未运算完成的
    while (!signal.empty()) {
        singleCalc(number, signal);
    }
    // 对单个表达式，输出结果浮点数，保留两位小数
    cout << setprecision(2) << fixed << number.top() << endl;
}

int main() {
    // 当前栈，即用于调用进行表达式计算方法的栈
    arrayStack<double> a;
    // n:待输入的字符串表达式的个数
    int n;
    cin >> n;
    for (int i = 0; i < n; i++) {
        // 输入的第i个字符串表达式
        string equation;
        cin >> equation;
        // 对该字符串表达式执行表达式整体计算
        a.solve(equation);
    }
    return 0;
}


#include <iostream>
#include <queue>
#include <map>
using namespace std;
// 一串小写字母组成的字符串
string str;
// 维护每个字符的频率
map<char, int> MAP;
// 小根堆
priority_queue<int, vector<int>, greater<> >PQ;
int main() {
    // 一串小写字母组成的字符串
    getline(cin, str);
    int len = str.length();
    for (int i = 0; i < len; i++) {
        // 统计每个字符出现的频率
        if (MAP.find(str[i]) == MAP.end()) {
            MAP[str[i]] = 1;
        } else {
            MAP[str[i]]++;
        }
    }
    // 放进小根堆
    for (auto it = MAP.begin(); it != MAP.end(); it++) {
        PQ.push(it->second);
    }
    // 字符串通过Huffman编码后的长度
    int flag = 0;
    while (PQ.size() != 1) {
        int a, b, trans;
        // 取出堆顶元素
        a = PQ.top();
        PQ.pop();
        // 取出堆中第二小的元素
        b = PQ.top();
        PQ.pop();
        trans = a + b;
        // 每做一次霍夫曼树的合并，字符串增加对应的长度
        // 不断从最小堆中取出两棵树合并成一棵放入，直到只剩下一棵
        flag += trans;
        PQ.push(trans);
    }
    // 字符串通过Huffman编码后的长度
    cout << flag << endl;
    return 0;
}


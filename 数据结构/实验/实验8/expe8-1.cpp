#include <string>
#include <iostream>
using namespace std;
template <class K> class Hash;
template<>
// 哈希函数f(k)
class Hash<int> {
public:
    size_t operator()(const int theKey) const {
        return size_t(theKey);
    }
};
// 哈希表
template<class K, class E>
class hashTable {
public:
    hashTable(int theDivisor = 11);
    ~hashTable() { delete[] table; }
    bool empty() const { return dSize == 0; }
    int size() const { return dSize; }
    void find(const K&) const;
    // 插入
    void insert(const pair<const K, E>&);
    // 删除
    void erase(K&);
protected:
    // 查询
    int search(const K&) const;
    pair<const K, E>** table;
    Hash<K> hash;
    // 当前元素数
    int dSize;
    // 模数
    int divisor;
};
// 构造函数
template<class K, class E>
hashTable<K, E>::hashTable(int theDivisor) {
    divisor = theDivisor;
    dSize = 0;
    table = new pair<const K, E> * [divisor];
    for (int i = 0; i < divisor; i++)table[i] = NULL;
}
// 查询某一键值的元素
template<class K, class E>
int hashTable<K, E>::search(const K& theKey) const {
    int i = (int)hash(theKey) % divisor;
    int j = i;
    do {
        // 到达空桶或者找到了，均返回
        if (table[j] == NULL || table[j]->first == theKey)return j;
        j = (j + 1) % divisor;
        // 等到又搜回起始桶f(k)，说明没有找到
    } while (j != i);
    return j;
}
// 删除
template <class K, class E>
void hashTable<K, E>::erase(K& theKey) {
    int b = search(theKey);
    // 若搜到的哈希值对应位置是空桶，或者对应键值不是本键值（意思是本桶被别的键值占了且找了一圈也没找到该键值，也属于没找到）
    if (table[b] == NULL || table[b]->first != theKey)cout << "Not Found" << endl;
    else {
        // 置空
        table[b] = NULL;
        // 删除x过程中移动元素的个数
        int flag = 0;
        int point = b, m = b, signal;
        do {
            // 从待删除元素向后找，看有没有要前移的
            point = (point + 1) % divisor;
            // 有个空桶，说明后面的一定不是因为哈希冲突而填过去的，故后面的肯定不需要前移
            if (table[point] == NULL)break;
            // 当前访问到的点的键值
            signal = table[point]->first % divisor;
            // 需要前移的三种情况：
            // 1）散列表中存在被删除元素右边且其键值比被删除元素小，说明被删除元素占了这个元素前面的位置（不一定是直接位置）
            // 2) 当前点的散列表下标比其键值要小，且当前点的键值仍小于待删除元素，说明待删除元素及后面的空间全满了，按环形塞到前面了
            // 3) 当前点的散列表下标比其键值要小，且当前点的键值大于待删除元素，说明当前点理应在待删除元素之后的，但由于空间没了才到前面来的
            if ((signal <= m && m < point) || (point < signal && signal <= m) || (point < signal && m < point)) {
                // 前移
                table[m] = table[point];
                // 原桶置空
                table[point] = NULL;
                // 刚腾出来的空桶用作下一个可能前移的元素的目的地
                m = point;
                // 移动元素个数++
                flag++;
            }
            // 下一个桶不为空（为空则后面的肯定不需要前移）且还没访问完一圈回到待删除元素
        } while (table[(point + 1) % divisor] != NULL && point != b);
        cout << flag << endl;
    }
}
// 查询x，若散列表不含有x，输出“-1”，否则输出x对应下标
template<class K, class E>
void hashTable<K, E>::find(const K& theKey) const {
    int b = search(theKey);
    // 映射到的对应位置为空桶，或找了一圈返回。均说明没找到
    if (table[b] == NULL || table[b]->first != theKey) {
        cout << -1 << endl;
        return;
    }
    // 找到了，输出x对应下标
    cout << b << endl;
    return;
}
// 插入x，若散列表已存在x，输出“Existed”，否则插入x到散列表中，输出所在的下标。
template<class K, class E>
void hashTable<K, E>::insert(const pair<const K, E>& thePair) {
    int b = search(thePair.first);
    // 对应位置是空桶，直接插入即可
    if (table[b] == NULL) {
        table[b] = new pair<const K, E>(thePair);
        dSize++;
        // 输出所在的下标
        cout << b << endl;
    } else if(table[b]->first == thePair.first) {
        // 已有对应关键字的元素（即与x相同）了
        cout << "Existed" << endl;
    }
}

int main() {
    // D:除数（同余哈希中的除数） m:操作的个数
    int D, m;
    cin >> D >> m;
    hashTable<int, int> a(D);
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
        else if (op == 2){
            q.first = number; q.second = number;
            a.erase(q.first);
        }
    }
    return 0;
}


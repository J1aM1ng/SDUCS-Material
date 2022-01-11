#include <iostream>
#include <string>
using namespace std;
typedef long long ll;
int n;

struct stInfo {
    // 结构体:用来存放学生信息 => 姓名，电话号码, 班级，宿舍
    string name;
    ll telNum;
    ll className;
    ll dorm;
};

class stInfoList {
    // 学生信息线性表类
public:
    stInfoList() {
        arrayLength = n;
        listSize = 0;
        info = new stInfo[n];
    }
    ~stInfoList() {
        delete [] info;
    }
    // 插入一条记录
    void insert(string &n, ll t, ll c, ll d);
    // 根据姓名删除一条记录
    void erase(string &n);
    // 根据姓名编辑一条记录
    void edit(string &name, int projNum, ll New);
    // 根据姓名查找
    int search(string &name);
    // 输出该班级的所有成员的宿舍号的异或值
    ll output(ll targetClass) const;
private:
    // 数组容量
    int arrayLength;
    // 线性表的当前元素个数
    int listSize;
    // 存储学生们的信息
    stInfo* info;
};

void stInfoList::insert(string &nm, ll tel, ll cn, ll dm) {
    // 插入一个学生
    info[listSize].className = cn;
    info[listSize].dorm = dm;
    info[listSize].name = nm;
    info[listSize].telNum = tel;
    listSize ++;
}

void stInfoList::erase(string &name) {
    // 删除一个学生
    int i;
    for (i = 0; i < listSize; i++) {
        if (info[i].name == name) break;
    }
    // 使用copy将这个学生后面的学生依次向前移动一位,覆盖该待删除元素
    copy(info + i + 1, info + listSize, info + i);
    listSize --;
}

void stInfoList::edit(string &name, int projNum, ll newValue) {
    // 编辑一条记录
    int i;
    for (i = 0; i < listSize; i++) {
        if (info[i].name == name) {
            switch(projNum) {
                case 1:
                    info[i].telNum = newValue;
                    break;
                case 2:
                    info[i].className = newValue;
                    break;
                case 3:
                    info[i].dorm = newValue;
                    break;
            }
        }
    }
}

int stInfoList::search(string &name) {
    // 查找一个学生 并输出代表结果的数字
    int i;
    for (i = 0; i < listSize; i++) {
        if (info[i].name == name) {
            return 1;
        }
    }
    return 0;
}

ll stInfoList::output(ll targetClass) const {
    //返回异或值
    ll xorSum = 0;
    int i;
    for (i = 0; i < listSize; i++) {
        if (info[i].className == targetClass) {
            xorSum ^= info[i].dorm;
        }
    }
    return xorSum;
}

int main() {
    cin >> n;
    // 学生信息线性表
    stInfoList lt;
    // 操作数
    int opeNum;
    // 姓名
    string name;
    // 欲编辑项目的编号
    int projNum;
    ll  className, dorm, newValue, targetClass, telNum;
    for (int j = 0; j < n; j++) {
        // 执行n次操作
        cin >> opeNum;
        switch (opeNum) {
            // 插入一条记录
            case 0:
                cin >> name >> telNum >> className >> dorm;
                lt.insert(name, telNum, className, dorm);
                break;
            case 1:
                cin >> name;
                lt.erase(name);
                break;
            case 2:
                cin >> name >> projNum >> newValue;
                lt.edit(name, projNum, newValue);
                break;
            case 3:
                cin >> name;
                cout << "searchRes = "<< lt.search(name) << endl;
                break;
            case 4:
                cin >> targetClass;
                cout << "xorSum = "<< lt.output(targetClass) << endl;
                break;
        }
    }
    return 0;
}


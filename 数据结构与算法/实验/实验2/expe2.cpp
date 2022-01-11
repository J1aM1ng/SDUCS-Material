#include <iostream>
#include <algorithm>
using namespace std;
int n;
template<class T>
void Rank(T a[], int r[]);

template<class T>
class Sort {
private:
    T *element;
    T *rankArr;
    bool bubble() {
        bool swapped = false;
        for(int i=0;i<n-1;i++) {
            if(element[i] > element[i+1]) {
                swap(element[i], element[i+1]);
                swapped = true;
            }
        }
        return swapped;
    }
public:
    Sort() {
        element = new T[n];
        rankArr = new T[n];
    }
    ~Sort() {
        delete [] element;
        delete [] rankArr;
    }
    void Rank() {
        for(int i=0;i<n;i++) {
            // 初始化
            rankArr[i] = 0;
        }
        // 比较所有元素对
        for(int i=1;i<n;i++) {
            for(int j=0;j<i;j++) {
                if(element[j] <= element[i]) {
                    rankArr[i]++;
                }
                else {
                    rankArr[j]++;
                }
            }
        }
    }
    void rankSort() {
        // 原地重排数组元素使之有序
        for(int i=0;i<n;i++) {
            // 把正确的元素移到element[i]
            while(rankArr[i] != i) {
                int tmp = rankArr[i];
                swap(element[i], element[tmp]);
                swap(rankArr[i], rankArr[tmp]);
            }
        }
    }
    void selectSort() {
        bool sorted = false;
        for(int size=n; !sorted && (size>1); size--) {
            int indexOfMax = 0;
            sorted = true;
            for(int i=1;i<size;i++) {
                if(element[indexOfMax] <= element[i])indexOfMax = i;
                else sorted = false;
            }
            swap(element[indexOfMax], element[size-1]);
        }
    }
    void bubbleSort() {
        for(int i = n;i > 1 && bubble();i --);
    }
    void insertSort() {
        for(int i=1;i<n;i++) {
            T tmp = element[i];
            int j;
            for(j = i-1;j >= 0 && tmp < element[j];j --) {
                element[j+1] = element[j];
            }
            element[j+1] = tmp;
        }
    }
    void setElement(int value, int index) {
        element[index] = value;
    }
    T getElement(int index) {
        return element[index];
    }
    T getRank(int index) {
        return rankArr[index];
    }
};

int main() {
    cin>>n;
    Sort<int> s;
    for(int i=0;i<n;i++) {
        int tmp;
        cin>>tmp;
        s.setElement(tmp, i);
    }
    s.Rank();
    // 调用排序算法进行排序
    s.rankSort();
    for(int i=0;i<n;i++) {
        cout<<s.getElement(i)<<" ";
    }
    return 0;
}
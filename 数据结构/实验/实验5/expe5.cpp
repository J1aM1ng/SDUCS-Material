#include <iostream>
using namespace std;
const int maxSize = 1e5;
struct matrixUnion {
    // 一个稀疏矩阵单元，每个单元包括矩阵元素在矩阵中的行、列和值
    int row, col, value;
    // 矩阵单元 赋值运算符重载
    matrixUnion& operator=(matrixUnion& x) {
        // 矩阵元素赋值
        row = x.row;
        col = x.col;
        value = x.value;
        return *this;
    }
};
class sparseMatrix {
    friend ostream& operator<<(ostream& out, sparseMatrix& a);
public:
    // 构造函数，给定行列
    sparseMatrix(int r,int c);
    // 析构函数，释放空间
    ~sparseMatrix() { delete[] element; }
    // 矩阵赋值运算符重载
    sparseMatrix& operator=(sparseMatrix& a);
    // 操作1 矩阵重置
    void initial(int r,int c);
    // 操作2 矩阵乘法
    void multiply(sparseMatrix& a);
    // 操作3 矩阵加法
    void add(sparseMatrix& a);
    // 操作4 矩阵输出
    void output();
    // 操作5 矩阵转置
    void transpose();
    // 输入稀疏矩阵的一个元素（row,col,val）
    void inputOneElem(int x,int y,int z);
    // 按索引插入
    void insert(int theIndex, const matrixUnion& theElement);
private:
    // 稀疏矩阵的行、列和当前数组中第一个空的位置
    int Rows, Cols, Current;
    matrixUnion * element;
    // 最大容量
    int maxSize;
};
// 构造函数
sparseMatrix::sparseMatrix(int r,int c) {
    this->maxSize = ::maxSize;
    element = new matrixUnion[maxSize];
    Rows = r;
    Cols = c;
    // 当前数组中第一个空的位置，也即当前稀疏矩阵的非零元素数目
    Current= 0;
}
// 矩阵赋值运算符重载
sparseMatrix& sparseMatrix::operator=(sparseMatrix& a) {
    Rows = a.Rows;
    Cols = a.Cols;
    Current = a.Current;
    maxSize = a.maxSize;
    for (int i = 0; i < Current; i++)
        element[i] = a.element[i];
    return *this;
}
// 操作1 重置矩阵
void sparseMatrix::initial(int r,int c) {
    Rows = r;
    Cols = c;
    Current = 0;
    for (int i = 0; i < Rows; i++) {
        for (int j = 0; j < Cols; j++) {
            int b;
            // 按行主序输入矩阵元素
            cin >> b;
            if (b != 0) {
                // 若为非零元素，则存进一位稀疏矩阵数组中
                // 行列数均从1开始
                element[Current].row = i + 1;
                element[Current].col = j + 1;
                element[Current].value = b;
                // 非零元素数++
                Current++;
            }
        }
    }
}
// 操作2 矩阵乘法
void sparseMatrix::multiply(sparseMatrix& a) {
    // 矩阵this * 矩阵a
    if (this->Cols != a.Rows) {
        // 不合法情况 矩阵无法相乘 将右矩阵赋给左矩阵，并输出-1
        // 为实现矩阵赋值，需重载矩阵赋值运算符
        *this = a;
        cout << -1 << endl;
    } else {
        // 乘法结果矩阵
        sparseMatrix b(this->Rows, a.Cols);
        // sizeOfRow[i]：右矩阵第i行非零元素的个数
        int sizeOfRow[::maxSize];
        // nextOfRow[i] = sizeOfRow[i-1]+...+sizeOfRow[1],i>1
        // nextOfRow[i] = 0, i=1
        // 该行前面的行已经计算过的非零元素数，类似前缀和
        int nextOfRow[::maxSize];
        // 存储结果矩阵一行的值
        int theAnswer[::maxSize];
        for (int i = 1; i <= a.Rows; i++)
            // 初始化
            sizeOfRow[i] = 0;
        for (int i = 0; i < a.Current; i++) {
            if (a.element[i].value != 0) {
                sizeOfRow[a.element[i].row]++;
            }
        }
        nextOfRow[1] = 0;
        for (int i = 2; i <= a.Current; i++)
            nextOfRow[i] = nextOfRow[i - 1] + sizeOfRow[i - 1];
        // 指向左矩阵所在的一维数组中当前位置的指针
        int p = 0;
        // i为行数，标识每轮乘法运算，对左矩阵每行进行这样的运算，循环共执行 this.row 次
        for (int i = 1; i <= this->Rows && p < this->Current; i++) {
            // 实际上每轮外循环执行左矩阵一整行的相乘再相加操作
            for (int j = 1; j <= a.Cols; j++)
                // 初始化结果矩阵一整行的所有元素值为0
                theAnswer[j] = 0;
            // 左矩阵同一行元素放在同一轮乘法运算中
            while (p < this->Current && this->element[p].row == i) {
                int t = this->element[p].col;
                // 右矩阵对应行有非零元素时，才执行左右矩阵对应行列的相乘操作
                // 不同于正常矩阵运算，这里右矩阵是一行一行地乘的
                if (sizeOfRow[t] != 0) {
                    // q为指向右矩阵所在的一维数组中当前位置的指针
                    for (int q = nextOfRow[t]; q < nextOfRow[t] + sizeOfRow[t]; q++) {
                        // 与右矩阵同列的加到一起
                        theAnswer[a.element[q].col] += this->element[p].value * a.element[q].value;
                    }
                }
                // p右移，再看左矩阵一维数组中下一个非零元素，一直到第i行完事
                p++;
            }
            // 将求出的theAnswer[]对应值存到结果矩阵的一维数组中
            for (int k = 1; k <= a.Cols; k++) {
                // 结果不为0，表明结果矩阵对应位置不为0，给结果矩阵的存储方式：一维数组 进行赋值
                if (theAnswer[k] != 0) {
                    b.element[b.Current].value = theAnswer[k];
                    b.element[b.Current].row = i;
                    // 右矩阵中列对应结果矩阵中列
                    b.element[b.Current].col = k;
                    // 非零元素数++
                    b.Current++;
                }
            }
        }
        *this = b;
    }
}
// 输入一个新元素，加入矩阵数组中
void sparseMatrix::inputOneElem(int x,int y,int z) {
    matrixUnion tmp;
    tmp.row = x;
    tmp.col = y;
    tmp.value = z;
    element[Current] = tmp;
    Current++;
}
// 操作5 矩阵转置操作，无需输出
// 转置后应仍有序（行主序）
void sparseMatrix::transpose() {
    // 结果矩阵b: 转置后的矩阵，n行m列
    sparseMatrix b(Cols,Rows);
    // 矩阵私有成员赋值
    b.Current = Current;
    b.Cols = Rows;
    b.Rows = Cols;
    // 矩阵转置按列进行转置（因为相当于转置后按行主序，这样就保证了有序）
    // colSize[i]:第i列中非零元素的数目
    int* colSize = new int[Cols + 1];
    // 类似前缀和 colNext[i]:第i列前面的列已经计算（转置）过的非零元素的个数
    int* colNext = new int[Cols + 1];
    // 初始化colSize[]
    for (int i = 1; i <= Cols; i++)
        colSize[i] = 0;
    for (int i = 0; i < Current; i++)
        colSize[element[i].col]++;
    // 初始化colNext[]
    colNext[1] = 0;
    for (int i = 2; i <= Cols; i++)
        colNext[i] = colNext[i - 1] + colSize[i - 1];
    // 对原矩阵一维数组进行遍历
    for(int i=0;i<Current;i++) {
        // j为访问新矩阵一维数组的指针
        int j = colNext[element[i].col]++;
        // 对应赋值
        b.element[j].row = element[i].col;
        b.element[j].col = element[i].row;
        b.element[j].value = element[i].value;
    }
    // 将转置后的矩阵赋给当前矩阵
    *this = b;
}
// 重载输出运算符
ostream& operator<<(ostream& out, sparseMatrix& a)
{
    cout << a.Rows<<" "<< a.Cols <<endl;
    for (int i = 1; i < a.Rows+1; i++)
    {
        for (int j = 1; j < a.Cols+1; j++) {
            int flag = 0;
            for (int k = 0; k < a.Current; k++) {
                if (a.element[k].row == i && a.element[k].col == j) {
                    cout << a.element[k].value << " ";
                    flag++;
                }
            }
            // 稀疏矩阵中为0的元素，直接输出0
            if (flag == 0) cout << 0 << " ";
        }
        // 每行输出完后换行
        cout << endl;
    }
    // 返回一个ostream类型
    return out;
}
// 操作4 输出操作
void sparseMatrix::output() {
    // k 为访问当前矩阵一维数组的指针
    int i, j, k = 0;
    cout << Rows << " " << Cols << endl;
    // 双重循环输出逻辑上的稀疏矩阵（二维数组）
    for (i = 0; i < Rows; i++){
        for (j = 0; j < Cols; j++){
            // 若当前应输出的是非零元素，则应存在于一维数组中，即应满足 element[k].row == i + 1 && element[k].col == j + 1
            if (k < Current && element[k].row == i + 1 && element[k].col == j + 1){
                cout << element[k].value << " ";
                k++;
            } else {
                // 不满足if中的条件，代表当前应输出的元素不在一维数组中，则应为0
                cout << 0 << " ";
            }
        }
        // 格式化，每输出一行稀疏矩阵元素，即换行
        cout << endl;
    }
}
// 在指定索引位置插入指定元素
void sparseMatrix::insert(int theIndex, const matrixUnion& theElement) {
    copy_backward(element + theIndex, element + Current,
                  element + Current + 1);
    element[theIndex].col = theElement.col;
    element[theIndex].row = theElement.row;
    element[theIndex].value = theElement.value;
    Current++;
}
// 操作3 矩阵加法
void sparseMatrix::add(sparseMatrix& b) {
    // 结果矩阵
    sparseMatrix c(Rows, Cols);
    // 不合法情况
    if (b.Cols != Cols || b.Rows != Rows) {
        *this = b;
        cout << -1 <<endl;
        return;
    }
    // 结果矩阵中非零元素数
    int cSize = 0;
    // pointerLeft pointerRight
    // pl和pr这两个指针用于访问相加的左矩阵和右矩阵在其对应一维数组中的当前位置（当前元素）
    int pl = 0;
    int pr = 0;
    // 访问结束标志
    int pLeftEnd = Current;
    int pRightEnd = b.Current;
    // 双指针法 左矩阵和右矩阵在其对应一维数组中均仍未访问完
    while (pl != pLeftEnd && pr != pRightEnd) {
        // lefIndex和rightIndex两个指针分别代表当前元素若为非零元素则在一维数组中应是的索引
        int leftIndex = element[pl].row * Cols + element[pl].col;
        int rightIndex = b.element[pr].row * Cols + b.element[pr].col;
        // 若左边应在的位置更大，则说明按行主序左边的这个元素在加法后应该直接放到结果矩阵的一维数组中
        if (leftIndex < rightIndex) {
            // 按左矩阵来插入结果矩阵对应位置
            c.insert(cSize++, element[pl]);
            // 左矩阵的指针右移
            pl++;
        } else {
            // 两边应在的位置一样大，则应对左右两边对应元素相加后放到结果矩阵的一维数组中
            if (leftIndex == rightIndex) {
                // 对应元素都有效，相加后赋值
                if (element[pl].value + b.element[pr].value != 0) {
                    // 相加后不为0才能放入结果矩阵的一维数组中
                    matrixUnion tmp;
                    tmp.row = element[pl].row;
                    tmp.col = element[pl].col;
                    tmp.value = element[pl].value + b.element[pr].value;
                    c.insert(cSize++, tmp);
                }
                // 两个指针都右移
                pl++;
                pr++;
            } else {
                // 若右边应在的位置更大，则说明按行主序右边的这个元素在加法后应该直接放到结果矩阵的一维数组中
                // leftIndex < rightIndex 按右矩阵来插入结果矩阵对应位置
                c.insert(cSize++, b.element[pr]);
                // 右矩阵的指针右移
                pr++;
            }
        }
    }
    // 将剩下那个没访问完的矩阵访问完，依序放入结果数组中
    for (; pl != pLeftEnd; pl++)
        c.insert(cSize++, element[pl]);
    for (; pr != pRightEnd; pr++)
        c.insert(cSize++, b.element[pr]);
    // 将相加后的赋给*this，即当前矩阵
    *this = c;
}

int main() {
    // 当前矩阵 x
    sparseMatrix x(0,0);
    // w:操作个数
    int w;
    // 稀疏矩阵行、列、矩阵乘法和加法中非零元素行数，操作代码
    int row, col, t,opeCode;
    cin>> w;
    for (int i = 0; i < w; i++) {
        cin >> opeCode;
        // 操作1 矩阵重置
        if (opeCode==1) {
            cin >> row >> col;
            x.initial(row, col);
        } else if(opeCode==2) {
            // 操作2 矩阵乘法
            cin >> row >> col;
            cin >> t;
            // 输入y:矩阵乘法运算的右矩阵
            sparseMatrix y(row, col);
            for (int j = 0; j < t; j++) {
                int tmpRow, tmpCol, tmpVal;
                cin >> tmpRow >> tmpCol >> tmpVal;
                y.inputOneElem(tmpRow, tmpCol, tmpVal);
            }
            // 相乘
            x.multiply(y);
        } else if(opeCode==3) {
            // 操作3 矩阵加法
            cin >> row >> col;
            cin >> t;
            sparseMatrix y1(row, col);
            // 输入y1:矩阵加法运算的右矩阵
            for (int j = 0; j < t; j++) {
                int tmpRow, tmpCol, tmpVal;
                cin >> tmpRow >> tmpCol >> tmpVal;
                y1.inputOneElem(tmpRow, tmpCol, tmpVal);
            }
            // 相加
            x.add(y1);
        } else if (opeCode == 4) {
            // 操作4 矩阵输出
            x.output();
        } else if (opeCode == 5) {
            // 操作5 矩阵转置
            x.transpose();
        }
    }
    return 0;
}


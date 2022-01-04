#include <iostream>
#include <cstring>
#include <queue>
// 图的最大顶点数
const int maxNum = 100001;
using namespace std;
// 顶点标记数组
bool vis[maxNum];
// 序列长度
int ff=0;
// 每个链表中的节点
typedef struct ANode {
    // 该边的另一个顶点（即除了该链表所属的顶点外）
    int adv;
    // 指向下一条边（下个链表节点）的指针
    struct ANode* next;
    // 和该边相关的信息,存放权值的地方
    int weight;
}ArcNode;
// 邻接链表中链表数组中的元素（即每个链表的头结点）
typedef struct VNode {				//定义表头结点;
    ANode* firstNode;				// 指向第一条依附于该表头的指针;
    int element;						// 存放顶点信息;
}AdVList;
// 存储Anode的数组
typedef struct ALGraph {
    // 创建有maxNum个结点的图
    AdVList VLise[maxNum];
    // 图的顶点数和边数
    int vNum, eNum;				
};
// 无向图
class Graph {
public:
    int find(int x);
    Graph(int n=100) {
        G.vNum = n;
        for (int i = 0; i < n; i++) {
            G.VLise[i].element = i+1;
            G.VLise[i].firstNode = NULL;
        }
    }
    void insert2(int v1, int v2);
    void erase(int v1, int v2);
    void bfs(int n);
    void dfs(int n);
    void fdfs(int n);
    void components(int n);
    void dfsCounter(int n);
    void path2(int x, int y);
    void everyComponents(int n);
protected:
    // 存储图所用的邻接链表
    ALGraph G;
};
int Graph::find(int x) {
    for (int i = 0; i < G.vNum; i++) {
        if (x == G.VLise[i].element)
            return i;
    }
}
// 插入边
void Graph::insert2(int v1, int v2) {
    int j, k;
    j = v1 - 1;
    k = v2 - 1;
    auto p1 = new ANode;
    auto p2 = new ANode;
    // 把对应值赋给该边关联的另一个点
    p1->adv = k;
    // 下面在邻接链表中两个点对应的链表中分别加上一个相应的节点
    // p为v1点对应链表的头结点
    ANode* p= G.VLise[j].firstNode;
    // pp保存p的前驱结点
    // 对链表进行顺序遍历
    ANode* pp = NULL;
    if (p==NULL||p->adv > k) {
        p1->next = G.VLise[j].firstNode;
        G.VLise[j].firstNode = p1;
    } else {
        while (p&&p->adv < k) {
            pp = p;
            p = p->next;
        }
        if (!p) {
            pp->next = p1;
            p1->next = NULL;
        } else {
            p1->next = pp->next;
            // 插入
            pp->next = p1;
        }
    }
    // 另一个链表
    ANode* q1 = new ANode;
    ANode* q2 = new ANode;
    q1->adv = j;
    ANode* q = G.VLise[k].firstNode;
    ANode* qq = NULL;
    if (q==NULL||q->adv > j) {
        q1->next = G.VLise[k].firstNode;
        G.VLise[k].firstNode = q1;
    } else {
        while (q && q->adv < j) {
            qq = q;
            q = q->next;
        }
        if (!q) {
            qq->next = q1;
            q1->next = NULL;
        }
        else {
            q1->next = qq->next;
            qq->next = q1;
        }
    }
    G.eNum++;
}

// 删除边
// 插入和删除前都需要搜索到邻接链表的指定位置，然后再进行操作
void Graph::erase(int v1, int v2) {
    v1 = v1 - 1;
    v2 = v2 - 1;
    // v1点对应链表的头结点
    ANode *current = G.VLise[v2].firstNode;
    // 保存current的前驱结点
    ANode *trail = NULL;
    // 没找到就一直找
    while (current != NULL && current->adv != v1) {
        trail = current;
        current = current->next;
    }
    // 没找到
    if (current == NULL) {
        cout << "none" << endl;
        return;
    }
    if (trail != NULL)
        trail->next = current->next;
    else
        G.VLise[v2].firstNode = current->next;
    // 删除
    delete current;
    // 对另一个点对应的链表，也做类似操作
    ANode* current2 = G.VLise[v1].firstNode;
    ANode* trail2 = NULL;
    while (current2 != NULL && current2->adv != v2) {
        trail2 = current2;
        current2 = current2->next;
    }
    if (current2 == NULL) {
        cout << "none" << endl;
        return;
    }
    if (trail2 != NULL)
        trail2->next = current2->next;
    else
        G.VLise[v1].firstNode = current2->next;
    delete current2;
    G.eNum--;
}
// 深度优先搜索，从n点开始dfs，并输出字典序最小的dfs序列
void Graph::dfs(int n) {
    // 输出当前节点
    cout << G.VLise[n].element;
    // 标记起点已访问过
    vis[n] = false;
    ANode* p = G.VLise[n].firstNode;
    while (p) {
        // 若没访问过，则从p->adv为起点继续dfs
        if (vis[p->adv]) {
            cout << " ";
            // 递归实现dfs
            dfs(p->adv);
        }
        p = p->next;
    }
}
// 不输出的dfs
void Graph::fdfs(int n) {
    // 标记起点已访问过
    vis[n] = false;
    ANode* p = G.VLise[n].firstNode;
    while (p) {
        if (vis[p->adv]) {
            fdfs(p->adv);
        }
        p = p->next;
    }
}
// 计算从n点开始的dfs序列长度
void Graph::dfsCounter(int n) {
    // 标记起点已访问过
    vis[n] = false;
    ANode* p = G.VLise[n].firstNode;
    // 序列长度++
    ff++;
    while (p) {
        // 若没访问过，则从p->adv为起点继续dfs
        if (vis[p->adv]) {
            // 递归
            dfsCounter(p->adv);
        }
        // 链表指针后移
        p = p->next;
    }
}
// 通过队列实现bfs，并输出从n开始的字典序最小的bfs序列
void Graph::bfs(int n) {
    queue<int> q;
    // 将起点入队
    q.push(n);
    // 当队列为空时，bfs结束
    while (!q.empty()) {
        // 输出当前节点
        cout << G.VLise[q.front()].element << " ";
        // 标记起点已访问过
        vis[q.front()] = false;
        ANode* p = G.VLise[q.front()].firstNode;
        while (p) {
            // 若没访问过，则继续bfs
            if (vis[p->adv]) {
                vis[p->adv] = false;
                // 所有邻接元素依次入队
                q.push(p->adv);
            }
            // 后移
            p = p->next;
        }
        // 元素被访问过之后出队
        q.pop();
    }
    cout << endl;
}
// 输出有多少个连通分量
void Graph::components(int n) {
    memset(vis, true, sizeof(vis));
    // flag:连通分量数
    int flag=0;
    for (int i = 0; i < n; i++) {
        // 若没访问过，则以i为起点继续fbfs
        if (vis[i] == true) {
            fdfs(i);
            // 递归返回的之后执行++，在fdfs过程中把同一个SCC中的点都访问过了
            flag++;
        }
    }
    cout <<flag<<endl;
    memset(vis, true, sizeof(vis));
}
// 输出所有连通子图中最小点的编号（升序），编号间用空格分隔
void Graph::everyComponents(int n) {
    memset(vis, true, sizeof(vis));
    for (int i = 0; i < n; i++) {
        // 若没访问过,输出当前SCC中的最小点（即i+1）
        if (vis[i] == true) {
            cout << i + 1 << " ";
            // fdfs过程中将同一SCC中的点都访问过了，由于i是从小到大遍历的，故i+1一定是当前SCC中最小点
            fdfs(i);
        }
    }
    memset(vis, true, sizeof(vis));
}
// 输出从s点到t点的最短路径，若是不存在路径则输出-1
void Graph::path2(int x, int y) {
    // 通过bfs找最短路径
    queue<int> q;
    int num = G.vNum + 1;
    q.push(x);
    // 标记已访问
    vis[q.front()] = false;
    // 最短路径
    int path[num];
    // 初始化
    for (int i = 0; i < num; i++)
        path[i] = 0;
    while (!q.empty()) {
        int w = q.front();
        q.pop();
        ANode* p = G.VLise[w].firstNode;
        while (p != NULL) {
            if (vis[p->adv]) {
                if (p->adv == y) {
                    cout << path[w] + 1 << endl;
                    return;
                }
                path[p->adv] = path[w] + 1;
                q.push(p->adv);
                vis[p->adv] = false;
            }
            p = p->next;
        }
    }
    // 没找到最短路径
    cout << "-1" << endl;
}
int main() {
    // n代表图中点的个数，m为接下来对图的操作数，s为起始点，t为终点
    int n,m,s,t;
    cin >> n >> m>> s >> t;
    // 建图
    Graph A(n);
    for (int i = 0; i < m; i++) {
        // 操作，包括对边的插入和删除
        int op;
        cin >> op;
        // 操作相关的两个点
        int v1, v2;
        if(op == 0) {
            // 插入边
            cin >> v1 >> v2;
            A.insert2(v1, v2);
        } else if(op == 1) {
            // 删除边
            cin >> v1 >> v2;
            A.erase(v1, v2);
        }
    }
    // 第一行输出图中有多少个连通分量
    A.components(n);
    // 第二行输出所有连通子图中最小点的编号（升序），编号间用空格分隔
    A.everyComponents(n);
    cout << endl;
    // 第三行输出从s点开始的dfs序列长度
    A.dfsCounter(s - 1);
    cout << ff << endl;
    ff = 0;
    // 第四行输出从s点开始的字典序最小的dfs序列
    memset(vis, true, sizeof(vis));
    A.dfs(s - 1);
    cout << endl;
    // 第五行输出从t点开始的bfs序列的长度（和dfs序列肯定是等长的）
    memset(vis, true, sizeof(vis));
    A.dfsCounter(t - 1);
    cout << ff << endl;
    ff = 0;
    // 第六行输出从t点开始字典序最小的bfs序列
    memset(vis, true, sizeof(vis));
    A.bfs(t - 1);
    // 第七行输出从s点到t点的最短路径，若是不存在路径则输出-1
    memset(vis, true, sizeof(vis));
    A.path2(s - 1, t - 1);
    return 0;
}


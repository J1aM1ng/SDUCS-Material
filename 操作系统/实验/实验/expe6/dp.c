#include "dp.h"

using namespace std;

Sema::Sema(int id) {
    sem_id = id;
}

Sema::~Sema() {
}

/*
* 信号量上的 down/up 操作
* semid:信号量数组标识符
* semnum:信号量数组下标
* buf:操作信号量的结构
*/
int Sema::down() {
    struct sembuf buf;
    buf.sem_op = -1;
    buf.sem_num = 0;
    buf.sem_flg = SEM_UNDO;
    if ((semop(sem_id, &buf, 1)) < 0) {
        perror("down error ");
        exit(EXIT_FAILURE);
    }
    return EXIT_SUCCESS;
}

int Sema::up() {
    Sem_uns arg;
    struct sembuf buf;
    buf.sem_op = 1;
    buf.sem_num = 0;
    buf.sem_flg = SEM_UNDO;
    if ((semop(sem_id, &buf, 1)) < 0) {
        perror("up error ");
        exit(EXIT_FAILURE);
    }
    return EXIT_SUCCESS;
}

/*
* 用于单行道管程的互斥执行
*/
Lock::Lock(Sema
*s) //保证只有一个进程使用管程的锁
{
sema = s;
}

Lock::~Lock() {
}

//上锁
void Lock::close_lock() {
    sema->down();
}

//开锁
void Lock::open_lock() {
    sema->up();
}

//得到标识符
int OneWay::get_ipc_id(char *proc_file, key_t key) {
#define BUFSZ 256
    FILE *pf;
    int i, j;
    char line[BUFSZ], colum[BUFSZ];
    if ((pf = fopen(proc_file, "r")) == NULL) {
        perror("Proc file not open");
        exit(EXIT_FAILURE);
    }
    fgets(line, BUFSZ, pf);
    while (!feof(pf)) {
        i = j = 0;
        fgets(line, BUFSZ, pf);
        while (line[i] == ' ')
            i++;
        while (line[i] != ' ')
            colum[j++] = line[i++];
        colum[j] = '\0';
        if (atoi(colum) != key)
            continue;
        j = 0;
        while (line[i] == ' ')
            i++;
        while (line[i] != ' ')
            colum[j++] = line[i++];
        colum[j] = '\0';
        i = atoi(colum);
        fclose(pf);
        return i;
    }
    fclose(pf);
    return -1;
}

/*
*
set_shm 函数建立一个具有 n 个字节 的共享内存区
*
如果建立成功,返回 一个指向该内存区首地址的指针 shm_buf
*
输入参数:
*
shm_key 共享内存的键值
*
shm_val 共享内存字节的长度
*
shm_flag 共享内存的存取权限
*/

char *OneWay::set_shm(key_t shm_key, int shm_num, int shm_flg) //在管程中建立共享内存
{
    int i, shm_id;
    char *shm_buf;
    //测试由 shm_key 标识的共享内存区是否已经建立
    if ((shm_id = get_ipc_id("/proc/sysvipc/shm", shm_key)) < 0) {
        //shmget 新建 一个长度为 shm_num 字节的共享内存
        if ((shm_id = shmget(shm_key, shm_num, shm_flg)) < 0) {
            perror("shareMemory set error");
            exit(EXIT_FAILURE);
        }
        //shmat 将由 shm_id 标识的共享内存附加给指针 shm_buf
        if ((shm_buf = (char *) shmat(shm_id, 0, 0)) < (char *) 0) {
            perror("get shareMemory error");
            exit(EXIT_FAILURE);
        }
        for (i = 0; i < shm_num; i++)
            shm_buf[i] = 0; //初始为 0
    }
    //共享内存区已经建立,将由 shm_id 标识的共享内存附加给指针 shm_buf
    if ((shm_buf = (char *) shmat(shm_id, 0, 0)) < (char *) 0) {
        perror("get shareMemory error");
        exit(EXIT_FAILURE);
    }
    return shm_buf;
}

/*
*
set_sem 函数建立一个具有 n 个信号量的信号量
*
如果建立成功,返回 一个信号量的标识符 sem_id
*
输入参数:
*
sem_key 信号量的键值
*
sem_val 信号量中信号量的个数
*
sem_flag 信号量的存取权限
*/
int OneWay::set_sem(key_t sem_key, int sem_val, int sem_flg) //在管程中建立信号量
{
    int sem_id;
    Sem_uns sem_arg;
    //测试由 sem_key 标识的信号量是否已经建立
    if ((sem_id = get_ipc_id("/proc/sysvipc/sem", sem_key)) < 0) {
        //semget 新建一个信号量,其标号返回到 sem_id
        if ((sem_id = semget(sem_key, 1, sem_flg)) < 0) {
            perror("semaphore create error");
            exit(EXIT_FAILURE);
        }
    }
    //设置信号量的初值
    sem_arg.val = sem_val;
    if (semctl(sem_id, 0, SETVAL, sem_arg) < 0) {
        perror("semaphore set error");
        exit(EXIT_FAILURE);
    }
    return sem_id;
}

Condition::Condition(Sema
*semax1,
Sema *semax2
)
{
sema0 = semax1;
sema1 = semax2;
}

/**
* 看看是否能通过
*/
void Condition::Wait(Lock *lock, int direc) //当前车辆不能上路，利用wait方法进入条件变量的阻塞队列
{
    if (direc == 0) {
        cout << getpid() << " 号车辆在等待向东行驶"
             << "\n";
        lock->open_lock();  //开锁，让其他进程进入管程，等待被其他进程唤醒
        sema0->down();      //阻塞，等待被up唤醒
        lock->close_lock(); //关锁，自己要上路了
    } else if (direc == 1) {
        cout << getpid() << " 号车辆在等待向西行驶"
             << "\n";
        lock->open_lock();
        sema1->down();
        lock->close_lock();
    }
}

int Condition::Signal(int direc) //条件变量中唤醒相反车道上车辆进程的方法
{
    int i;
    if (direc == 0) {
        i = sema0->up();
    } else if (direc == 1) {
        i = sema1->up();
    }
    return i;
}

/*
* get_ipc_id() 从/proc/sysvipc/文件系统中获取 IPC 的 id 号
* pfile: 对应/proc/sysvipc/目录中的 IPC 文件分别为
*
msg-消息队列,sem-信号量,shm-共享内存
* key: 对应要获取的 IPC 的 id 号的键值
*/
Condition::~Condition() {};

/*
*
set_shm 函数建立一个具有 n 个字节 的共享内存区
*
如果建立成功,返回 一个指向该内存区首地址的指针 shm_buf
*
输入参数:
*
shm_key 共享内存的键值
*
shm_val 共享内存字节的长度
*
shm_flag 共享内存的存取权限
*/
OneWay::OneWay(int maxall, int maxcur) {
    //管程中的两个阻塞队列，用信号量实现
    Sema * sema0;
    Sema * sema1;
    //实现进入互斥进入管程的锁
    Sema * semaLock;
    int ipc_flg = IPC_CREAT | 0644;
    //建立共享内存
    maxCars = (int *) set_shm(100, 1, ipc_flg);       //最大车辆数
    numCars = (int *) set_shm(200, 1, ipc_flg);       //当前车辆数
    currentDire = (int *) set_shm(300, 1, ipc_flg);   //当前单行道的行驶方向
    eastCount = (int *) set_shm(501, 1, ipc_flg);     //当前单行道上向东行驶的车辆数
    westCount = (int *) set_shm(502, 1, ipc_flg);     //当前单行道上向西行驶的车辆数
    sumPassedCars = (int *) set_shm(700, 1, ipc_flg); //一共通过了多少车
    eastWait = (int *) set_shm(801, 1, ipc_flg);      //等待向东行驶的车辆数
    westWait = (int *) set_shm(802, 1, ipc_flg);      //等待向西行驶的车辆数
    int sema0_id = set_sem(401, 0, ipc_flg);         //信号量
    int sema1_id = set_sem(402, 0, ipc_flg);
    int semaLock_id = set_sem(601, maxcur, ipc_flg);
    //初始化管程中的共享内存
    *maxCars = maxcur;
    *numCars = 0;
    *currentDire = 0;
    *eastCount = 0;
    *westCount = 0;
    *sumPassedCars = 0;
    *eastWait = 0;
    *westWait = 0;
    sema0 = new
    Sema(sema0_id);
    sema1 = new
    Sema(sema1_id);
    semaLock = new
    Sema(semaLock_id);
    lock = new
    Lock(semaLock);
    condition = new
    Condition(sema0, sema1);
}

void OneWay::Arrive(int direc) {
    lock->close_lock(); //有车到达，想进入管程，先关锁
    if (direc == 0) {
        *eastWait += 1;
    } else {
        *westWait += 1;
    }
    if ((*currentDire != direc || *numCars >= *maxCars) & *sumPassedCars > 0) //如果当前不能通行
    {
        //if (direc == 0)
        //{
        //*eastWait += 1;
        //}
        //else if (direc == 1)
        //{
        //*westWait += 1;
        //}
        condition->Wait(lock, direc); //调用条件变量的wait方法，进入阻塞队列
    }
    //在被唤醒后或者车辆到达的时候满足条件，说明现在可以进入单车道，更新一下各个共享内存的状态
    if (direc == 0) //东 +1
    {
        *eastWait -= 1;
        *eastCount = *eastCount + 1;
        cout << getpid() << " 号车辆进入单车道，向东行驶\n";
    } else if (direc == 1) //西 +1
    {
        *westCount = *westCount + 1;
        *westWait -= 1;
        cout << getpid() << " 号车辆进入单车道，向西行驶\n";
    }
    *numCars = *numCars + 1;
    *currentDire = direc;
    *sumPassedCars += 1;
    lock->open_lock();
}

void OneWay::Cross(int direc) {
    lock->close_lock(); //当前车辆在路上，三秒走完
    sleep(3);
    if (direc == 0)
        cout << getpid() << " 号车辆向东行驶过车道"
             << "\n";
    else if (direc == 1)
        cout << getpid() << " 号车辆向西行驶过车道"
             << "\n";
    lock->open_lock();
}

void OneWay::Quit(int direc) {
    lock->close_lock();
    *numCars -= 1;
    if (direc == 0) {
        cout << getpid() << " 号向东行驶的车辆离开"
             << "\n";
    } else if (direc == 1) {
        cout << getpid() << " 号向西行驶的车辆离开"
             << "\n";
    }
    if (*numCars == 0) {
        if (direc == 0) {
            if (*westWait > 0) {
                condition->Signal(1);
            } else if (*eastWait > 0) {
                condition->Signal(0);
            }
        } else if (direc == 1) {
            if (*eastWait > 0) {
                condition->Signal(0);
            } else if (*westWait > 0) {
                condition->Signal(1);
            }
        }
    }
    lock->open_lock();
}

OneWay::~OneWay() {
    delete condition;
}

int main(int argc, char **argv) {
    int maxCars;
    int maxSingelDirect;
    cout << "请输入总车辆数:";
    cin >> maxCars;
    cout << "请输入单方向通过的最大车数:";
    cin >> maxSingelDirect;
    OneWay * oneWay = new
    OneWay(maxCars, maxSingelDirect);
    //建立管程,判断可不可进、决定方向,进入单行道
    int i;
    int pid[maxCars];
    for (i = 0; i < maxCars; i++) //对每一辆车都创建一个子进程
    {
        pid[i] = fork();
        if (pid[i] == 0) {
            sleep(1);
            srand(getpid());
            int direct;
            direct = rand() % 2;
            //direct=*oneWay->sumPassedCars%2;
            oneWay->Arrive(direct);
            oneWay->Cross(direct);
            oneWay->Quit(direct);
            exit(EXIT_SUCCESS);
        }
    }
    for (i = 0; i < maxCars; i++) {
        waitpid(pid[i], NULL, 0);
    }
    cout << *(oneWay->eastCount) << "辆列车向东" << *(oneWay->westCount)
         << "辆列车向西,正常通行.\n";
    delete oneWay;
    return EXIT_SUCCESS;
}

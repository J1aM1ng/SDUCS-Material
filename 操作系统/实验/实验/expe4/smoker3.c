#include "ipc.h"
int main(int argc,char *argv[])
{
    int rate;
//可在在命令行第一参数指定一个进程睡眠秒数，以调解进程执行速度
    if(argv[1] != NULL)
        rate = atoi(argv[1]);
    else
        rate = 3; //不指定为 1 秒
//共享内存 使用的变量
    buff_key = 101; //缓冲区任给的键值
    buff_num = 3; //缓冲区任给的长度
    cget_key = 103; //消费者取产品指针的键值
    cget_num = 1; //指针数
    shm_flg = IPC_CREAT | 0644; //共享内存读写权限
//获取缓冲区使用的共享内存，buff_ptr 指向缓冲区首地址
    buff_ptr = (char *)set_shm(buff_key,buff_num,shm_flg);
//获取消费者取产品指针，cget_ptr 指向索引地址
    cget_ptr = (int *)set_shm(cget_key,cget_num,shm_flg);
//信号量使用的变量
    prod1_key = 201;//生产者同步信号灯键值
    prod2_key = 202;//生产者同步信号灯键值
    prod3_key = 203;//生产者同步信号灯键值
    pmtx_key = 204;//生产者互斥信号灯键值
    cmtx_key = 205;//消费者互斥信号灯键值
    ab_key = 301;//有C的消费者控制键值
    ac_key = 302;//有B的消费者控制键值
    bc_key = 303;//有A的消费者控制键值
    sem_flg = IPC_CREAT | 0644;
//生产者同步信号灯初值设为缓冲区最大可用量
    sem_val = 1;
//获取生产者同步信号灯，引用标识存 prod_sem
    prod1_sem = set_sem(prod1_key,sem_val,sem_flg);
    prod2_sem = set_sem(prod2_key,sem_val,sem_flg);
    prod3_sem = set_sem(prod3_key,sem_val,sem_flg);
//消费者初始无产品可取，同步信号灯初值设为 0
    sem_val = 0;
    ab_sem = set_sem(ab_key,sem_val,sem_flg);
    ac_sem = set_sem(ac_key,sem_val,sem_flg);
    bc_sem = set_sem(bc_key,sem_val,sem_flg);
//消费者互斥信号灯初值为1
    sem_val = 1;
//消费者互斥信号灯，引用标识存 cmtx_sem
    cmtx_sem = set_sem(cmtx_key,sem_val,sem_flg);
//生产者互斥信号灯初值为 1
    sem_val = 1;
//获取生产者互斥信号灯，引用标识存 pmtx_sem
    pmtx_sem = set_sem(pmtx_key,sem_val,sem_flg);
    while(1)
    {
        down(ab_sem);
        down(cmtx_sem);
        sleep(rate);
        printf("%d 吸烟者3号在第[2]缓冲区得到了烟草和胶水\n",getpid());
        //*cget_ptr = (*cget_ptr+1) % buff_num;
        up(cmtx_sem);
        up(prod3_sem);
    }
    return EXIT_SUCCESS;
}



#include "ipc.h"
int main(int argc, char *argv[])
{
    int rate;
    //可在在命令行第一参数指定一个理发速度
    if (argv[1] != NULL)
        rate = atoi(argv[1]);
    else
        rate = 5; //默认理发速度为 5 秒
    srand((unsigned)time(NULL));
    struct msqid_ds msg_sofa_info;
    Msg_buf msg_arg;
    sem_flg = IPC_CREAT | 0644;

    //建立一个互斥账本信号量，用于账本互斥访问
    s_account_key = 100;
    // 互斥信号量初值为1
    s_account_val = 1;
    s_account_sem = set_sem(s_account_key, s_account_val, sem_flg);

    //建立一个同步顾客信号量
    s_customer_key = 200;
    //同步信号量初值为0，初始时没有顾客
    s_customer_val = 0;
    s_customer_sem = set_sem(s_customer_key, s_customer_val, sem_flg);

    //建立沙发消息队列，用于交换信息
    q_flg = IPC_CREAT | 0644;
    q_sofa_key = 300;
    q_sofa_id = set_msq(q_sofa_key, q_flg);

    //建立等候室消息队列，用于交换信息
    q_flg = IPC_CREAT | 0644;
    q_wait_key = 400;
    q_wait_id = set_msq(q_wait_key, q_flg);

    //建立 3 个理发师进程;
    int pid[3];
    int i;
    for (i = 0; i < 3; i++)
    {
        pid[i] = fork();
        if (pid[i] == 0)
        { //子进程（理发师进程）
            while (1)
            {
                //查看沙发上顾客的人数
                msgctl(q_sofa_id, IPC_STAT, &msg_sofa_info);
                //如果沙发上没人，理发师就睡觉
                if (msg_sofa_info.msg_qnum == 0)
                    printf("%d 号理发师睡眠\n", getpid());
                //若理发师没睡眠，说明沙发上有人，以阻塞方式从沙发队列接收一条消息
                msgrcv(q_sofa_id, &msg_arg, sizeof(msg_arg), SOFA, 0);
                //通过signal（顾客同步信号量）操作唤醒顾客进程(让下一顾客坐入沙发)
                up(s_customer_sem);
                printf("%d 号理发师开始给 %d 号顾客理发\n", getpid(), msg_arg.mid);
                //通过给定的理发速率进行理发
                sleep(rate);
                printf("%d 号理发师给 %d 号顾客理发完成\n", getpid(), msg_arg.mid);
                //通过wait(记账本互斥信号量)来互斥使用记账本
                down(s_account_sem);
                printf("%d 号理发师和 %d 号顾客使用记账本\n", getpid(), msg_arg.mid);
                //通过signal(记账本互斥信号量)来互斥释放记账本
                up(s_account_sem);
            }
        }
    }
    return EXIT_SUCCESS;
}

#include "ipc.h"
int main(int argc, char *argv[])
{
    int rate;
    //可在在命令行第一参数指定一个顾客到达速度
    if (argv[1] != NULL)
        rate = atoi(argv[1]);
    else
        rate = 1; //默认顾客到达速度为 1 秒
    srand((unsigned)time(NULL));
    Msg_buf msg_arg;
    //沙发上的顾客数量
    struct msqid_ds msg_sofa_info;
    //等候室中的顾客数量
    struct msqid_ds msg_wait_info;

    sem_flg = IPC_CREAT | 0644;
    //建立一个互斥账本信号量，用于账本互斥访问
    s_account_key = 100;
    //互斥信号量初始值为1，说明开始的时候记账本空着，可以被使用
    s_account_val = 1;
    s_account_sem = set_sem(s_account_key, s_account_val, sem_flg);

    //建立一个同步顾客信号量
    s_customer_key = 200;
    //初始值为0，说明一开始没有顾客
    s_customer_val = 0;
    s_customer_sem = set_sem(s_customer_key, s_customer_val, sem_flg);

    //建立沙发消息队列，用于交换信息
    q_flg = IPC_CREAT | 0644;
    q_sofa_key = 300;
    q_sofa_id = set_msq(q_sofa_key, q_flg);

    //建立等候室消息队列，用于交换信息
    q_wait_key = 400;
    q_wait_id = set_msq(q_wait_key, q_flg);

    int customerNumber = 1;
    while (1)
    {
        //查看沙发上顾客的人数
        msgctl(q_sofa_id, IPC_STAT, &msg_sofa_info);
        //若沙发上的顾客数量小于4个，说明没坐满，表明需要通过沙发消息队列等待顾客进入（沙发）的消息
        if (msg_sofa_info.msg_qnum < 4)
        {
            //以非阻塞方式接收消息
            quest_flg = IPC_NOWAIT;
            //以非阻塞的方式在等候室消息队列接收一条消息（有顾客/没顾客）
            //若等候室有顾客，唤醒一个顾客使其进入沙发
            if (msgrcv(q_wait_id, &msg_arg, sizeof(msg_arg), WAIT, quest_flg) >= 0)
            {
                msg_arg.mtype = SOFA;
                printf("%d号新顾客坐入沙发\n", msg_arg.mid);
                //向沙发消息队列中发送顾客进入（沙发）的消息
                msgsnd(q_sofa_id, &msg_arg, sizeof(msg_arg), IPC_NOWAIT);
            }
            //等候室没顾客，新来的顾客直接进入沙发队列
            else
            {
                msg_arg.mtype = SOFA;
                msg_arg.mid = customerNumber;
                customerNumber++;
                printf("%d号新顾客坐入沙发\n", msg_arg.mid);
                //向沙发消息队列中发送顾客进入（沙发）的消息
                msgsnd(q_sofa_id, &msg_arg, sizeof(msg_arg), IPC_NOWAIT);
            }
        }
        //沙发坐满了
        else
        {
            //读取等候室顾客的数量
            msgctl(q_wait_id, IPC_STAT, &msg_wait_info);
            //若等候室没坐满，则新顾客可以进入等候室
            if (msg_wait_info.msg_qnum < 13)
            {
                msg_arg.mtype = WAIT;
                msg_arg.mid = customerNumber;
                printf("沙发座满,%d号新顾客进入等候室\n", customerNumber);
                customerNumber++;
                //向等候室消息队列中发送顾客进入（等候室）的消息
                msgsnd(q_wait_id, &msg_arg, sizeof(msg_arg), IPC_NOWAIT);
            }
            //沙发和等候室都满了
            else
            {
                printf("等候室满,%d号新顾客没有进入理发店\n", customerNumber);
                //wait(顾客同步信号量)来等待有顾客理完发
                down(s_customer_sem);
            }
        }
        //用进程休眠指定时间模拟顾客到达的时间间隔。
        sleep(rate);
    }
    return EXIT_SUCCESS;
}

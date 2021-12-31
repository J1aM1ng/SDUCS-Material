#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <sys/sem.h>
#include <sys/msg.h>
#include<sys/time.h>
#include<sys/resource.h>
#include<unistd.h>
#define BUFSZ 256
//建立或获取 ipc 的一组函数的原型说明
int get_ipc_id(char *proc_file,key_t key);
char *set_shm(key_t shm_key,int shm_num,int shm_flag);
int set_msq(key_t msq_key,int msq_flag);
int set_sem(key_t sem_key,int sem_val,int sem_flag);
int down(int sem_id);
int up(int sem_id);
/*信号灯控制用的共同体*/
typedef union semuns
{
    int val;
} Sem_uns;
/* 消息结构体*/
typedef struct msgbuf
{
    long mtype;
    char mtext[1];
} Msg_buf;
//生产消费者共享缓冲区即其有关的变量
key_t buff_key;
int buff_num;
char *buff_ptr;
//生产者放产品位置的共享指针
key_t pput_key;
int pput_num;
int *pput_ptr;
//消费者取产品位置的共享指针
key_t cget_key;
int cget_num;
int *cget_ptr;
//生产者和消费者有关的信号量
key_t ab_key;
key_t ac_key;
key_t bc_key;
key_t cmtx_key;
key_t prod1_key;
key_t prod2_key;
key_t prod3_key;
key_t pmtx_key;
int ab_sem;
int ac_sem;
int bc_sem;
int prod1_sem;
int prod2_sem;
int prod3_sem;
int pmtx_sem;
int cmtx_sem;

int sem_val;
int sem_flg;
int shm_flg;


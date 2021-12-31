#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <pthread.h>
// 分别存储x与y对应的无名管道标号
int pipe1[2], pipe2[2];
// 存放三个线程标识 id
pthread_t thrd1, thrd2, thrd3;
int fy(int y)
{ // y要执行的函数 f(y)
    if (y == 1 || y == 2)
    {
        return 1;
    }
    else
    {
        return fy(y - 1) + fy(y - 2);
    }
}
void task1(int *x)
{ // 线程1的执行函数原型，计算f(x)
    printf("task1 is running!\n");
    int ansx = 1;
    // 迭代求值
    for (int i = 1; i <= *x; i++)
    {
        ansx *= i;
    }
    // 将ansx写入管道1
    write(pipe1[1], &ansx, sizeof(int));
    printf("thread1 write f(x) = %d to thread3\n", ansx);
    // 执行完写入后关闭管道1
    close(pipe1[1]);
}
void task2(int *y)
{ // 线程2的执行函数原型，计算f(y)
    printf("task2 is running!\n");
    // ansy存放f(y)执行结果
    int ansy = fy(*y);
    // 将ansy写入管道2
    write(pipe2[1], &ansy, sizeof(int));
    printf("thread2 write f(y) = %d to thread3\n", ansy);
    // 执行完写入后关闭管道2
    close(pipe2[1]);
}
void task3(int *num)
{ // 线程3的执行函数原型，计算f(x,y)=f(x)+f(y)，即计算两者之和
    printf("task3 is running!\n");
    int ansx, ansy, ans;
    // 分别从管道1和管道2中读出f(x)和f(y)的结果
    read(pipe1[0], &ansx, sizeof(int));
    printf("thread3 read f(x) = %d from thread1\n", ansx);
    read(pipe2[0], &ansy, sizeof(int));
    printf("thread3 read f(y) = %d from thread2\n", ansy);
    // 读出后关闭管道1和管道2
    close(pipe1[0]);
    close(pipe2[0]);
    // 执行相加操作
    ans = ansx + ansy;
    printf("f(x,y) = %d\n", ans);
}
int main(int argc, char *arg[])
{
    // 保存pthread_create()函数调用返回值
    int ret;
    int x, y;
    // 使用 pipe() 系统调用建立两个无名管道。建立不成功程序退出,执行终止
    if (pipe(pipe1) < 0)
    {
        perror("pipe1 not create!");
        exit(EXIT_FAILURE);
    }
    if (pipe(pipe2) < 0)
    {
        perror("pipe2 not create!");
        exit(EXIT_FAILURE);
    }
    // 用户输入x和y
    printf("please input x,y\n");
    scanf("%d%d", &x, &y);
    // 使用 pthread_create 系统调用建立两个线程。建立不成功程序退出,执行终止
    // 保存新线程的标识符指针，使用默认线程属性，新建的进程中要执行的函数的指针即f(x)，task1函数的参数
    // 执行成功返回 0 ,并在 thread 中保存线程标识符，执行失败则返回一个非 0 的出错代码。
    ret = pthread_create(&thrd1, NULL, (void *)task1, (void *)&x);
    if (ret)
    {
        perror("pthread_create:f1 failire!");
        exit(EXIT_FAILURE);
    }
    ret = pthread_create(&thrd2, NULL, (void *)task2, (void *)&y);
    if (ret)
    {
        perror("pthread_create:f1 failure!");
        exit(EXIT_FAILURE);
    }
    int num = 1;
    ret = pthread_create(&thrd3, NULL, (void *)task3, (void *)&num);
    if (ret)
    {
        perror("pthread_create:f1 failure!");
        exit(EXIT_FAILURE);
    }
    // 主线程等待3个子线程退出
    pthread_join(thrd1, NULL);
    pthread_join(thrd2, NULL);
    pthread_join(thrd3, NULL);
    exit(EXIT_SUCCESS);
}
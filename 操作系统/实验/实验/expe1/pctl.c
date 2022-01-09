#include "pctl.h"
int main(int argc, char *argv[])
{
    //如果在命令行上没输入子进程要执行的命令 //则执行缺省的命令
    int i;
    int pid;                                //存放子进程号
    int status;                             //存放子进程返回状态
    char *args[] = {"/bin/ls", "-a", NULL}; //子进程要缺省执行的命令
    signal(SIGINT, (sighandler_t)sigcat);   //注册一个本进程处理键盘中断的函数
    perror("SIGINT");                       //如果系统调用 signal 成功执行，输出”SIGINT”，否则，
    //输出”SIGINT”及出错原因
    pid = fork(); //建立子进程
    if (pid < 0)  // 建立子进程失败? {
        printf("Create Process fail!\n");
    exit(EXIT_FAILURE);
}
if (pid == 0) // 子进程执行代码段
{
    //报告父子进程进程号
    printf("I am Child process %d\nMy father is %d\n", getpid(), getppid());
    pause(); //暂停，等待键盘中断信号唤醒
    //子进程被键盘中断信号唤醒继续执行
    printf("%d child will Running: \n", getpid()); //
    if (argv[1] != NULL)
    {
        //如果运行该程序是用命令行参数指定了子进程要执行的命令
        //则执行输入行参数中给定的程序
        for (i = 1; argv[i] != NULL; i++)
            printf("%s ", argv[i]);
        printf("\n");
        //装入并执行新的程序
        status = execve(argv[1], &argv[1], NULL);
    }
    else
    {
        //如果命令行参数没给出子进程要执行的程序，即运行程序时没有命令行参数
        //则执行缺省的命令，即 ls -a
        for (i = 0; args[i] != NULL; i++)
            printf("%s ", args[i]);
        printf("\n");
        //装入并执行新的程序
        status = execve(args[0], args, NULL);
    }
}
else //父进程执行代码段
{
    printf("\nI am Parent process %d\n", getpid()); //报告父进程进程号
    if (argv[1] != NULL)
    {
        //如果在命令行上输入了子进程要执行的命令
        //则父进程等待子进程执行结束
        6 7 printf("%d Waiting for child done.\n\n", getpid());
        waitpid(pid, &status, 0); //等待子进程结束
        printf("\nMy child exit! status = %d\n\n", status);
    }
    else
    {
        //如果在命令行上没输入子进程要执行的命令
        //唤醒子进程，与子进程并发执行不等待子进程执行结束
        sleep(5); //思考：如果去掉这条语句，可能会出现什么现象
        if (kill(pid, SIGINT) >= 0)
            printf("%d Wakeup %d child.\n", getpid(), pid);
        printf("%d don't Wait for child done.\n\n", getpid());
    }
}
return EXIT_SUCCESS;
}
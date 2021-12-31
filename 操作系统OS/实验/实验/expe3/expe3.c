//#define debug_alpha1
#include <sys/types.h>
#include <wait.h>
#include <unistd.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <fcntl.h>
#include <string.h>

//C readline
#include <locale.h>
#include <ctype.h>

//GNU readline
#include <readline/readline.h>
#include <readline/history.h>

//GNU Editline
#include <editline/readline.h>

#define READ 0
#define WRITE 1
#define M_LENGTH 64 //CLI一行命令的最大长度
#define M_ARGS 8		//一个程序调用能包含的最大参数数量（包括程序名称本身）

void *xmalloc(size_t size);
void initialize_readline();

/* Forward declarations. */
char *stripwhite(char *string);

/* Look up NAME as the name of a command, and return a pointer to that
 command.  Return a NULL pointer if NAME isn't a command name. */

/* Strip whitespace from the start and end of STRING.  Return a pointer
 into STRING. */
char *stripwhite(char *string)
{
	register char *s, *t;

	for (s = string; isspace(*s); s++)
		;

	if (*s == 0)
		return (s);

	t = s + strlen(s) - 1;
	while (t > s && isspace(*t))
		t--;
	*++t = '\0';

	return s;
}

/* **************************************************************** */
/*                                                                  */
/*                  Interface to Readline Completion                */
/*                                                                  */
/* **************************************************************** */

char *command_generator(const char *, int);
char **fileman_completion(const char *, int, int);

/* Tell the GNU Readline library how to complete.  We want to try to
 complete on command names if this is the first word in the line, or
 on filenames if not. */
void initialize_readline()
{
	/* Allow conditional parsing of the ~/.inputrc file. */
	rl_readline_name = "FileMan";

	/* Tell the completer that we want a crack first. */
	rl_attempted_completion_function = fileman_completion;
}

/* Attempt to complete on the contents of TEXT.  START and END
 bound the region of rl_line_buffer that contains the word to
 complete.  TEXT is the word to complete.  We can use the entire
 contents of rl_line_buffer in case we want to do some simple
 parsing.  Returnthe array of matches, or NULL if there aren't any. */
char **fileman_completion(const char *text, int start, int end)
{
	char **matches;

	matches = (char **)NULL;

	/* If this word is at the start of the line, then it is a command
	 to complete.  Otherwise it is the name of a file in the current
	 directory. */
	if (start == 0)
		/* TODO */
		matches = rl_completion_matches(text, command_generator);
	/* matches = rl_completion_matches (text, command_generator); */

	return (matches);
}

/* Generator function for command completion.  STATE lets us
 know whether to start from scratch; without any state
 (i.e. STATE == 0), then we start at the top of the list. */
char *command_generator(const char *text, int state)
{
	/* If this is a new word to complete, initialize now.  This
	 includes saving the length of TEXT for efficiency, and
	 initializing the index variable to 0. */
	/* If no names matched, then return NULL. */
	return ((char *)NULL);
}

void *xmalloc(size_t size)
{
	register void *value = (void *)malloc(size);
	if (value == 0)
		fprintf(stderr, "virtual memory exhausted");
	return value;
}

typedef void (*sighandler_t)(int);
char *testStr = "tStr\n";

void redirect_file(int k, char *path, int flag);
int redirect_pipe(int k, int pipe_id[2]);
void pipeFailure();

void catch_signal(int sign)
{
	switch (sign)
	{
	case SIGPIPE:
		printf("SIGPIPE signal\n");
		exit(0);
		break;
	}
}

int progCntr = 0; //子程序的总数（用于给出prog数组长度）
struct Program
{
	char *args[M_ARGS];																			 //args[0]是子程序名称
	char fileStdIn, fileStdOut, fileErrOut, tubeIn, tubeOut; //4 booleans.
	char stdInFile[M_LENGTH], stdOutFile[M_LENGTH], errOutFile[M_LENGTH];
	char tmp[M_ARGS][M_LENGTH];
	char tmp2[M_ARGS][M_LENGTH];
	char tmp3[M_LENGTH];
	int argCntr, tmpCntr; //该子程序的参数总数（用于给出args,tmp数组长度）
	int pipe[2];
};
struct Program *prog;

int getline_(char s[], int lim)
{
	int c, i;
	i = 0;
	while ((c = getchar()) != EOF && c != '\n' && i < lim - 1)
		s[i++] = c;
	s[i] = '\0';
	return i;
}

char backGround = 0;
void getRedirect();
char promptAndSplit()
{
	// char *cc = (char *)malloc(M_LENGTH);
	// getline_(cc,M_LENGTH);

	char isCd = 0;

	char *line, *s;
	setlocale(LC_CTYPE, "");
	initialize_readline();
	stifle_history(7);
	line = readline("");
	s = stripwhite(line);

	if (*s)
	{

		char *expansion;
		int result;

		result = history_expand(s, &expansion);

		if (result < 0 || result == 2)
		{
			fprintf(stderr, "%s/n", expansion);
		}
		else
		{
			add_history(expansion);
		}
		free(expansion);
	}

	//end loop

	char *delim = "|";
	char *p;
	// printf("%s\n",line);
	//判断是否后台执行,并去掉“&”(注意，这种算法只支持一个“&”的情况！多个“&”属于非法输入。)
	int andIndex = -1;
	for (int i = 0; i < M_LENGTH && line[i] != '\0'; i++)
		if (line[i] == '&')
		{
			if (andIndex != -1)
			{
				printf("invalid &.\n");
				exit(-1);
			}
			backGround = 1;
			andIndex = i;
		}

	if (andIndex != -1)
		for (int i = andIndex; i < M_LENGTH && line[i] != '\0'; i++)
		{
			line[i] = line[i + 1];
		}

	//给每个子程序截取到其管道分隔的字符串
	int pIndex = 0; //pcntr是从0开始计算，所以是实际子程序数量-1.
	p = strtok(line, delim);
	strcpy(prog[pIndex].tmp3, p);
	while ((p = strtok(NULL, delim)))
	{
		pIndex++;
		strcpy(prog[pIndex].tmp3, p);
	}
	progCntr = pIndex + 1;

	//用空格对各个子程序分别继续截取
	for (int pIndex = 0; pIndex < progCntr; pIndex++)
	{
		delim = " ";
		int argIndex = 0;
		p = strtok(prog[pIndex].tmp3, delim);

		strcpy(prog[pIndex].tmp[argIndex], p);
		while ((p = strtok(NULL, delim)))
		{
			argIndex++;
			strcpy(prog[pIndex].tmp[argIndex], p);
		}
		prog[pIndex].tmpCntr = argIndex + 1; //tmp数组的长度
	}

	//cd的实现
	for (int pIndex = 0; pIndex < progCntr; pIndex++)
	{
		// printf(prog[pIndex].tmp[0]);printf("\n");
		if (strcmp(prog[pIndex].tmp[0], "cd") == 0)
		{
			chdir(prog[pIndex].tmp[1]);
			isCd = 1;
		}
	}

	return isCd;
}

void getRedirect()
{
	//对于各子程序，从其tmp数组中分析文件重定向，顺便装载其参数到其结构体中的args
	for (int pIndex = 0; pIndex < progCntr; pIndex++)
	{

		if (pIndex != progCntr - 1 && progCntr > 1)
			prog[pIndex].tubeOut = 1; //如果使用了管道，那么必然要开放管道
		if (pIndex != 0 && progCntr > 1)
			prog[pIndex].tubeIn = 1;

		for (int i = 0; i < prog[pIndex].tmpCntr; i++)
		{

			if (strcmp("<", prog[pIndex].tmp[i]) == 0)
			{
				prog[pIndex].fileStdIn = 1;
				strcpy(prog[pIndex].stdInFile, prog[pIndex].tmp[i + 1]);
				++i;
			}
			else if (strcmp("<<", prog[pIndex].tmp[i]) == 0)
			{
				prog[pIndex].fileStdIn = 2;
				strcpy(prog[pIndex].stdInFile, prog[pIndex].tmp[i + 1]);
				++i;
			}
			else if (strcmp(">", prog[pIndex].tmp[i]) == 0)
			{
				prog[pIndex].fileStdOut = 1;
				strcpy(prog[pIndex].stdOutFile, prog[pIndex].tmp[i + 1]);
				++i;
			}
			else if (strcmp("2>", prog[pIndex].tmp[i]) == 0)
			{
				prog[pIndex].fileErrOut = 1;
				strcpy(prog[pIndex].errOutFile, prog[pIndex].tmp[i + 1]);
				++i;
			}
			else if (strcmp(">>", prog[pIndex].tmp[i]) == 0)
			{
				prog[pIndex].fileStdOut = 2;
				strcpy(prog[pIndex].stdOutFile, prog[pIndex].tmp[i + 1]);
				++i;
			}
			else if (strcmp("&>>", prog[pIndex].tmp[i]) == 0)
			{
				prog[pIndex].fileErrOut = 2;
				prog[pIndex].fileStdOut = 2;
				strcpy(prog[pIndex].errOutFile, prog[pIndex].tmp[i + 1]);
				strcpy(prog[pIndex].stdOutFile, prog[pIndex].tmp[i + 1]);
				++i;
			}
			else
			{
				//如果上面都不成立，就说明这只是一个简单的args
				strcpy(prog[pIndex].tmp2[prog[pIndex].argCntr], prog[pIndex].tmp[i]);
				//更新该子程序的args总数
				++prog[pIndex].argCntr;
			}
		}
		//真正装载进args数组中
		for (int i = 0; i < prog[pIndex].argCntr; i++)
		{
			prog[pIndex].args[i] = (char *)malloc(M_LENGTH);
			strcpy(prog[pIndex].args[i], prog[pIndex].tmp2[i]);
		}
	}

#ifdef debug_alpha1
	// debug开始：
	printf("progCntr:%d\n", progCntr);
	for (int pIndex = 0; pIndex < progCntr; pIndex++)
	{
		printf("%d%s \n", pIndex, ":");
		printf("%s %d\n", "tubeinBool:", prog[pIndex].tubeIn);
		printf("%s %d\n", "tubeOutBool:", prog[pIndex].tubeOut);
		printf("%s %d\n", "fileStdInBool:", prog[pIndex].fileStdIn);
		printf("%s %d\n", "fileStdOutBool:", prog[pIndex].fileStdOut);
		printf("%s %d\n", "fileErrOutBool:", prog[pIndex].fileErrOut);
		printf("%s %s\n", "errOutPath:", prog[pIndex].errOutFile);
		printf("%s %s\n", "stdInPath:", prog[pIndex].stdInFile);
		printf("%s %s\n", "stdOutPath:", prog[pIndex].stdOutFile);
		printf("%s%d\n", "args: ", prog[pIndex].argCntr);
		for (int i = 0; i < prog[pIndex].argCntr; i++)
		{
			printf("%s ", prog[pIndex].args[i]);
		}
		printf("\n");
	}
#endif
}

int status; //存放子进程返回状态
pid_t exceProcess(int pIndex);
void processerFunc();

int main(int argc, char *argv[])
{

	int i;
	int pid;																//存放子进程号
	char *args[] = {"/bin/ls", "-a", NULL}; //子进程要缺省执行的命令
	struct Program progCreate[M_LENGTH] = {0};
	prog = progCreate;

	while (1)
	{
		//接收用户指令，并处理完毕
		if (promptAndSplit() == 1)
			continue;

		pid = fork(); //建立子进程

		signal(SIGPIPE, (sighandler_t)catch_signal); //设置捕获错误信号
																								 // perror("SIGINT");  //如果系统调用signal成功执行，输出”SIGINT”.

		if (pid < 0) // 建立子进程失败?
		{
			printf("[ERROR] Create Process fail!\n");
			exit(EXIT_FAILURE);
		}

		if (pid == 0)
		{
			// 子进程执行代码段
			processerFunc();
		}
		else
		{
//父进程代码
#ifdef debug_alpha1
			printf("\nI am Parent process	%d\n", getpid()); //报告父进程进程号
#endif

			if (backGround == 0)
			{
				waitpid(pid, &status, 0); //等待子进程结束
#ifdef debug_alpha1
				printf("\nMy child exit! status = %d\n\n", status);
#endif
			}

			prog = (struct Program *)malloc(M_LENGTH * sizeof(struct Program)); //当前指令处理完成，清理本条指令对应的子程序数组
			backGround = 0;																											//恢复后台执行选项
		}
	}

	return EXIT_SUCCESS;
}

void processerFunc()
{
	int pid; //存放子进程号

	struct Program *progCreate = (struct Program *)malloc(M_LENGTH * sizeof(struct Program));
	memcpy(progCreate, prog, M_LENGTH * sizeof(struct Program));
	prog = progCreate;
	getRedirect();

	pid_t lastPid;

	for (int pIndex = 0; pIndex < progCntr; pIndex++)
		if (pipe(prog[pIndex].pipe) < 0)
			pipeFailure();

	for (int pIndex = 0; pIndex < progCntr; pIndex++)
	{
		//对管道序列进行串行执行(分别建立子进程)，并允许前者和后者通过管道进行通信

		lastPid = exceProcess(pIndex);

//不用等待子进程结束。否则，就会导致“双重阻塞”，没有人能来唤醒他！
#ifdef debug_alpha1
		printf("\n[PF] My child exit! status = %d\n", status);
#endif
		if (status != 0)
			printf("[ERROR] Invalid Command!\n");
	}

	for (int pIndex = 0; pIndex < progCntr; pIndex++)
	{
		close(prog[pIndex].pipe[0]);
		close(prog[pIndex].pipe[1]);
	}

#ifdef debug_alpha1
	printf("processerFunc ends.\n");
#endif

	exit(0); //必须手动exit，否则无法自动结束该进程的执行，导致用户主进程一直等待该进程的结束。
}

pid_t exceProcess(int pIndex)
{

	pid_t pid;

	pid = fork(); //建立子进程

	signal(SIGPIPE, (sighandler_t)catch_signal); //设置捕获错误信号
	// perror("SIGINT");  //如果系统调用signal成功执行，输出”SIGINT”.

	for (int pi = 0; pi < pIndex - 1; pi++)
	{
		close(prog[pi].pipe[0]);
		close(prog[pi].pipe[1]);
	}

	if (pid < 0) // 建立子进程失败?
	{
		printf("[ERROR] Create Process fail!\n");
		exit(EXIT_FAILURE);
	}

	if (pid == 0) // 子进程执行代码段
	{
//报告父子进程进程号
#ifdef debug_alpha1
		printf("I am Child process %d\nMy father is %d\n", getpid(), getppid());
#endif

		//检查并重定向stdin输入管道,index-1是因为要从前一个进程的管道读入，且tubein==1则index必然>1
		if (prog[pIndex].tubeIn == 1)
			redirect_pipe(0, prog[pIndex - 1].pipe);

		//检查并重定向stdout输出管道
		if (prog[pIndex].tubeOut == 1)
			redirect_pipe(1, prog[pIndex].pipe);

		//检查并重定向stdin文件
		if (pIndex == 0 && prog[pIndex].fileStdIn == 1)
			redirect_file(0, prog[pIndex].stdInFile, O_RDONLY);

		//检查并重定向stdout文件
		if (pIndex == progCntr - 1 && prog[pIndex].fileStdOut == 1)
			redirect_file(1, prog[pIndex].stdOutFile, O_RDWR | O_CREAT);

		//检查并重定向stdout文件(append)
		if (pIndex == progCntr - 1 && prog[pIndex].fileStdOut == 2)
			redirect_file(1, prog[pIndex].stdOutFile, O_RDWR | O_APPEND | O_CREAT);

		//检查并重定向errout文件
		if (pIndex == progCntr - 1 && prog[pIndex].fileErrOut == 1)
			redirect_file(1, prog[pIndex].errOutFile, O_RDWR | O_CREAT);

		//检查并重定向errout文件(append)
		if (pIndex == progCntr - 1 && prog[pIndex].fileErrOut == 2)
			redirect_file(1, prog[pIndex].errOutFile, O_RDWR | O_APPEND | O_CREAT);

		status = execvp(prog[pIndex].args[0], prog[pIndex].args);
	}

	return pid;
}

void redirect_file(int k, char *path, int flag)
{
	//重定向标准设备到文件
	int fd = open(path, flag);
	close(k);
	dup(fd);
}

int redirect_pipe(int k, int pipe_id[2])
{
	//重定向标准设备到管道
	if (!pipe_id)
		printf("invalid pipe.\n");
	close(k);
	dup(pipe_id[k]);
	close(pipe_id[WRITE]);
	close(pipe_id[READ]);
}

void pipeFailure()
{
	//管道创建错误，则报错并结束
	perror("pipe  create failed\n");
	exit(EXIT_FAILURE);
}
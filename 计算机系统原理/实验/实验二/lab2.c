#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <string.h>
#define M_LENGTH 256
void redirect_file(int k, char *path, int flag)
{
	//重定向标准设备到文件
	int fd = open(path, flag);
	close(k);
	dup(fd);
}
int my_getfile(char *s, int lim)
{
	int c, i;
	i = 0;
	while ((c = getchar()) != EOF && c != '\n' && i < lim - 1)
	{
		s[i++] = c;
	}

	s[i] = '\0';
	return i;
}
int key;
int main(int argc, char *argv[])
{
	char *pathIn = (char *)malloc(M_LENGTH);
	char *pathOut = (char *)malloc(M_LENGTH);
	char *input = (char *)malloc(M_LENGTH);
	char *output = (char *)malloc(M_LENGTH);
	printf("inputFile?\n");
	scanf("%s", pathIn);
	printf("outputFile?\n");
	scanf("%s", pathOut);
	printf("key?\n");
	scanf("%d", &key);
	redirect_file(0, pathIn, O_RDWR);
	redirect_file(1, pathOut, O_RDWR);
	getchar();
	my_getfile(input, M_LENGTH);
	int i;
	for (i = 0; i < strlen(input); i++)
		output[i] = input[i] ^ key;
	printf("%s\n", output);
	return 0;
}
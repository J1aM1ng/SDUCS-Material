#include <stdio.h>
#include <ctype.h>
int main()
{
	char a, b;
	int c;
	c = a = getchar();
	printf("%x\n", c);
	b = toupper(a);
	printf("%c\n", b);
	b = tolower(a);
	printf("%c\n", b);
	return 0;
}
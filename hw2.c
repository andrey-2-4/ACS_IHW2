#include "stdio.h"
#include "stdlib.h"
#include "string.h"

#define N 1002
char str[N];
char substr[N];
int indexes[N];

void finder() {
	int lenstr = strlen(str);
	int lensubstr = strlen(substr);
	char ok;
	for (int i = 0; i <= lenstr - lensubstr; ++i) {
		indexes[i] = -1;
		ok = 't';
		for (int j = 0; j < lensubstr - 1; ++j) {
			if (str[i + j] != substr[j]) {
				ok = 'f';
				break;
			}
		}
		if (ok == 't') {
			indexes[i] = i;
		}
	}
}

int main() {
	printf("Введите строку: ");
	fgets(str, N, stdin);
	printf("Введите подстроку: ");
	fgets(substr, N, stdin);
	
	int lenstr = strlen(str);
	int lensubstr = strlen(substr);
	
	printf("Индексы: ");
	
	if (lensubstr > lenstr) {
		printf("\n");
		return 0;
	}
	
	finder();
	
	for (int i = 0; i <= lenstr - lensubstr; ++i) {
		if (indexes[i] != -1) {
			printf("%d", indexes[i]);
			printf(" ");
		}
	}
	printf("\n");
	return 0;
}

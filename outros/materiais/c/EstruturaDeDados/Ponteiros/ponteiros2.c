#include <stdio.h>
#include <malloc.h>

int main(){
	int* y = (int*) malloc(sizeof(int)); //aloca um espa�o de mem�ria equivalente a um inteiro para o ponteiro de inteiros x
	*y = 20; //Atribui o n�mero 20 a este espa�o de mem�ria alocado
	int a = sizeof(int); //Atribui a vari�vel inteira z o tamamnho de um espa�o de mem�ria de um inteiro
	int b = sizeof(float); //Atribui a vari�vel inteira z o tamamnho de um espa�o de mem�ria de um float
	int c = sizeof(double); //Atribui a vari�vel inteira z o tamamnho de um espa�o de mem�ria de um double
	printf("No espaco de memoria alocado e apontado por y esta o valor *y = %d, O tamanho de um int = %d, float = %d, double = %d \n", *y, a, b, c);
	return 0;
}

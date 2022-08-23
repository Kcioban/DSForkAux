#include <stdio.h>

int main(){

	int x; //Vari�vel do tipo inteira normal "x" para receber valores e ser apontada pelo ponteiro
	int* y; //Vari�vel do tipo ponteiro de inteiro "y"
	
	x = 25; printf("A variavel x possui o valor: %d armazenado na memoria em %d \n", x, &x);
	y = &x; printf("O ponteiro y agora aponta para x %d \n", y);
	*y = 60; printf("Agora a variavel x possui o valor: %d \n", x);
	y = &y;	printf("O ponteiro y agora aponta para %d endereco dela mesma \n", y);
	*y = 30; printf("A variavel y agora possui o valor %d na posicao %d e x continua valendo %d\n", y, &y, x);
	return 0;
}

/*
int main(){
	
	int x, y; //vari�veis para testar
	
	printf("Digite um numero: ");
	scanf("%d", &x); //Fun��o scanf l� dados digitados a partir do teclado e amrazena na vari�vel cujo ponteiro � informado
	atribuii(354, &y); //A fun��o atribui o valor 354 para a posi��o da mem�ria em y da mesma forma que scanf
	printf("\nO valor lido foi (%d) e esta na seguinte posicao %d da memoria \nO valor atribuido pela funcao foi (%d) e esta na posicao %d da memoria\n", x, &x, y, &y);
	return 0;
}

//Funcao que atribui um valor para um ponteiro
void atribuii(int n, int* i){
	*i = n;
}
*/

#include<stdio.h>
#include<locale.h>
#include<time.h>
int main(){
	setlocale(LC_ALL,"");
	srand(time(NULL));
	int v[50];
	int i, num, onde = -1;
	//Gerar os n�meros aleat�rios para o vetor
	for(i = 0; i < 50; i++){
		v[i] = rand() % 100;
		printf("[%d]%d\n",i,v[i]);
	}
	//Entrada
	printf("Digite um n�mero inteiro\n");
	scanf("%d",&num);
	//Processamento
	for(i = 0; i < 50; i++){
		if(v[i] == num){
			onde = i;
			break;
		}
	}
	//Sa�da
	if(onde != -1) printf("Encontrei na posi��o %d", onde);
	else printf("N�o encontrei");
}

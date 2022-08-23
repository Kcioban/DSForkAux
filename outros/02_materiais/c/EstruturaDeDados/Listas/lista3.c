/* LISTA LINEAR LIGADA E ORDENADA
Cada ELEMENTO � precedido por um e Sucedido por outro.
Exceto o PRIMEIRO e o �LTIMO, por�m agora cada um possui um �ndice que aponta para o seu sucessor
*/

#include <stdio.h>
#include <stdbool.h>

/* MODELAGEM */

#ifndef _Lista_h //Se as defini��es em Lista h n�o existem define abaixo
#define MAX 50 //Tamanho m�ximo do arranjo Definido
#define INVALIDO -1 //Constante para valores inv�lidos

typedef int TipoChave; //Outro nome para o tipo de dados int OBS: O int continua funcionando

typedef struct{
	TipoChave chave; //Campo Chave para o controle da Lista
	char nome[MAX+1]; //Nome de uma pessoa - +1 para criar um elemento SENTINELA para busca
	int idade; //Idade, somente de exemplo com inteiro ao inv�s de dataNascimento
} Registro; //Dados a serem estruturados na Lista (Tema: idade e nome)

typedef struct{
	Registro reg;
	int prox; //Armazena o endere�o do pr�ximo elemento
}Elemento; //Estrutura intermedi�ria de elementos

typedef struct{
	Elemento A[MAX]; //Vetor que armazenar� os Registros
	int inicio;
	int dispo;  //Indice do primeiro elemento dispon�vel
}Lista; //Arranjo dos Elementos
#endif

/* FUN��ES/M�TODOS */

void iniciarLista(Lista* list);
int comprimentoLista(Lista* list);
void exibirLista(Lista* list);
int buscaSequencialOrdenada(Lista* list, TipoChave ch);
int obterNo(Lista* list); //Fun��o Auxiliar para Inser��o Ordenada
bool inserirElemListaOrd(Lista* list, Registro reg);
void devolverNo(Lista* list, int i); //Fun��o Auxiliar para Exclus�o
bool excluirElemLista(Lista* list, TipoChave ch);

/* IMPLEMENTA��O DAS FUN��ES/M�TODOS */
void iniciarLista(Lista* list){//Ponteiro da lista
	int i; //Contador
	for(i = 0; i < MAX - 1; i++) list->A[i].prox = i + 1; //Percorre toda a lista apontando para o proximo elemento
	list->A[MAX - 1].prox = INVALIDO; //Pr� elemento definido como inv�lido
	list->inicio = INVALIDO; //Elemento inicial definido como inv�lido
	list->dispo = 0; //Primeiro elemento dispon�vel iniciada em 0
}//Inicializar a estrutura

int comprimentoLista(Lista* list){//O ponteiro de uma Lista
	int i = list->inicio; //Contador para o la�o iniciado
	int comprimento = 0; //Contador de elementos
	while(i != INVALIDO){
		comprimento++;
		i = list->A[i].prox;
	}//Percorre um por um os elementos da lista Ligada
	return comprimento;
}//Retornar a quantidade de elementos v�lidos

void exibirLista(Lista* list){//O ponteiro de uma Lista
	int i = list->inicio; //Contador para o la�o iniciado
	printf("\n\n\n");
	printf("Chave, Nome, Idade\n");
	while(i != INVALIDO){
		printf("%d, %s, %d\n", list->A[i].reg.chave, list->A[i].reg.nome, list->A[i].reg.idade);
		i = list->A[i].prox;
	}//Percorre um por um os elementos da lista Ligada
	printf("\n\n\n");
}//Exibe a lista com todos os elementos v�lidos

int buscaSequencialOrdenada(Lista* list, TipoChave ch){
	int i = list->inicio;
	while(i != INVALIDO && list->A[i].reg.chave < ch)//Enquanto i n�o for inv�lido e for menor que a chave
		i = list->A[i].prox; //Recebe o proximo
	if(i != INVALIDO && list->A[i].reg.chave == ch)//Se i n�o for inv�lido e for menor que a chave
		return i; //Retorna o indice encontrado
	else return INVALIDO;
}//Tamb�m s� funciona se a lista estiver ordenada

int obterNo(Lista* list){
	int resultado = list->dispo; //Guarda a posi��o do primeiro elemento DISPON�VEL
	if(list->dispo != INVALIDO)
		list->dispo = list->A[list->dispo].prox; //O primeiro dispon�vel ser� o pr�ximo disponivel
	return resultado;
}//Fun��o Auxiliar para Inser��o Ordenada - retorna o pr�ximo dispon�vel

bool inserirElemListaOrd(Lista* list, Registro reg){
	if(list->dispo == INVALIDO) return false;
	//Encontrar o registro anterior e o posterior
	int ant = INVALIDO; //Anterioe
	int i = list->inicio; //Posterior
	TipoChave ch = reg.chave;
	while((i != INVALIDO) && (list->A[i].reg.chave < ch)){//Enquanto i n�o for inv�lido e for menor que a chave
		ant = i;
		i = list->A[i].prox;
	}//Este la�o nos tr�s o anterior e o atual
	if((i != INVALIDO) && (list->A[i].reg.chave == ch)) return false; //Se i for v�lido por�m o elemento j� existe ent�o retorna FALSO
	i = obterNo(list); //Obter o pr�ximo dispon�vel
	list->A[i].reg = reg; //Insere o Elemento na Lista
	if(ant == INVALIDO){//Verifica se n�o tem anterior � porque ele � o PRIMEIRO
		list->A[i].prox = list->inicio; //Ent�o o pr�ximo � o primeiro
		list->inicio = i; //O in�cio aponta para este elemento
	}else{ //Sen�o ele tem um anterior
		list->A[i].prox = list->A[ant].prox; //Ent�o ele aponta para o pr�ximo do anterior
		list->A[ant].prox = i; //O anterior dele aponta para ele	
	}
	return true;
}//Insere elementos na lista ligada ordenada

void devolverNo(Lista* list, int i){
	list->A[i].prox = list->dispo;
	list->dispo = i;
}//Fun��o auxiliar para Exclus�o

bool excluirElemLista(Lista* list, TipoChave ch){
	int ant = INVALIDO; //Anterioe
	int i = list->inicio; //Posterior
	while((i != INVALIDO) && (list->A[i].reg.chave < ch)){//Enquanto i n�o for inv�lido e for menor que a chave
		ant = i;
		i = list->A[i].prox;
	}//Este la�o nos tr�s o anterior e o atual
	if((i != INVALIDO) && (list->A[i].reg.chave != ch)) return false;
	if(ant == INVALIDO) list->inicio = list->A[i].prox;
	else list->A[ant].prox = list->A[i].prox;
	devolverNo(list, i);
	return true;
}//Exclui elementos na lista ligada ordenada


/*M�TODO PRINCIPAL PRINCIPAL - EXECUTANDO OS TESTES DAS FUN��ES DA Lista*/
int main(){
	int opcao = 0; //Vari�vel de op�ao do menu
	int chave, posicao; //Vari�vel para ler a chave e a posi��o na lista
	Registro nReg; //Vari�vel do tipo Registro para ser inserida na Lista
	Lista nLista; //Vari�vel do tipo Lista a ser manipulada
	iniciarLista(&nLista); //Inicia a Lista de pessoas
	do{
		printf("\n\n");
		printf("Escolha uma das opcoes abaixo:\n 0:SAIR 1:INSERIR 2:EXCLUIR 3:LISTAR 4:BUSCA_SEQ_ORDENADA 5:LIMPAR\n");
		printf("Escolha uma das opcoes do Menu:");scanf("%d", &opcao);
		printf("\n\n");
		switch(opcao){
			case 1:
				printf("Digite um inteiro para Chave: "); scanf("%d",&nReg.chave); //Le a posi��o do elemento na lista
				printf("Digite o nome: "); scanf("%s",&nReg.nome); //Le a partir do teclado o nome
				printf("Digite a Idade: "); scanf("%d",&nReg.idade); //Le a partir do teclado a idade
				if(inserirElemListaOrd(&nLista, nReg)) printf("Registro adicionado a Lista.\n"); //Insere o Registro na Lista
				else printf("Erro ao adicionar.\n"); //Sen�o, apresentou algum erro ao inserir
				break;
			case 2:
				printf("Digite a chave do registro a ser Excluido: "); scanf("%d",&chave); //Le a posi��o do elemento na lista
				if(excluirElemLista(&nLista, chave)) printf("Registro removido da Lista.\n"); //Remove o Registro da Lista
				else printf("Erro ao remover registro.\n"); //Sen�o, apresentou algum erro ao excluir
				break;
			case 3:
				exibirLista(&nLista);//Mostra a Lista a cada inscrito
				break;
			case 4:
				printf("A lista Possui %d registros\n",comprimentoLista(&nLista));
				printf("Digite a chave do registro a ser encontrada na Lista: "); scanf("%d",&chave); //Le a posi��o do elemento na lista
				posicao = buscaSequencialOrdenada(&nLista, chave);
				printf("A chave informada fica na posicao %d\n", posicao);
				if(posicao == -1) printf("Registro nao encontrado\n");
				else printf("\nChave: %d\nNome: %s\nIdade: %d\n", nLista.A[posicao].reg.chave, nLista.A[posicao].reg.nome, nLista.A[posicao].reg.idade);
				break;
			case 5:
				iniciarLista(&nLista); //Re-Inicia a Lista de pessoas
				break;
			default: break;
		}
		
	}while(opcao != 0); //Faz as leituras enquanto o usu�rio n�o digitar 0 para sair.
	return 0; //Retorna 0 para fim do programa
}



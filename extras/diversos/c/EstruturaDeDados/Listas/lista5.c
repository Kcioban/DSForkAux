/* LISTA LINEAR LIGADA ORDENADA POR UM N� CABE�A
Cada ELEMENTO � precedido por um e Sucedido por outro.
Agora cada um possui um �ndice que aponta para o seu sucessor
A lista encadeada comum, possui um in�cio e vai at� o �ltimo eleento que � o NULL
Esta possui um n� CABE�A que � o in�cio e o fim.

COM ALOCA��O DIN�MICA DE MEM�RIA

*/

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>


/* MODELAGEM */

#ifndef _lista_h //Se as defini��es em Lista h n�o existem define abaixo
#define _lista_h

typedef int TipoChave; //Outro nome para o tipo de dados int OBS: O int continua funcionando

typedef struct{
	TipoChave chave; //Campo Chave para o controle da Lista
	char nome[10]; //Nome de uma pessoa - +1 para criar um elemento SENTINELA para busca
	int idade; //Idade, somente de exemplo com inteiro ao inv�s de dataNascimento
} Registro; //Dados a serem estruturados na Lista (Tema: idade e nome)

typedef struct tempRegistro{//aux � um auxiliar para um ponteiro do pr�prio tipo
	Registro reg;
	struct tempRegistro* prox; //O ponteiro prox � do pr�prio tipo Elemento
}Elemento; //Estrutura intermedi�ria de elementos

typedef Elemento* Pont;

typedef struct{
	Pont cabeca;	
}Lista; //Arranjo dos Elementos
#endif

/* FUN��ES/M�TODOS */

void iniciarLista(Lista* list);
int comprimentoLista(Lista* list);
void exibirLista(Lista* list);
Pont buscaSentinela(Lista* list, TipoChave ch);
int buscaSequencial(Lista* list, TipoChave ch);
Pont buscaSequencialExc(Lista* list, TipoChave ch, Pont *anterior);
bool inserirElemListaOrd(Lista* list, Registro reg);
bool excluirElemLista(Lista* list, TipoChave ch);
void reiniciarLista(Lista* list);

/* IMPLEMENTA��O DAS FUN��ES/M�TODOS */
void iniciarLista(Lista* list){//Ponteiro da lista
	list->cabeca = (Pont) malloc(sizeof(Elemento)); //Aloca mem�ria para o n� cabe�a
	list->cabeca->prox = list->cabeca; //O pr�ximo do n� cabe�a � ele mesmo
}//Inicializar a estrutura

int comprimentoLista(Lista* list){//O ponteiro de uma Lista
	Pont endereco = list->cabeca->prox; //Endereco aponta para o n� Cabe�a
	int comprimento = 0; //Contador de elementos
	while(endereco != list->cabeca){
		comprimento++;
		endereco = endereco->prox;
	}//Percorre um por um os elementos da lista Ligada
	return comprimento;
}//Retornar a quantidade de elementos v�lidos

void exibirLista(Lista* list){//O ponteiro de uma Lista
	Pont endereco = list->cabeca->prox; //Endereco aponta para o in�cio
	printf("\n\n\n");
	printf("Chave, Nome, Idade\n");
	while(endereco != list->cabeca){
		printf("%d, %s, %d\n", endereco->reg.chave, endereco->reg.nome, endereco->reg.idade);
		endereco = endereco->prox;
	}//Percorre um por um os elementos da lista Ligada
	printf("\n\n\n");
}//Exibe a lista com todos os elementos v�lidos

Pont buscaSentinela(Lista* list, TipoChave ch){//Esta estrutura com n� CABE�A permite a busca SENTINELA
	Pont posicao = list->cabeca->prox; //Vari�vel do tipo ponteiro para percorrer a lista
	list->cabeca->reg.chave = ch;
	while(posicao->reg.chave != ch) posicao = posicao->prox;
	if(posicao != list->cabeca) return posicao;
	return NULL;
}//N�o precisa estar ordenada pelos valores das chaves

int buscaSequencial(Lista* list, TipoChave ch){//Esta busca retorna a posi��o num�rica na lista
	Pont posicao = list->cabeca->prox; //Vari�vel do tipo ponteiro para percorrer a lista
	int contador; //Contador que retornar� a posi��o
	while(posicao != list->cabeca){
		if(posicao->reg.chave == ch) return contador;
		posicao = posicao->prox;
		contador++;
	}
	return -1;
}

Pont buscaSequencialExc(Lista* list, TipoChave ch, Pont *anterior){//Ponteiro list, Campo CHAVE e Ponteiro que receber� o Anterior
	*anterior = list->cabeca;
	Pont atual = list->cabeca->prox; //Vari�vel do tipo Pont que retornar� a posi��o
	list->cabeca->reg.chave = ch;
	while(atual->reg.chave < ch){
		*anterior = atual;
		atual = atual->prox;
	}
	if(atual != list->cabeca && atual->reg.chave == ch) return atual;
	return NULL;
}//Busca Auxiliar (Dois retornos: atual e o anterior)

bool inserirElemListaOrd(Lista* list, Registro reg){
	Pont anterior, atual;
	atual = buscaSequencialExc(list, reg.chave, &anterior); //Utiliza a Busca Auxiliar
	if(atual != NULL) return false;
	atual = (Pont) malloc(sizeof(Elemento)); //Aloca epa�o na memporia para mais um registro
	atual->reg = reg; //Transfere os dados do par�metro registro para o espa�o alocado
	atual->prox = anterior->prox; //O pr�ximo do atual � o que era pr�ximo do anterior
	anterior->prox = atual; //O pr�ximo do anterior � o elemento atual
	return true;
}//Insere elementos na lista ordenada

bool excluirElemLista(Lista* list, TipoChave ch){
	Pont anterior, atual;
	atual = buscaSequencialExc(list, ch, &anterior); //Utiliza a Busca Auxiliar
	if(atual == NULL) return false;
	anterior->prox = atual->prox;
	free(atual); //Devolve a mem�ria que estava alocada
	return true;	
}//Exclui elementos da lista ordenada

void reiniciarLista(Lista* list){//Ponteiro da lista
	Pont fim = list->cabeca->prox;
	while(fim != list->cabeca){ //La�o para percorrer toda a lista devolvendo a mem�ria alocada
		Pont apagar = fim;
		fim = fim->prox;
		free(apagar); //Devolve a mem�ria alocada
	}
	list->cabeca->prox = list->cabeca; //Elemento inicial aponta para ele mesmo
}

/*M�TODO PRINCIPAL PRINCIPAL - EXECUTANDO OS TESTES DAS FUN��ES DA Lista*/
int main(){

	int opcao = 0; //Vari�vel de op�ao do menu
	int chave; //Vari�vel para ler a chave
	Pont posicao; //Vari�vel para receber a posicao na lista
	Registro nReg; //Vari�vel novo Registro a ser inserido na lista
	Lista nLista; //Vari�vel nova Lista
	iniciarLista(&nLista); //Inicia a Lista
	do{
		printf("\n\n");
		printf("Escolha uma das opcoes abaixo:\n 0:SAIR\n 1:INSERIR\n 2:EXCLUIR\n 3:LISTAR\n 4:BUSCA_POR CODIGO\n 5:LIMPAR_LISTA\n");
		printf("Escolha uma das opcoes do Menu:");scanf("%d", &opcao);
		printf("\n\n");
		switch(opcao){
			case 1:
				printf("Digite o Codigo: "); scanf("%d",&nReg.chave); //Le a partir do teclado a CHAVE
				printf("Digite o nome: "); scanf("%s",&nReg.nome); //Le a partir do teclado o nome
				printf("Digite a Idade: "); scanf("%d",&nReg.idade); //Le a partir do teclado a idade
				if(inserirElemListaOrd(&nLista, nReg)) printf("Registro adicionado a Lista.\n"); //Insere o Registro na Lista
				else printf("Erro ao adicionar.\n"); //Sen�o, apresentou algum erro ao inserir
				break;
			case 2:
				printf("Digite o codigo do registro a ser Excluido: "); scanf("%d",&chave); //Le a posi��o do elemento na lista
				if(excluirElemLista(&nLista, chave)) printf("Registro removido da Lista.\n"); //Remove o Registro da Lista
				else printf("Erro ao remover registro.\n"); //Sen�o, apresentou algum erro ao excluir
				break;
			case 3:
				exibirLista(&nLista);//Mostra a Lista a cada inscrito
				break;
			case 4:
				printf("A lista Possui %d registros\n",comprimentoLista(&nLista));
				printf("Digite o codigo do registro a ser encontrado na Lista: "); scanf("%d",&chave); //Le a posi��o do elemento na lista
				posicao = buscaSentinela(&nLista, chave);
				if(posicao == NULL) printf("Registro nao encontrado\n");
				else{
					printf("O registro informado fica na posicao %d\n", buscaSequencial(&nLista, chave) + 1);
					printf("\nChave: %d\nNome: %s\nIdade: %d\n", posicao->reg.chave, posicao->reg.nome, posicao->reg.idade);
				}
				break;
			case 5:
				iniciarLista(&nLista); //Re-Inicia a Lista de pessoas
				printf("LISTA ESVAZIADA COM SUCESSO");
				break;
			default: break;
		}
		
	}while(opcao != 0); //Faz as leituras enquanto o usu�rio n�o digitar 0 para sair.
	return 0; //Retorna 0 para fim do programa
}



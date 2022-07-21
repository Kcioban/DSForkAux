//PROGRAMA EXEMPLO QUE CALCULA M�DIA DE DIVERSOS VALORES UTILIZANDO ALOCA��O DIN�MINCA DE MEM�RIA
#include <stdio.h>
#include <stdlib.h>

int *aloca(int num)
{
 int count,
  *numbers;
 
 numbers = (int *)malloc(num*sizeof(int));
 
 for(count=0 ; count < num ; count++)
 {
  printf("Numero [%d]: ", count+1);
  scanf("%d", &numbers[count]);
 }
 
 return numbers;
}

float media(int *numbers, int num)
{
 float media=0.0;
 int count;
 
 for(count=0 ; count<num ; count++)
  media += numbers[count];
 
 return media/num;
}

void exibe(int *numbers, int num)
{
 int count;
 
 for(count=0 ; count < num ; count++)
  printf("%3d", numbers[count]);
}

int main(void)
{
 int num=1,
  *numeros;
 
 while(num)
 {
  printf("Media de quantos numeros [0 para sair]: ");
  scanf("%d", &num);
  
  if(num > 0)
  {
   numeros = aloca(num);
   exibe(numeros,num);
   printf("\nA media destes numeros eh: %.2f\n", media(numeros, num) );
   free(numeros);
  }
 }

 return 0;
}


/*Exemplos de c�digos de ALOCA��O DIN�MICA DE MEM�RIA 


//Exemplo de aloca��o de mem�ria b�sico para uma string

#include <stdio.h>
#include <stdlib.h>

int main(void)
{
    char *nome = (char *) malloc(21*sizeof(char));
 
    printf("Digite seu nome: ");
    gets(nome);
 
    printf("%s\n", nome);
 
    return 0;
}

//Exemplo de aloca��o e devolu��o Infinita de mem�ria

#include <stdio.h>
#include <stdlib.h>

void aloca()
{
 int *ptr;
 ptr = (int *) malloc(100);
 
 free(ptr); //Retire esta linha de comando e ao executar este programa seu computador ir� travar
}

int main(void)
{
 while(1)
  aloca();

 return 0;
}

Vamos criar um programa simples, que ir� pedir uma senha e armazenar num local que foi previamente alocado.
Ent�o voc� usa essa senha como quiser, e como � um bom programador, ir� usar a free() para liberar a mem�ria que foi usada, at� mesmo por quest�es de seguran�a.

Por�m, ao contr�rio do que muitos pensam (e a� que mora o perigo), ao liberar a mem�ria voc� n�o vai apagar os dados existentes nela, voc� vai apenas dizer ao seu computador "Hey, esse bloco de bytes aqui, j� usei, ent�o voc� pode pegar para fazer outra coisa".

Mas as informa��es ainda est�o l�. E como obter o que tem l�?
Atrav�s do ponteiro que ainda aponta para l�. Ou seja, a free() n�o vai mudar o endere�o armazenado no ponteiro, ele ainda vai continuar apontando para sua senha mesmo ap�s aquele bloco de mem�ria ter sido liberado.

Veja o c�digo do programa:

#include <stdio.h>
#include <stdlib.h>


int main(void)
{
 char *senha;
 
 senha = (char *) malloc(21*sizeof(char));
 printf("Digite sua senha [ate 20 caracteres]: ");
 scanf("%[^\n]s", senha);
 
 printf("Senha: %s\n", senha);
 printf("Endere�o antes da free(): %d\n", &senha);
 
 free(senha);
 
 printf("Endere�o depois da free(): %d\n", &senha);

 return 0;
}

Ou seja, o ponteiro maroto continua apontando pro local da mem�ria que est� minha senha, e algu�m poder� usar de uma maneira bem mal�fica caso eu n�o tenha gravado outra coisa por cima desse bloco de mem�ria. Como nos proteger, ent�o?

Uma boa pr�tica de seguran�a � que sempre que for 'liberar' seus ponteiros, fazer eles apontarem para NULL.
Ou seja, fa�a:
ptr=NULL;

Sempre que usar a free(), pois embora tenha liberado a mem�ria para outro uso, o ponteiro continuar� apontando para aquele endere�o de mem�ria.
Assim, o ponteiro n�o vai mais te dedurar.

*/

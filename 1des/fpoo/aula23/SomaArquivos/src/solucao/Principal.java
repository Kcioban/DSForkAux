package solucao;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Scanner;

public class Principal {

	// Espa�o de mem�ria din�mico
	static BufferedReader br;
	// Endere�p do aquivo de entrada
	static String entrada = "C:\\Users\\Aluno.DSN5131112167\\Desktop\\work_arquivos\\SomaArquivos\\arquivos\\entrada.csv";
	static Scanner scan = new Scanner(System.in);

	public static void main(String[] args) {
		// Menu
		int opcao = 0;
		while (opcao != 5) {
			System.out.println("\n1. Adi��o\n2. Multiplica��o\n3. Subtra��o\n4. Divis�o\n5. Sair");
			opcao = scan.nextInt();

			// Abrir o arquivo tratando os poss�veis erros
			try {
				// Abre o arquivo
				br = new BufferedReader(new FileReader(entrada));
				String linha = br.readLine();// L� a primeira linha
				while (linha != null) {
					String[] vetor = linha.split(";");
					int v1 = Integer.parseInt(vetor[0]);
					int v2 = Integer.parseInt(vetor[1]);
					int result = 0;
					if (opcao == 1) {
						result = v1 + v2;
					} else if (opcao == 2) {
						result = v1 * v2;
					} else if (opcao == 3) {
						result = v1 - v2;
					} else {
						result = v1 / v2;
					}
					System.out.println(result);
					linha = br.readLine();// L� a pr�xima linha
				}
				// Fecha o arquivo
				br.close();
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		System.out.println("Adeus.");
	}

}

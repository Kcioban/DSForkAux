package visao;

import java.util.Scanner;

import modelo.Veiculo;

public class menu {

	// Atributos
	private static Scanner scan = new Scanner(System.in);
	private static Veiculo veiculos[] = new Veiculo[10];
	private static String itens[] = { "Cadastrar ve�culo", "Listar Ve�culo", "Sair." };
	private static int menu = 0;
	private static int indice = 0;

	// M�todo Main
	public static void main(String[] args) {
		while (menu != 3) {
			menu = printMenu(itens);
			switch (menu) {
			case 1:
				cadastrarVeiculo();
				break;
			case 2:
				listarVeiculos();
				break;
			case 3:
				System.out.println("Valews, falows");
				break;
			default:
				System.out.println("Op��o inv�lida");
				break;
			}
		}
	}

	private static int printMenu(String[] itens) {
		for (int i = 0; i < itens.length; i++)
			System.out.println((i + 1) + "." + itens[i]);
		System.out.print("Escolha uma op��o:");
		return scan.nextInt();
	}

	private static void cadastrarVeiculo() {
		System.out.println("Placa\tMarca\tModelo\tAno Modelo\tAno Fabrica��o\tCor:");
		veiculos[indice] = new Veiculo(scan.next(), scan.next(), scan.next(), scan.nextInt(), scan.nextInt(),
				scan.next());
		indice++;
	}

	private static void listarVeiculos() {
		for (int i = 0; i < indice; i++) {
			System.out.println(veiculos[i].toString());
		}
	}
}

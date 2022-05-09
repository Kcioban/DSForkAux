package domains;

import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JPanel;

import clients.PetForm;
import controllers.PetProcess;

public class PetMenu extends JFrame implements ActionListener {

	private static final long serialVersionUID = 1L;
	private JPanel painel;
	private JMenuBar barraMenu = new JMenuBar();
	private JMenu menuArquivo, menuSistema;
	private JMenuItem itemPets, itemServicos, itemUsuarios, itemDashBoard, itemSair;
	private String imgIco = "./assets/icone.png";
	private String pathFundo = "./assets/fundo.png";
	private ImageIcon fundo;
	private JLabel lbFundo = new JLabel();

	PetMenu(){
		// COnfigura��es do Form principal
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		setTitle("PetShop - Sistema de Servi�os");
		setBounds(200, 100, 700, 500);
		setIconImage(new ImageIcon(imgIco).getImage());
		painel = new JPanel();
		painel.setBackground(new Color(255, 233, 213));
		setJMenuBar(barraMenu);
		setContentPane(painel);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		setLayout(null);
		
		//Imagem de fundo
		fundo = new ImageIcon(new ImageIcon(pathFundo).getImage().getScaledInstance(650,405, 100));
		lbFundo.setIcon(fundo);
		lbFundo.setBounds(20,15,650,405);
		painel.add(lbFundo);
		
		// Barra de Men�s
		menuArquivo = new JMenu("Arquivo");
		menuSistema = new JMenu("Sistema");
		barraMenu.add(menuArquivo);
		barraMenu.add(menuSistema);
		itemPets = new JMenuItem("Gest�o de Pets");
		itemServicos = new JMenuItem("Gest�o de Servi�os");
		itemDashBoard = new JMenuItem("Analizar DashBoard");
		itemUsuarios = new JMenuItem("Gest�o de Usu�rios");
		itemSair = new JMenuItem("Sair do Sistema");
		menuArquivo.add(itemPets);
		menuArquivo.add(itemServicos);
		menuArquivo.add(itemDashBoard);
		menuSistema.add(itemUsuarios);
		menuSistema.add(itemSair);
		barraMenu.setBackground(new Color(255, 233, 213));
		
		// A��es do Men�
		itemPets.addActionListener(this);
		itemServicos.addActionListener(this);
		itemDashBoard.addActionListener(this);
		itemUsuarios.addActionListener(this);
		itemSair.addActionListener(this);	
	}
	
	@Override
	public void actionPerformed(ActionEvent e) {
		if(e.getSource() == itemPets) {
			PetForm pf = new PetForm();
			pf.setVisible(true);
		}
		if(e.getSource() == itemSair) {
			this.dispose();
		}
	}
	
	public static void main(String[] args) {
		PetProcess.abrir();
		new PetMenu().setVisible(true);
	}



}

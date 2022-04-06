-- Banco de dados Pizzaria, Baseado no exemplo do livro Princípios de banco de dados com MySQL 5.7
-- Editora SENAI - 2019
-- Comandos DDL para criar a estrutura do banco de dados
drop database Pizzaria;
create database Pizzaria;
use Pizzaria;

create table Cliente(
	cliente_id integer primary key auto_increment,
	nome varchar(30) not null,
	logradouro varchar(30) not null,
	numero decimal(5,0),
	complemento varchar(30),
	bairro varchar(30),
	referencia varchar(30)
);

create table Pizza(
	pizza_id integer primary key auto_increment,
	nome varchar(30) not null,
	descricao varchar(100) not null,
	valor decimal(5,2) not null
);

create table Telefone(
	cliente_id integer not null,
	telefone varchar(15) not null,
	constraint fkTelCli foreign key (cliente_id) references Cliente(cliente_id)
	on delete cascade
);

create table Pedido(
	pedido_id integer primary key auto_increment,
	cliente_id integer not null,
	data date not null,
	hora time not null,
	valor decimal(5,2),
	constraint fkPedidoCli foreign key (cliente_id) references Cliente(cliente_id)
);

create table Item_Pedido(
	pedido_id integer,
	pizza_id integer not null,
	quantidade integer not null,
	valor decimal(5,2) not null,
	constraint fkItemPedido foreign key (pedido_id) references Pedido(pedido_id)
	on delete cascade,
	constraint fkItemLista foreign key (pizza_id) references Pizza(pizza_id)
);
-- Comandos DML para alimentar o banco de dados com registros
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Adelcio Biazi","Rua Wellington Martins",1204,"Fundos","Dom Bosco","Igreja");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Adriano da Silva Ferreira","Rua Walter Paulo Costenaro",1206,"","Bela Vista","Farmácia");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Alisson Linhares de Carvalho","Rua Viviane Mello Bonadia dos Santos",1208,"","Zambom","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Amanda Cristina davi Resende","Rua Thamires de Campos Luz",1210,"","Santa Cruz","Escola");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Ana Cláudia de Moura Laurentino","Rua Taynara Cerigueli Dutra",1212,"","Dom Bosco","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Ana Claudia Maciel","Rua Suéllen Rodolfo Martinelli",1214,"Frente","Dom Bosco","Campinho");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Argemiro Pentian Junior","Rua Silvia Roberta de Jesus Garcia",1216,"","Dom Bosco","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Bento Rafael Siqueira","Rua Sergio Willians Poneli",1218,"","Dom Bosco","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Bernardo Moreira Zabadal","Rua Sara Luzia de Melo",1220,"","Dom Bosco","Suermercado");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Carlos Roberto de Oliveira Cazelatto Junior","Rua Raphael Hungaro Moretti",1222,"","Dom Bosco","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Carlos Roberto Do Nascimento Costa","Rua Ramon Simões Abílio",1224,"","Dom Bosco","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Cesar Augusto Pascali Rago","Rua Rafaela de Jesus Alencar",1226,"","Dom Bosco","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Claudemir de Souza Freitas Junior","Rua Rafael Tomé de Souza",507,"","Dom Bosco","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Claudiane Mendes Trigueiro Silva","Rua Paula Leticia Santos Lima",601,"","Dom Bosco","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Claudiney Ramos Tinoco","Rua Patrícia Fernanda da Silva Freitas",695,"Fundos","Dom Bosco","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Danilo César Pereira","Rua Ovídio José Francisco",789,"","Dom Bosco","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Darvin Ames","Rua Murilo Gleyson Gazzola",883,"","Dom Bosco","Igreja");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Debora Barbosa Aires","Rua Marcelo José Vigorito Campara",977,"","Dom Bosco","Farmácia");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Deivison Shindi Takatu","Rua Marcelo Do Carmo Vieira Scomparim",1071,"Fundos","Zambom","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Denis Henrique Caixeta","Rua Luciano Rovanni Do Nascimento",1165,"Fundos","Zambom","Escola");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Deysiane Matos Sande","Rua Luciano Rossi",1259,"","Zambom","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Diego Rafael Moraes","Rua Lucas Hermann Negri",1353,"","Zambom","Campinho");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Diogo Matos da Silva","Rua Liliam Sayuri Sakamoto",1447,"Segundo andar","Zambom","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Diogo Paulino da Cruz dos Santos","Rua Juliana de Sousa Ribeiro",1541,"","Zambom","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Douglas Brito damalio","Rua Josiane Rosa de Oliveira Gaia Pimenta",1635,"","Zambom","Suermercado");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Draylson Micael de Souza","Rua José Santiago Moreira de Mello",205,"","Zambom","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Eder Almeida Batista de Oliveira","Rua José Renato Paviotti",206,"","Zambom","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Ederlon Barbosa Cruz","Rua José Rafael Pilan",207,"","Zambom","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Edinei Peres Legaspe","Rua José Eugênio de Mira",208,"Fundos","Zambom","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Ednei Jose de Almeida Junior","Rua Jessé Italo Silva",209,"","Zambom","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Eduardo de Paula Lima Nascimento","Rua Jefferson Carlos Pedroso",210,"","Zambom","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Eduardo Henrique Spies","Rua Jefferson Barbosa Belo da Silva",2293,"","Zambom","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Elaine Cecília Gatto","Rua Jeane Aparecida Menegueli",2387,"","Santa Cruz","Igreja");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Elias Adriano Nogueira da Silva","Rua Ingrid Marçal",2481,"","Santa Cruz","Farmácia");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Elis Cristina Montoro Hernandes Ervolino","Rua Icaro Cavalcante Dourado",2575,"","Santa Cruz","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Erica Aparecida Martins Siqueira","Rua Higor Antonio delsoto",2669,"","Santa Cruz","Escola");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Erika Arias Barrado","Rua Hiago Araujo Silva",2763,"","Santa Cruz","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Esteic Janaina Santos Batista","Rua Helder Pestana",2857,"","Santa Cruz","Campinho");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Everaldo Costa Silva Neto","Rua Gustavo Moreira Calixto",2951,"","Santa Cruz","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Everaldo Silva de Freitas","Rua Giovanna Nascimento Antonieti",3045,"","Santa Cruz","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Ewerton José da Silva","Rua Giovani Bertolla Sampaio",3139,"","Santa Cruz","Suermercado");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Fabio Luiz de Paula","Rua Gerson Luiz Camillo",3233,"","Santa Cruz","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Fabio Serafim","Rua Gabriel Spadon de Souza",3327,"","Santa Cruz","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Felipe Gobo Bruno","Rua Gabriel Sgorlon Tininis",3421,"","Bela Vista","Igreja");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Fernanda Zampieri Canaver","Rua Gabriel Morais Silveira",3515,"","Bela Vista","Farmácia");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Fernando Claudio dos Santos Junior","Rua Gabriel Ferreira Teles Gomes",201,"","Bela Vista","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Fernando Henrique Campos","Rua Francisco José Nardi Filho",202,"","Bela Vista","Escola");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Flávia Zenaro Nogueira E Silva","Rua Francisco Edigleison da Silva Barbosa",203,"","Bela Vista","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Floriano Ferreira dos Reis Filho","Rua Francisco Assis da Silva",204,"","Bela Vista","Campinho");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Frances Albert Santos","Rua Frances Albert Santos",205,"","Bela Vista","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Francisco Assis da Silva","Rua Floriano Ferreira dos Reis Filho",206,"","Bela Vista","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Francisco Edigleison da Silva Barbosa","Rua Flávia Zenaro Nogueira E Silva",207,"","Zambom","Suermercado");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Francisco José Nardi Filho","Rua Fernando Henrique Campos",208,"","Zambom","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Gabriel Ferreira Teles Gomes","Rua Fernando Claudio dos Santos Junior",209,"","Zambom","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Gabriel Morais Silveira","Rua Fernanda Zampieri Canaver",210,"","Zambom","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Gabriel Sgorlon Tininis","Rua Felipe Gobo Bruno",211,"","Zambom","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Gabriel Spadon de Souza","Rua Fabio Serafim",212,"","Zambom","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Gerson Luiz Camillo","Rua Fabio Luiz de Paula",213,"","Zambom","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Giovani Bertolla Sampaio","Rua Ewerton José da Silva",1917,"","Zambom","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Giovanna Nascimento Antonieti","Rua Everton Jose de Souza",2011,"","Santa Cruz","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Gustavo Moreira Calixto","Rua Everaldo Silva de Freitas",2105,"","Santa Cruz","Igreja");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Helder Pestana","Rua Everaldo Costa Silva Neto",2199,"","Santa Cruz","Farmácia");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Hiago Araujo Silva","Rua Esteic Janaina Santos Batista",2293,"","Santa Cruz","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Higor Antonio delsoto","Rua Erika Arias Barrado",2387,"","Santa Cruz","Escola");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Icaro Cavalcante Dourado","Rua Erica Aparecida Martins Siqueira",2481,"","Santa Cruz","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Ingrid Marçal","Rua Elis Cristina Montoro Hernandes Ervolino",2575,"","Santa Cruz","Campinho");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Jeane Aparecida Menegueli","Rua Elias Adriano Nogueira da Silva",222,"","Santa Cruz","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Jefferson Barbosa Belo da Silva","Rua Elaine Cecília Gatto",223,"","Santa Cruz","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Jefferson Carlos Pedroso","Rua Eduardo Henrique Spies",224,"","Santa Cruz","Suermercado");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Jessé Italo Silva","Rua Eduardo de Paula Lima Nascimento",225,"","Santa Cruz","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("José Eugênio de Mira","Rua Ednei Jose de Almeida Junior",226,"","Bela Vista","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("José Rafael Pilan","Rua Edinilson da Silva Vida",227,"","Bela Vista","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("José Renato Paviotti","Rua Edinei Peres Legaspe",228,"","Bela Vista","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("José Santiago Moreira de Mello","Rua Ederlon Barbosa Cruz",229,"","Bela Vista","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Josiane Rosa de Oliveira Gaia Pimenta","Rua Eder Almeida Batista de Oliveira",230,"","Bela Vista","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Juliana de Sousa Ribeiro","Rua Dyogo Porfirio Almeida Santos",231,"","Dom Bosco","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Liliam Sayuri Sakamoto","Rua Draylson Micael de Souza",232,"","Dom Bosco","Igreja");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Lucas Hermann Negri","Rua Douglas Brito damalio",233,"","Dom Bosco","Farmácia");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Luciano Rossi","Rua Diogo Paulino da Cruz dos Santos",234,"","Dom Bosco","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Luciano Rovanni Do Nascimento","Rua Diogo Matos da Silva",235,"","Dom Bosco","Escola");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Marcelo Do Carmo Vieira Scomparim","Rua Diego Rafael Moraes",236,"","Zambom","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Marcelo José Vigorito Campara","Rua Deysiane Matos Sande",237,"","Zambom","Campinho");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Murilo Gleyson Gazzola","Rua Denis Henrique Caixeta",238,"","Zambom","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Ovídio José Francisco","Rua Deivison Shindi Takatu",239,"","Dom Bosco","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Patrícia Fernanda da Silva Freitas","Rua Debora Barbosa Aires",240,"","Dom Bosco","Suermercado");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Paula Leticia Santos Lima","Rua Darvin Ames",241,"","Dom Bosco","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Rafael Tomé de Souza","Rua Danilo César Pereira",242,"","Dom Bosco","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Rafaela de Jesus Alencar","Rua Claudiney Ramos Tinoco",243,"","Dom Bosco","Igreja");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Ramon Simões Abílio","Rua Claudiane Mendes Trigueiro Silva",244,"","Dom Bosco","Farmácia");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Raphael Hungaro Moretti","Rua Claudemir de Souza Freitas Junior",245,"","Dom Bosco","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Sara Luzia de Melo","Rua Cesar Augusto Pascali Rago",246,"","Dom Bosco","Escola");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Sergio Willians Poneli","Rua Carlos Roberto Do Nascimento Costa",247,"","Dom Bosco","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Silvia Roberta de Jesus Garcia","Rua Carlos Roberto de Oliveira Cazelatto Junior",248,"","Dom Bosco","Campinho");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Suéllen Rodolfo Martinelli","Rua Carlos César Farias de Souza",249,"","Zambom","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Taynara Cerigueli Dutra","Rua Bernardo Moreira Zabadal",250,"","Zambom","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Thamires de Campos Luz","Rua Bento Rafael Siqueira",251,"","Zambom","Suermercado");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Viviane Mello Bonadia dos Santos","Rua Argemiro Pentian Junior",252,"","Zambom","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Walter Paulo Costenaro","Rua Anisio Alfredo da Silva Junior",253,"","Zambom","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Wellington Fabio de Oliveira Martins","Rua André Luyde da Silva Souza",254,"","Zambom","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("André Luyde da Silva Souza","Rua Ana Claudia Maciel",255,"","Zambom","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Anisio Alfredo da Silva Junior","Rua Ana Cláudia de Moura Laurentino",256,"","Zambom","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Carlos César Farias de Souza","Rua Amanda Cristina davi Resende",257,"","Zambom","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Dyogo Porfirio Almeida Santos","Rua Alisson Linhares de Carvalho",258,"","Zambom","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Edinilson da Silva Vida","Rua Adriano da Silva Ferreira",259,"","Zambom","");
insert into Cliente(nome, logradouro, numero, complemento, bairro, referencia) values("Everton Jose de Souza","Rua Adelcio Biazi",260,"","Zambom","");

insert into Telefone(cliente_id, telefone) values(1,"19993452345");
insert into Telefone(cliente_id, telefone) values(1,"19984212444");
insert into Telefone(cliente_id, telefone) values(2,"19932342344");
insert into Telefone(cliente_id, telefone) values(2,"19942342355");
insert into Telefone(cliente_id, telefone) values(3,"1934567832");
insert into Telefone(cliente_id, telefone) values(3,"1930022834");
insert into Telefone(cliente_id, telefone) values(4,"1934566453");
insert into Telefone(cliente_id, telefone) values(4,"1930023351");
insert into Telefone(cliente_id, telefone) values(5,"19943454553");
insert into Telefone(cliente_id, telefone) values(5,"1930026509");
insert into Telefone(cliente_id, telefone) values(6,"1923234255");
insert into Telefone(cliente_id, telefone) values(6,"1930022768");
insert into Telefone(cliente_id, telefone) values(7,"19839234299");
insert into Telefone(cliente_id, telefone) values(7,"1930030641");
insert into Telefone(cliente_id, telefone) values(8,"1930030376");
insert into Telefone(cliente_id, telefone) values(8,"1930022756");
insert into Telefone(cliente_id, telefone) values(9,"1930031839");
insert into Telefone(cliente_id, telefone) values(9,"1930027165");
insert into Telefone(cliente_id, telefone) values(9,"1930024182");
insert into Telefone(cliente_id, telefone) values(10,"1930030115");
insert into Telefone(cliente_id, telefone) values(10,"1930030796");
insert into Telefone(cliente_id, telefone) values(11,"1930031286");
insert into Telefone(cliente_id, telefone) values(11,"1930022424");
insert into Telefone(cliente_id, telefone) values(12,"1930031664");
insert into Telefone(cliente_id, telefone) values(12,"1930025914");
insert into Telefone(cliente_id, telefone) values(12,"1930029833");
insert into Telefone(cliente_id, telefone) values(12,"1930030615");
insert into Telefone(cliente_id, telefone) values(13,"1930027583");
insert into Telefone(cliente_id, telefone) values(13,"1930033176");
insert into Telefone(cliente_id, telefone) values(14,"1930029980");
insert into Telefone(cliente_id, telefone) values(14,"1930023520");
insert into Telefone(cliente_id, telefone) values(15,"1930022692");
insert into Telefone(cliente_id, telefone) values(15,"1930027585");
insert into Telefone(cliente_id, telefone) values(16,"1930033086");
insert into Telefone(cliente_id, telefone) values(16,"1930033196");
insert into Telefone(cliente_id, telefone) values(17,"1930032224");
insert into Telefone(cliente_id, telefone) values(17,"1930026622");
insert into Telefone(cliente_id, telefone) values(18,"1930029528");
insert into Telefone(cliente_id, telefone) values(18,"1930032868");
insert into Telefone(cliente_id, telefone) values(19,"1930025167");
insert into Telefone(cliente_id, telefone) values(19,"1930023385");
insert into Telefone(cliente_id, telefone) values(20,"1930025793");
insert into Telefone(cliente_id, telefone) values(20,"1930022535");
insert into Telefone(cliente_id, telefone) values(21,"1930022177");
insert into Telefone(cliente_id, telefone) values(21,"1930030492");
insert into Telefone(cliente_id, telefone) values(22,"1930023002");
insert into Telefone(cliente_id, telefone) values(22,"1930033540");
insert into Telefone(cliente_id, telefone) values(23,"1930028742");
insert into Telefone(cliente_id, telefone) values(23,"1930027031");
insert into Telefone(cliente_id, telefone) values(24,"1930022145");
insert into Telefone(cliente_id, telefone) values(24,"1930032426");
insert into Telefone(cliente_id, telefone) values(25,"1930031341");
insert into Telefone(cliente_id, telefone) values(25,"1930031459");
insert into Telefone(cliente_id, telefone) values(25,"1930025470");
insert into Telefone(cliente_id, telefone) values(26,"1930022475");
insert into Telefone(cliente_id, telefone) values(26,"1930031892");
insert into Telefone(cliente_id, telefone) values(26,"1930031125");
insert into Telefone(cliente_id, telefone) values(27,"1930029559");
insert into Telefone(cliente_id, telefone) values(27,"1930027198");
insert into Telefone(cliente_id, telefone) values(27,"1930025398");
insert into Telefone(cliente_id, telefone) values(28,"1930024870");
insert into Telefone(cliente_id, telefone) values(28,"1930022148");
insert into Telefone(cliente_id, telefone) values(28,"1930027067");
insert into Telefone(cliente_id, telefone) values(29,"1930031629");
insert into Telefone(cliente_id, telefone) values(29,"1930029346");
insert into Telefone(cliente_id, telefone) values(29,"1930032590");
insert into Telefone(cliente_id, telefone) values(30,"1930031739");
insert into Telefone(cliente_id, telefone) values(30,"1930025218");
insert into Telefone(cliente_id, telefone) values(30,"1930030691");
insert into Telefone(cliente_id, telefone) values(31,"1930023399");
insert into Telefone(cliente_id, telefone) values(31,"1930031587");
insert into Telefone(cliente_id, telefone) values(31,"1930027720");
insert into Telefone(cliente_id, telefone) values(32,"1930023167");
insert into Telefone(cliente_id, telefone) values(32,"1930030016");
insert into Telefone(cliente_id, telefone) values(32,"1930030076");
insert into Telefone(cliente_id, telefone) values(33,"1930032098");
insert into Telefone(cliente_id, telefone) values(33,"1930029615");
insert into Telefone(cliente_id, telefone) values(33,"1930025992");
insert into Telefone(cliente_id, telefone) values(34,"1930023841");
insert into Telefone(cliente_id, telefone) values(34,"1930029951");
insert into Telefone(cliente_id, telefone) values(34,"1930027261");
insert into Telefone(cliente_id, telefone) values(35,"1930023831");
insert into Telefone(cliente_id, telefone) values(35,"1930027732");
insert into Telefone(cliente_id, telefone) values(35,"1930028718");
insert into Telefone(cliente_id, telefone) values(36,"1930027345");
insert into Telefone(cliente_id, telefone) values(36,"1930029844");
insert into Telefone(cliente_id, telefone) values(36,"1930032451");
insert into Telefone(cliente_id, telefone) values(37,"1930022263");
insert into Telefone(cliente_id, telefone) values(37,"1930030446");
insert into Telefone(cliente_id, telefone) values(37,"1930024362");
insert into Telefone(cliente_id, telefone) values(38,"1930023400");
insert into Telefone(cliente_id, telefone) values(38,"1930023013");
insert into Telefone(cliente_id, telefone) values(38,"1930032090");
insert into Telefone(cliente_id, telefone) values(39,"1930031783");
insert into Telefone(cliente_id, telefone) values(39,"1930026009");
insert into Telefone(cliente_id, telefone) values(39,"1930023440");
insert into Telefone(cliente_id, telefone) values(40,"1930030951");
insert into Telefone(cliente_id, telefone) values(40,"1930030265");
insert into Telefone(cliente_id, telefone) values(40,"1930027160");
insert into Telefone(cliente_id, telefone) values(40,"1930031588");
insert into Telefone(cliente_id, telefone) values(40,"1930031532");
insert into Telefone(cliente_id, telefone) values(41,"1930026115");
insert into Telefone(cliente_id, telefone) values(41,"1930027073");
insert into Telefone(cliente_id, telefone) values(41,"1930027676");
insert into Telefone(cliente_id, telefone) values(42,"1930027725");
insert into Telefone(cliente_id, telefone) values(42,"1930029158");
insert into Telefone(cliente_id, telefone) values(42,"1930030541");
insert into Telefone(cliente_id, telefone) values(43,"1930033179");
insert into Telefone(cliente_id, telefone) values(43,"1930022927");
insert into Telefone(cliente_id, telefone) values(43,"1930022783");
insert into Telefone(cliente_id, telefone) values(44,"1930030621");
insert into Telefone(cliente_id, telefone) values(44,"1930025970");
insert into Telefone(cliente_id, telefone) values(44,"1930022592");
insert into Telefone(cliente_id, telefone) values(45,"1930025200");
insert into Telefone(cliente_id, telefone) values(45,"1930031980");
insert into Telefone(cliente_id, telefone) values(45,"1930022167");
insert into Telefone(cliente_id, telefone) values(46,"1930025803");
insert into Telefone(cliente_id, telefone) values(46,"1930031305");
insert into Telefone(cliente_id, telefone) values(46,"1930030584");
insert into Telefone(cliente_id, telefone) values(47,"1930025281");
insert into Telefone(cliente_id, telefone) values(47,"1930029896");
insert into Telefone(cliente_id, telefone) values(47,"1930033039");
insert into Telefone(cliente_id, telefone) values(48,"1930030804");
insert into Telefone(cliente_id, telefone) values(48,"1930030014");
insert into Telefone(cliente_id, telefone) values(48,"1930030042");
insert into Telefone(cliente_id, telefone) values(49,"1930033143");
insert into Telefone(cliente_id, telefone) values(49,"1930023803");
insert into Telefone(cliente_id, telefone) values(49,"1930028526");
insert into Telefone(cliente_id, telefone) values(50,"1930025254");
insert into Telefone(cliente_id, telefone) values(50,"1930023498");
insert into Telefone(cliente_id, telefone) values(50,"1930033557");
insert into Telefone(cliente_id, telefone) values(51,"1930026504");
insert into Telefone(cliente_id, telefone) values(51,"1930033397");
insert into Telefone(cliente_id, telefone) values(51,"1930023781");
insert into Telefone(cliente_id, telefone) values(52,"1930024260");
insert into Telefone(cliente_id, telefone) values(52,"1930029023");
insert into Telefone(cliente_id, telefone) values(52,"1930025432");
insert into Telefone(cliente_id, telefone) values(53,"1930029910");
insert into Telefone(cliente_id, telefone) values(53,"1930031207");
insert into Telefone(cliente_id, telefone) values(53,"1930027217");
insert into Telefone(cliente_id, telefone) values(54,"1930030606");
insert into Telefone(cliente_id, telefone) values(54,"1930026080");
insert into Telefone(cliente_id, telefone) values(54,"1930030827");
insert into Telefone(cliente_id, telefone) values(55,"1930027992");
insert into Telefone(cliente_id, telefone) values(55,"1930031715");
insert into Telefone(cliente_id, telefone) values(55,"1930029165");
insert into Telefone(cliente_id, telefone) values(56,"1930032888");
insert into Telefone(cliente_id, telefone) values(56,"1930023794");
insert into Telefone(cliente_id, telefone) values(56,"1930023163");
insert into Telefone(cliente_id, telefone) values(57,"1930033292");
insert into Telefone(cliente_id, telefone) values(57,"1930029582");
insert into Telefone(cliente_id, telefone) values(57,"1930027265");
insert into Telefone(cliente_id, telefone) values(58,"1930028115");
insert into Telefone(cliente_id, telefone) values(58,"1930022966");
insert into Telefone(cliente_id, telefone) values(58,"1930024299");
insert into Telefone(cliente_id, telefone) values(59,"1930025357");
insert into Telefone(cliente_id, telefone) values(59,"1930025619");
insert into Telefone(cliente_id, telefone) values(59,"1930028621");
insert into Telefone(cliente_id, telefone) values(60,"1930030980");
insert into Telefone(cliente_id, telefone) values(60,"1930033493");
insert into Telefone(cliente_id, telefone) values(60,"1930027537");
insert into Telefone(cliente_id, telefone) values(61,"1930032948");
insert into Telefone(cliente_id, telefone) values(61,"1930024675");
insert into Telefone(cliente_id, telefone) values(61,"1930030659");
insert into Telefone(cliente_id, telefone) values(62,"1930022495");
insert into Telefone(cliente_id, telefone) values(62,"1930033151");
insert into Telefone(cliente_id, telefone) values(62,"1930024627");
insert into Telefone(cliente_id, telefone) values(63,"1930032391");
insert into Telefone(cliente_id, telefone) values(63,"1930027831");
insert into Telefone(cliente_id, telefone) values(63,"1930029803");
insert into Telefone(cliente_id, telefone) values(64,"1930032594");
insert into Telefone(cliente_id, telefone) values(64,"1930028089");
insert into Telefone(cliente_id, telefone) values(64,"1930028909");
insert into Telefone(cliente_id, telefone) values(65,"1930022114");
insert into Telefone(cliente_id, telefone) values(65,"1930022824");
insert into Telefone(cliente_id, telefone) values(65,"1930032338");
insert into Telefone(cliente_id, telefone) values(66,"1930022353");
insert into Telefone(cliente_id, telefone) values(66,"1930031340");
insert into Telefone(cliente_id, telefone) values(66,"1930028258");
insert into Telefone(cliente_id, telefone) values(67,"1930031036");
insert into Telefone(cliente_id, telefone) values(67,"1930025274");
insert into Telefone(cliente_id, telefone) values(67,"1930023273");
insert into Telefone(cliente_id, telefone) values(68,"1930030921");
insert into Telefone(cliente_id, telefone) values(68,"1930027790");
insert into Telefone(cliente_id, telefone) values(68,"1930030727");
insert into Telefone(cliente_id, telefone) values(69,"1930022156");
insert into Telefone(cliente_id, telefone) values(69,"1930030296");
insert into Telefone(cliente_id, telefone) values(69,"1930023616");
insert into Telefone(cliente_id, telefone) values(70,"1930029318");
insert into Telefone(cliente_id, telefone) values(70,"1930025861");
insert into Telefone(cliente_id, telefone) values(70,"1930022318");
insert into Telefone(cliente_id, telefone) values(71,"1930031543");
insert into Telefone(cliente_id, telefone) values(71,"1930027053");
insert into Telefone(cliente_id, telefone) values(71,"1930029024");
insert into Telefone(cliente_id, telefone) values(72,"1930032892");
insert into Telefone(cliente_id, telefone) values(72,"1930028595");
insert into Telefone(cliente_id, telefone) values(72,"1930029775");
insert into Telefone(cliente_id, telefone) values(73,"1930033374");
insert into Telefone(cliente_id, telefone) values(73,"1930031704");
insert into Telefone(cliente_id, telefone) values(73,"1930025889");
insert into Telefone(cliente_id, telefone) values(74,"1930031385");
insert into Telefone(cliente_id, telefone) values(74,"1930028300");
insert into Telefone(cliente_id, telefone) values(75,"1930026091");
insert into Telefone(cliente_id, telefone) values(75,"1930029355");
insert into Telefone(cliente_id, telefone) values(76,"1930025087");
insert into Telefone(cliente_id, telefone) values(76,"1930026917");
insert into Telefone(cliente_id, telefone) values(77,"1930028831");
insert into Telefone(cliente_id, telefone) values(77,"1930023821");
insert into Telefone(cliente_id, telefone) values(78,"1930030021");
insert into Telefone(cliente_id, telefone) values(78,"1930027324");
insert into Telefone(cliente_id, telefone) values(79,"1930026076");
insert into Telefone(cliente_id, telefone) values(79,"1930033524");
insert into Telefone(cliente_id, telefone) values(80,"1930027232");
insert into Telefone(cliente_id, telefone) values(80,"1930025728");
insert into Telefone(cliente_id, telefone) values(81,"1930027461");
insert into Telefone(cliente_id, telefone) values(81,"1930024606");
insert into Telefone(cliente_id, telefone) values(82,"1930022991");
insert into Telefone(cliente_id, telefone) values(82,"1930025648");
insert into Telefone(cliente_id, telefone) values(83,"1930029675");
insert into Telefone(cliente_id, telefone) values(83,"1930032398");
insert into Telefone(cliente_id, telefone) values(84,"1930030326");
insert into Telefone(cliente_id, telefone) values(84,"1930030117");
insert into Telefone(cliente_id, telefone) values(85,"1930026338");
insert into Telefone(cliente_id, telefone) values(85,"1930026927");
insert into Telefone(cliente_id, telefone) values(86,"1930022281");
insert into Telefone(cliente_id, telefone) values(86,"1930022359");
insert into Telefone(cliente_id, telefone) values(87,"1930027774");
insert into Telefone(cliente_id, telefone) values(87,"1930029138");
insert into Telefone(cliente_id, telefone) values(88,"1930023218");
insert into Telefone(cliente_id, telefone) values(88,"1930024003");
insert into Telefone(cliente_id, telefone) values(89,"1930023323");
insert into Telefone(cliente_id, telefone) values(89,"1930029876");
insert into Telefone(cliente_id, telefone) values(90,"1930024962");
insert into Telefone(cliente_id, telefone) values(90,"1930032556");
insert into Telefone(cliente_id, telefone) values(91,"1930029315");
insert into Telefone(cliente_id, telefone) values(91,"1930029889");
insert into Telefone(cliente_id, telefone) values(91,"1930022120");
insert into Telefone(cliente_id, telefone) values(92,"1930032517");
insert into Telefone(cliente_id, telefone) values(92,"1930032298");
insert into Telefone(cliente_id, telefone) values(92,"1930027798");
insert into Telefone(cliente_id, telefone) values(93,"1930032091");
insert into Telefone(cliente_id, telefone) values(93,"1930023111");
insert into Telefone(cliente_id, telefone) values(93,"1930030646");
insert into Telefone(cliente_id, telefone) values(94,"1930025140");
insert into Telefone(cliente_id, telefone) values(94,"1930025035");
insert into Telefone(cliente_id, telefone) values(95,"1930022168");
insert into Telefone(cliente_id, telefone) values(95,"1930028731");
insert into Telefone(cliente_id, telefone) values(96,"1930022427");
insert into Telefone(cliente_id, telefone) values(96,"1930023230");
insert into Telefone(cliente_id, telefone) values(97,"1930027169");
insert into Telefone(cliente_id, telefone) values(97,"1930030528");
insert into Telefone(cliente_id, telefone) values(98,"1930030627");
insert into Telefone(cliente_id, telefone) values(98,"1930025580");
insert into Telefone(cliente_id, telefone) values(99,"1930033290");
insert into Telefone(cliente_id, telefone) values(99,"1930022106");
insert into Telefone(cliente_id, telefone) values(100,"1930025251");
insert into Telefone(cliente_id, telefone) values(100,"1930025721");
insert into Telefone(cliente_id, telefone) values(101,"1930030392");
insert into Telefone(cliente_id, telefone) values(101,"1930028227");
insert into Telefone(cliente_id, telefone) values(102,"1930030490");
insert into Telefone(cliente_id, telefone) values(102,"1930029085");
insert into Telefone(cliente_id, telefone) values(103,"19994556355");
insert into Telefone(cliente_id, telefone) values(103,"1930029049");
insert into Telefone(cliente_id, telefone) values(103,"1930031157");
insert into Telefone(cliente_id, telefone) values(104,"1930027393");
insert into Telefone(cliente_id, telefone) values(104,"1930028172");
insert into Telefone(cliente_id, telefone) values(104,"1930028796");
insert into Telefone(cliente_id, telefone) values(105,"1930032618");
insert into Telefone(cliente_id, telefone) values(105,"1930029060");
insert into Telefone(cliente_id, telefone) values(105,"1930032703");

insert into Pedido(cliente_id, data, hora) values(1,"2019/01/22","13:54:00");
insert into Pedido(cliente_id, data, hora) values(2,"2019/01/22","12:12:00");
insert into Pedido(cliente_id, data, hora) values(2,"2019/01/23","14:12:00");
insert into Pedido(cliente_id, data, hora) values(3,"2019/01/24","14:15:00");
insert into Pedido(cliente_id, data, hora) values(3,"2019/01/18","17:15:00");
insert into Pedido(cliente_id, data, hora) values(4,"2019/01/18","15:25:00");
insert into Pedido(cliente_id, data, hora) values(4,"2019/01/20","18:20:00");
insert into Pedido(cliente_id, data, hora) values(5,"2019/01/20","18:25:00");
insert into Pedido(cliente_id, data, hora) values(6,"2019/01/23","21:30:00");
insert into Pedido(cliente_id, data, hora) values(7,"2019/01/24","24:35:00");
insert into Pedido(cliente_id, data, hora) values(8,"2019/01/25","20:40:00");
insert into Pedido(cliente_id, data, hora) values(9,"2019/01/26","23:45:00");
insert into Pedido(cliente_id, data, hora) values(10,"2019/01/28","22:50:00");
insert into Pedido(cliente_id, data, hora) values(10,"2019/01/22","23:55:00");
insert into Pedido(cliente_id, data, hora) values(11,"2019/01/22","13:59:00");
insert into Pedido(cliente_id, data, hora) values(11,"2019/01/23","09:54:00");
insert into Pedido(cliente_id, data, hora) values(11,"2019/01/24","08:21:00");
insert into Pedido(cliente_id, data, hora) values(12,"2019/01/18","09:20:00");
insert into Pedido(cliente_id, data, hora) values(13,"2019/01/18","09:05:00");
insert into Pedido(cliente_id, data, hora) values(11,"2019/01/20","14:12:00");
insert into Pedido(cliente_id, data, hora) values(11,"2019/01/20","11:12:00");
insert into Pedido(cliente_id, data, hora) values(12,"2019/01/23","13:10:00");
insert into Pedido(cliente_id, data, hora) values(13,"2019/01/24","13:00:00");
insert into Pedido(cliente_id, data, hora) values(15,"2019/01/25","15:00:00");
insert into Pedido(cliente_id, data, hora) values(16,"2019/01/26","16:01:00");
insert into Pedido(cliente_id, data, hora) values(17,"2019/01/28","17:02:00");

insert into Pizza(nome, descricao, valor) values("À Moda da Casa","Molho de tomate fresco, mussarela especial, presunto cozido picado, ovos, cebola fatiada, cobertura de catupiry, orégano e azeitonas pretas",32.93);
insert into Pizza(nome, descricao, valor) values("Alho e Óleo","Molho de tomate fresco, alho crocante coberto com parmesão, orégano e azeitonas pretas",32.77);
insert into Pizza(nome, descricao, valor) values("Aliche","Molho especial de tomate fresco, filés de aliche importado, orégano e azeitonas pretas",32.61);
insert into Pizza(nome, descricao, valor) values("Ao Funghi","Molho de tomate fresco, mussarela especial, champignon fatiado, manjericão fresco, orégano e azeitonas pretas",32.45);
insert into Pizza(nome, descricao, valor) values("Atum","Molho de tomate fresco, atum especial sólido, cebola fatiada, orégano e azeitonas pretas",32.29);
insert into Pizza(nome, descricao, valor) values("Baiana","Molho de tomate fresco, calabresa moída levemente apimentada, ovos cozidos picados, cebola fatiada, orégano e azeitonas pretas",32.13);
insert into Pizza(nome, descricao, valor) values("Bauru","Molho de tomate fresco, presunto cozido picado, mussarela especial, rodelas de tomate, orégano e azeitonas pretas",31.97);
insert into Pizza(nome, descricao, valor) values("Caipira","Molho de tomate fresco, frango desfiado levemente temperado, cobertura de catupiry, milho verde, orégano e azeitonas pretas",31.81);
insert into Pizza(nome, descricao, valor) values("Calabresa","Molho de tomate fresco, calabresa especial fatiada, rodelas de cebola, orégano e azeitonas pretas",31.65);
insert into Pizza(nome, descricao, valor) values("Camponesa","Molho de tomate fresco, cobertura de catupiry, milho verde, orégano e azeitonas pretas",31.49);
insert into Pizza(nome, descricao, valor) values("Canadense","Molho de tomate fresco, lombo canadense fatiado, cobertura de catupiry, rodelas de cebola, orégano e azeitonas pretas",31.33);
insert into Pizza(nome, descricao, valor) values("Capri","Molho de tomate fresco, fatias de lombo canadense, mussarela especial, rodelas de tomate, manjericão fresco, orégano e azeitonas pretas",31.17);
insert into Pizza(nome, descricao, valor) values("Catupiry","Molho de tomate fresco, cobertura de catupiry, orégano e azeitonas pretas",31.01);
insert into Pizza(nome, descricao, valor) values("Cubana","Molho de tomate fresco, peito de frango desfiado levemente temperado, coberto com mussarela especial, polvilhado de parmesão, orégano e azeitonas pretas",30.85);
insert into Pizza(nome, descricao, valor) values("Escarola","Molho de tomate fresco, escarola refogada alho e óleo, filés de aliche importada, coberta com mussarela especial, orégano e azeitonas pretas",35.49);
insert into Pizza(nome, descricao, valor) values("Firense","Molho de tomate fresco, atum sólido especial, milho verde, coberto com catupiry, orégano e azeitonas pretas",35.33);
insert into Pizza(nome, descricao, valor) values("Frango","Molho de tomate fresco, peito de frango desfiado levemente temperado, coberto com catupiry, orégano e azeitonas pretas",35.17);
insert into Pizza(nome, descricao, valor) values("Gramute","Molho de tomate fresco, mussarela especial, presunto cozido picado, champignon fatiado, orégano e azeitonas pretas",35.01);
insert into Pizza(nome, descricao, valor) values("Gratinada","Molho de tomate fresco, cobertura de catupiry, camada de provolone , salpicada de parmesão, orégano e azeitonas pretas",34.85);
insert into Pizza(nome, descricao, valor) values("Grega","Molho de tomate fresco, palmito macio em rodelas, ervilhas, cobertura de mussarela especial, orégano e azeitonas pretas",34.69);
insert into Pizza(nome, descricao, valor) values("Imperial","Molho de tomate fresco, mussarela especial, atum sólido, champignon fatiado, orégano e azeitonas pretas",34.53);
insert into Pizza(nome, descricao, valor) values("Margherita","Molho de tomate fresco, mussarela especial, rodelas de tomate, salpicada de parmesão, manjericão fresco, orégano e azeitonas pretas",34.37);
insert into Pizza(nome, descricao, valor) values("Matriciana","Molho de tomate fresco, mussarela especial, champignon fatiado, cobertura de parmesão, orégano e azeitonas pretas",34.21);
insert into Pizza(nome, descricao, valor) values("Mexicana","Molho de tomate fresco, mussarela especial, presunto cozido picado, milho verde, orégano e azeitonas pretas",34.05);
insert into Pizza(nome, descricao, valor) values("Moda do Cliente","Molho de tomate fresco, livre escolha dos ingredientes ( máx.4 ), orégano e azeitonas pretas",33.89);
insert into Pizza(nome, descricao, valor) values("Mussarela","Molho de tomate fresco, cobertura de mussarela especial, orégano e azeitonas pretas",33.73);
insert into Pizza(nome, descricao, valor) values("Napolitalho","Molho de tomate fresco, mussarela especial, rodelas de tomate, queijo parmesão, alho crocante, orégano e azeitonas pretas",33.57);
insert into Pizza(nome, descricao, valor) values("Napolitana","Molho de tomate fresco, mussarela especial, rodelas de tomate, queijo parmesão, orégano e azeitonas pretas",33.41);
insert into Pizza(nome, descricao, valor) values("Oba Oba","Molho de tomate fresco, peito de frango desfiado levemente temperado, mussarela especial, bacon fatiado, orégano e azeitonas pretas",33.25);
insert into Pizza(nome, descricao, valor) values("Palmito","Molho de tomate fresco, palmito macio em rodelas, coberto com catupiry, orégano e azeitonas pretas",33.09);
insert into Pizza(nome, descricao, valor) values("Portuguesa","Molho de tomate fresco, presunto cozido, ovos picados, rodelas de cebola, cobertura de mussarela especial, orégano e azeitonas pretas",30.69);
insert into Pizza(nome, descricao, valor) values("Provolone","Molho de tomate fresco, coberto com queijo provolone, champignon fatiado, rodelas de tomate, orégano e azeitonas pretas",30.53);
insert into Pizza(nome, descricao, valor) values("Quatro Queijos","Molho de tomate fresco, mussarela especial, camada de catupiry, provolone, salpicado com gorgonzola, orégano e azeitonas pretas",30.37);
insert into Pizza(nome, descricao, valor) values("Romana","Molho de tomate fresco, mussarela especial, rodelas de tomate, filés de aliche importado, orégano e azeitonas pretas",30.21);
insert into Pizza(nome, descricao, valor) values("Rústica","Molho de tomate fresco, calabresa especial fatiada, alho crocante, rodelas de cebola, orégano e azeitonas pretas",30.05);
insert into Pizza(nome, descricao, valor) values("Se Liga","molho de tomate fresco, fatias de lombo canadense, cobertura de provolone, orégano e azeitonas pretas",29.89);
insert into Pizza(nome, descricao, valor) values("Siciliana","Molho de tomate fresco, mussarela especial, fatias de bacon, champignon fatiado, orégano e azeitonas pretas",29.73);
insert into Pizza(nome, descricao, valor) values("Torino","Molho de tomate fresco, calabresa especial fatiada, palmito macio em rodelas, orégano e azeitonas pretas",29.57);
insert into Pizza(nome, descricao, valor) values("Toscana","Molho de tomate fresco, calabresa moída especial, cobertura de mussarela, orégano e azeitonas pretas",29.41);
insert into Pizza(nome, descricao, valor) values("Veneza","Molho de tomate fresco, presunto cozido picado, azeitona verde fatiada, cobertura de mussarela especial e orégano",29.25);
insert into Pizza(nome, descricao, valor) values("Vienense","Molho de tomate fresco, mussarela especial, calabresa especial fatiada, rodelas de cebola, orégano e azeitonas pretas",29.09);

-- Trigger que calcula e atualiza o valor do pedido
create trigger tr_atualiza_valor_pedido after insert
on item_pedido
for each row
update pedido
set valor=(select sum(quantidade * valor) from item_pedido where pedido_id = new.pedido_id)
			where pedido_id = new.pedido_id;
			
-- Insert com select para pegar o valor da pizza e copiar para o valor doítem pedido
-- OBS: Supondo que as pizzas tenham sido vendidas pelo preço cadastrado

insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(1,1,1, (select valor from pizza where pizza_id = 1));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(1,3,2, (select valor from pizza where pizza_id = 3));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(1,5,3, (select valor from pizza where pizza_id = 5));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(1,7,4, (select valor from pizza where pizza_id = 7));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(1,8,5, (select valor from pizza where pizza_id = 8));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(1,11,1, (select valor from pizza where pizza_id = 11));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(1,13,2, (select valor from pizza where pizza_id = 13));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(2,1,3, (select valor from pizza where pizza_id = 1));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(2,3,4, (select valor from pizza where pizza_id = 3));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(2,5,5, (select valor from pizza where pizza_id = 5));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(2,7,1, (select valor from pizza where pizza_id = 7));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(2,8,2, (select valor from pizza where pizza_id = 8));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(2,11,3, (select valor from pizza where pizza_id = 11));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(2,13,4, (select valor from pizza where pizza_id = 13));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(3,7,5, (select valor from pizza where pizza_id = 7));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(3,5,1, (select valor from pizza where pizza_id = 5));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(3,8,2, (select valor from pizza where pizza_id = 8));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(3,9,3, (select valor from pizza where pizza_id = 9));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(3,3,4, (select valor from pizza where pizza_id = 3));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(3,10,5, (select valor from pizza where pizza_id = 10));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(3,16,1, (select valor from pizza where pizza_id = 16));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(4,22,2, (select valor from pizza where pizza_id = 22));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(4,23,3, (select valor from pizza where pizza_id = 23));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(4,8,4, (select valor from pizza where pizza_id = 8));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(4,11,5, (select valor from pizza where pizza_id = 11));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(4,13,10, (select valor from pizza where pizza_id = 13));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(4,7,20, (select valor from pizza where pizza_id = 7));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(4,5,30, (select valor from pizza where pizza_id = 5));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(5,8,40, (select valor from pizza where pizza_id = 8));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(5,9,5, (select valor from pizza where pizza_id = 9));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(5,3,1, (select valor from pizza where pizza_id = 3));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(5,10,2, (select valor from pizza where pizza_id = 10));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(5,16,3, (select valor from pizza where pizza_id = 16));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(5,22,4, (select valor from pizza where pizza_id = 22));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(5,23,5, (select valor from pizza where pizza_id = 23));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(6,8,1, (select valor from pizza where pizza_id = 8));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(6,11,2, (select valor from pizza where pizza_id = 11));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(6,17,3, (select valor from pizza where pizza_id = 17));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(6,16,4, (select valor from pizza where pizza_id = 16));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(6,15,5, (select valor from pizza where pizza_id = 15));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(6,14,1, (select valor from pizza where pizza_id = 14));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(6,13,2, (select valor from pizza where pizza_id = 13));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(7,12,3, (select valor from pizza where pizza_id = 12));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(7,11,4, (select valor from pizza where pizza_id = 11));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(7,10,5, (select valor from pizza where pizza_id = 10));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(7,9,10, (select valor from pizza where pizza_id = 9));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(7,8,20, (select valor from pizza where pizza_id = 8));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(7,7,30, (select valor from pizza where pizza_id = 7));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(7,6,40, (select valor from pizza where pizza_id = 6));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(8,5,5, (select valor from pizza where pizza_id = 5));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(8,4,1, (select valor from pizza where pizza_id = 4));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(8,3,1, (select valor from pizza where pizza_id = 3));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(8,2,2, (select valor from pizza where pizza_id = 2));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(9,1,3, (select valor from pizza where pizza_id = 1));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(9,1,4, (select valor from pizza where pizza_id = 1));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(9,3,5, (select valor from pizza where pizza_id = 3));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(9,5,10, (select valor from pizza where pizza_id = 5));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(10,7,20, (select valor from pizza where pizza_id = 7));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(10,8,30, (select valor from pizza where pizza_id = 8));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(10,1,40, (select valor from pizza where pizza_id = 1));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(10,3,5, (select valor from pizza where pizza_id = 3));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(11,5,1, (select valor from pizza where pizza_id = 5));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(11,7,1, (select valor from pizza where pizza_id = 7));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(11,8,2, (select valor from pizza where pizza_id = 8));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(11,11,3, (select valor from pizza where pizza_id = 11));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(12,13,4, (select valor from pizza where pizza_id = 13));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(13,1,5, (select valor from pizza where pizza_id = 1));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(14,3,10, (select valor from pizza where pizza_id = 3));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(15,5,20, (select valor from pizza where pizza_id = 5));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(16,7,30, (select valor from pizza where pizza_id = 7));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(17,8,40, (select valor from pizza where pizza_id = 8));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(18,22,5, (select valor from pizza where pizza_id = 22));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(19,1,1, (select valor from pizza where pizza_id = 1));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(20,3,1, (select valor from pizza where pizza_id = 3));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(20,5,2, (select valor from pizza where pizza_id = 5));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(20,7,3, (select valor from pizza where pizza_id = 7));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(20,8,4, (select valor from pizza where pizza_id = 8));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(21,11,5, (select valor from pizza where pizza_id = 11));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(21,13,10, (select valor from pizza where pizza_id = 13));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(21,1,20, (select valor from pizza where pizza_id = 1));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(21,3,30, (select valor from pizza where pizza_id = 3));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(22,5,40, (select valor from pizza where pizza_id = 5));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(22,7,5, (select valor from pizza where pizza_id = 7));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(22,8,1, (select valor from pizza where pizza_id = 8));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(22,25,1, (select valor from pizza where pizza_id = 25));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(23,24,2, (select valor from pizza where pizza_id = 24));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(23,23,3, (select valor from pizza where pizza_id = 23));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(23,22,4, (select valor from pizza where pizza_id = 22));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(23,21,5, (select valor from pizza where pizza_id = 21));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(24,20,10, (select valor from pizza where pizza_id = 20));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(25,19,20, (select valor from pizza where pizza_id = 19));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(26,18,30, (select valor from pizza where pizza_id = 18));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(26,17,40, (select valor from pizza where pizza_id = 17));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(26,16,5, (select valor from pizza where pizza_id = 16));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(26,15,1, (select valor from pizza where pizza_id = 15));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(26,14,1, (select valor from pizza where pizza_id = 14));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(26,13,2, (select valor from pizza where pizza_id = 13));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(26,12,3, (select valor from pizza where pizza_id = 12));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(26,11,4, (select valor from pizza where pizza_id = 11));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(26,10,5, (select valor from pizza where pizza_id = 10));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(26,9,10, (select valor from pizza where pizza_id = 9));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(26,8,20, (select valor from pizza where pizza_id = 8));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(26,7,30, (select valor from pizza where pizza_id = 7));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(26,6,40, (select valor from pizza where pizza_id = 6));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(26,5,5, (select valor from pizza where pizza_id = 5));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(26,4,1, (select valor from pizza where pizza_id = 4));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(26,3,1, (select valor from pizza where pizza_id = 3));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(26,2,2, (select valor from pizza where pizza_id = 2));
insert into Item_pedido(pedido_id, pizza_id, quantidade, valor) values(26,1,3, (select valor from pizza where pizza_id = 1));

select * from cliente;
select * from pizza;
select * from telefone;
select * from pedido;
select * from item_pedido;
-- Exemplos de consultas com união de tabelas
select i.pedido_id, i.quantidade, i.valor, i.quantidade * i.valor as subtotal, p.nome, p.valor from item_pedido i, pizza p where i.pizza_id = p.pizza_id order by i.pedido_id;
select i.pedido_id, p.nome, i.quantidade, i.valor, i.quantidade * i.valor as subtotal from item_pedido i, pizza p where i.pizza_id = p.pizza_id order by i.pedido_id;
-- Mostrar todas as tabelas no fim do script
show tables;


-- Criando uma função que retorna o ultimo pedido garado
drop function if exists ultimo_pedido();
delimiter //
create function ultimo_pedido() returns integer
begin
declare retorno integer;
set retorno = (select pedido_id from pedido order by pedido_id desc limit 1);
return retorno;
end//
delimiter ;
select ultimo_pedido();

-- Criando uma função que coloca R$ antes do valor
delimiter //
create function dinheiro(din decimal(5,2)) returns text
begin 
return concat("R$ ", din);
end//
delimiter ;

-- Criando um procedimento que insere um pedido,
-- insere um item do pedido quando é de apenas um sabor de pizza
-- atualiza o valor total
-- e lista os pedidos do cliente
drop procedure if exists criar_pedido_item_igual;
delimiter //
create procedure criar_pedido_item_igual(cli integer, pizza int, qtd int)
begin
	insert into pedido values
		(default,cli,curdate(),curtime(),0);
	insert into item_pedido values
		(ultimo_pedido(),pizza,qtd,(select valor from pizza where pizza_id = pizza));
	update pedido set valor=(select sum(quantidade * valor) from item_pedido where pedido_id = ultimo_pedido())
			where pedido_id = ultimo_pedido();
	select c.cliente_id, c.nome, p.pedido_id, p.data,
		z.nome as pizza, i.quantidade,
		dinheiro(i.valor) as preco,
		dinheiro(i.quantidade * i.valor) as total
		from cliente c
		inner join pedido p
		on c.cliente_id = p.cliente_id
		inner join item_pedido i
		on p.pedido_id = i.pedido_id
		inner join pizza z
		on i.pizza_id = z.pizza_id
		where c.cliente_id = cli
		order by p.data desc;
end//
delimiter ;

create view vw_pedidos as
select c.cliente_id, c.nome, p.pedido_id,
z.nome as pizza, i.quantidade,
dinheiro(i.valor) as preco,
dinheiro(i.quantidade * i.valor) as total
from cliente c
inner join pedido p
on c.cliente_id = p.cliente_id
inner join item_pedido i
on p.pedido_id = i.pedido_id
inner join pizza z
on i.pizza_id = z.pizza_id
order by p.pedido_id;

-- Testa o Procedimento
call criar_pedido_item_igual(3,5,3);

show tables;


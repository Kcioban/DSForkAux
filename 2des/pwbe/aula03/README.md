# Conexão com Banco de Dados MySQL x NodeJS
- CRUD - READ x GET x SELECT
- INSOMNIA - Ferramenta de Produtividade e Testes

# Exemplo simples de criação de uma API
- O banco de dados chama-se: clientes
- Possui duas tabelas "clientes" e "telefones"
- as duas tabelas são vistas jundas através da view/consulta "vw_clientes"
- O primeiro desafio do Back-End é responder a uma requisição GET que lista todos os dados da visão "vw_clientes"
    - Preparar o ambiente NodeJS
    - 1. Criar uma pasta para o projeto "clientes"
    - 2. Abrir com o VsCode
    - 3. Criar uma subPasta "docs" e colocar o script de criação e iportação de dados do banco de dados nesta pasta "script.sql" + "telefones.csv"
        - 3.1. Garantir que o serviço do SGBD mysql esteja iniciado no XAMPP Contol Panel
        - 3.2. Garantir que o banco de dados esteja pronto e populado com os dados importados.
    - 4. Iniciar o projeto clientes "npm init" no terminal do vscode.
    - 5. Adicionar as 4 dependências "npm install dependencia" (express, cors, mysql e nodemom)
    - 6. Criar o arquivo .gitignore e acrescentar a pasta node_modules
    - 7. Criar o arquivo index.js e programar o acesso ao banco de dado e a resposta através da rota "/clientes"
    - 8. Executar o backEnd "node index.js" ou "nodemon index.js"
    - 9. Abrir o FrontEnd (navegador ou insomnia) e fazer uma requisição GET no caminho http://localhost:porta/clientes
    - 10. Se estiver utilizando o insomnia, criar um novo "Request Colection" e uma requisição GET chamada "clientes"
    - O retorno deve ser um vetor JSON mostrando os clientes e seus telefones.

# Conhecimentos:
- 1. Ambiente de desenvolvimento web
- 1.1. Definição
- 1.2. Histórico
- 1.3. Características
- 1.4. Ambiente de desenvolvimento
- 1.4.1. Instalação e configuração
- 1.4.2. Recursos e interfaces
- 1.4.3. Gerenciamento de dependências
- 2. Padrão de desenvolvimento MVC
- 3. Frameworks
- 4. Persistência de dados
- 4.1. Conexão com base de dados
- 4.2. CRUD
- 4.6. Manipulação de dados utilizando JSon
- 5. Web Services
- 5.2. Integração de plataformas utilizando API
- 5.3. Notificação entre cliente servidor utilizando Web Services
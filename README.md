# Template Robot Framework

## Objetivo 
Este projeto implementa o desafio 2 do módulo Pro do curso "Gravidade Zero" da QA Ninja.

## Como configurar o ambiente
* Faça a instalação do Python 3.7 ou superior. Não esqueça de selecionar "Add Python to PATH" durante esta instalação.
* Faça a instalação do Robot Framework através do comando "pip install robotframework". 
* Faça a instalação do Node.js 14.15 ou superior. Este procedimento é necessário porque o exemplo implementado utiliza a biblioteca Browser e esta executa comandos da ferramenta Playwright.
* Faça a instalação da bibioteca Browser através do comando "pip install robotframework-browser". 
* Faça a instalação das dependências do Node.js através do comando "rfbrowser init".

## Como executar os testes automatizados
*  Acessar a pasta do projeto que contém as pastas "resources" e "tests" através da linha de comando.  
*  Utilize o seguinte comando para executar os testes se estiver trabalhando com Linux, Mac ou com emulador de terminal compatível com Linux: ./run.sh
*  Utilize o seguinte comando para executar os testes se estiver trabalhando com Windows: run.bat
* O relatório de execução dos testes é gerado dentro da pasta "logs". Para visualizá-lo, abra o arquivo "report.html" através de um navegador. 
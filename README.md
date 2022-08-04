# Alocacao-em-projetos
Projeto que visa a designação de membros de uma empresa aos projetos disponíveis nela.

O código tem como objetivo alocar trabalhadores em determinados projetos de uma empresa real, visando maximizar o sucesso da alocação, medida pela satisfação dos funcionários com a designação. Esse estudo foi entregue como trabalho final da disciplina de Pesquisa Operacional I da Escola de Admininstração da UFRGS e está disponível no PDF [Trabalho PO_2019_2.pdf](https://github.com/Vilmar1/Alocacao-em-projetos/blob/main/Trabalho%20PO_2019_2.pdf). 


## Contexto
Uma empresa contratou 10 novos funcionários e deseja alocá-los nos 4 projetos da empresa. Para isso, enviou a eles um questionário pedindo suas qualificações em softwares e habilidades. Em seguida, o diretor de projeto gerou a "aptidão" de cada novo empregado a cada projeto a partir de combinações dessas habilidades e softwares, reservadas as particularidades de cada projeto. Portanto, o problema reside em determinar qual a alocação que maiximiza a soma das aptidões individuais dentre todas as possíveis, ilustrada na figura abaixo.

<p align="center">
  <img src="https://user-images.githubusercontent.com/38505459/182950912-0a88cd1a-0559-4641-ad60-e4063ff09d9d.png">
</p>

## Dados
Os dados são extraídos dos questionários respondidos pelos funcionários, com os 10 respondentes (linhas) em 11 habilidades (colunas):
<p align="center">
  <img src="https://user-images.githubusercontent.com/38505459/182952918-0557982e-3221-4e89-b492-38bb5f7f6a79.png">
</p>

Em seguida, o diretor de projetos da empresa converte as habilidades em aptidões após a seleção das variáveis de interesse em cada projeto:
<p align="center">
  <img src="https://user-images.githubusercontent.com/38505459/182952856-efbc20c4-a4ae-4401-b055-fca6adc45645.png">
</p>

## Modelo
O modelo na forma canônica pode ser visualizado abaixo:
<p align="center">
  <img src="https://user-images.githubusercontent.com/38505459/182952685-7c2f907d-40a9-4ea9-bd65-be75db16027b.png">
</p>
onde:

- $x_{ij}$ é a variável de decisão binária;

- $h_{ij}$ é a aptidão do funcionário em determinado projeto.

A função objetivo visa maximizar a soma da aptidão coletiva, restrita a alocação de uma pessoa a um e somente um projeto.
  
## Resultados
Os resultados da alocação podem ser encontrados no [Trabalho PO_2019_2.pdf](https://github.com/Vilmar1/Alocacao-em-projetos/blob/main/Trabalho%20PO_2019_2.pdf), bem como a sua análise de sensibilidade.

Além disso, dentro da empresa os resultados foram largamente aceitos e houve uma satisfação geral com a implementação dos resultados. Das 10 pessoas que participaram, somente uma delas pediu realocação, que foi atendida pelos superiores.

## Como reproduzir os resultados?
Após instalar o AMPL e clonar esse github, basta o usuário rodar o [alocacao-em-projetos.run](https://github.com/Vilmar1/Alocacao-em-projetos/blob/main/alocacao-em-projetos.run).

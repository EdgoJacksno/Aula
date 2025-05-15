*****************************************************
* 1. Criar uma base de dados fictícia
*****************************************************

input idade
12
13
14
12
13
15
14
14
13
12
12
14
15
13
12
end


*****************************************************
* 2. Distribuição de frequência por ponto
*****************************************************

dist idade
graph bar (count), over(idade) 
graph pie, over(idade)

*****************************************************
* 3. Distribuição de frequência por classe
*****************************************************


dist idade, intervalo

*Gráfico de barras
graph bar (count), over(idade) blabel(bar)


*Gráfico de setores
graph pie, over(idade)
graph pie, over(idade) plabel(_all percent)



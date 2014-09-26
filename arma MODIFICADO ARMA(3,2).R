###Pacotes do R necessários. Devem ser instalados atraves da aba Packages e inicializados com os comando abaixo.
library(forecast)
library(lubridate)
library(astsa)
library(stats)
library(fitdistrplus)
library(tseries)

#### #### Rodar todo o script abaixo. Em seguida digitar a função modelo(dados,sasonalidade,prev,simu) 
#### dados: serie de dados de velocidade de vento ou potencia salvo em arquivo CSV separado por virgulas ex:"dados.csv" com as aspas
#### sasonalidade: 52 para semanas, 12 para meses.    
#### prev: numero de periodos a frente para prever
#### simu: numero de simulacoes desejadas
#### pp: ano para computar o erro de previsao

####Exemplo: modelo("poten.csv", 52, 10, 1000) - periodicidade semanal, previsao de 10 periodos e 1000 simulacoes.

####obs 1: os dados de entrada devem estar na pasta de onde o R puxa os arquivos, o default e a pasta documentos
####obs 2: O separador de decimais do R r ponto, e não virgula. Certifique-se de que o arquivo .csv esta correto.
####obs 3: O R nao entende separador de milhar, portanto no excel os dados devem estar no formato "numero"
####obs 4: O arquivo csv deve conter apenas UMA coluna de dados com a serie a ser analisada. Sem coluna de data, apenas a serie. Certifique-se de que a coluna unica começa na celula A1 antes de salvar como csv
####obs 5: a programacao ja salva os resultados em csv nos aquivos previsao.csv e simulacao.csv na pasta raiz do R.

a=read.table("potenMERRAdadosR.csv",sep=";")


modelo=function(dados,prev,pp){
  
  ###entrada de dados e aujste do modelo
  
  a=dados
  a=as.vector(a)
  
  
  model <- arma(a, order=c(3,2))
  
  
  
  ####previsao
  
  #previsao=data.frame(forecast(model,prev))
  
  #plot(forecast(model,prev),xlab="t",ylab="vel. do vento ou potencia", main="Previsão ARMA")
  #lines(c(a,previsao[1,1])) 
  #write.table(previsao,"previsao.csv",sep=";")
  
  
  #results=c(previsao[pp,1])
  
  return(model)
  
}


############################################

modelo2=function(dados,prev,pp){
  
  ###entrada de dados e aujste do modelo
  
  a=dados
  a=as.matrix(a)
 
  
  model <- arima(a, order=c(3,0,2), seasonal=list(order=c(0,0,0)))
  
  
  
  ####previsao
  
  previsao=data.frame(forecast(model,prev))
  
  plot(forecast(model,prev),xlab="t",ylab="vel. do vento ou potencia", main="Previsão ARMA")
  lines(c(a,previsao[1,1])) 
  write.table(previsao,"previsao.csv",sep=";")
  
  
  results=c(previsao[pp,1])
  
  return(model)
  
}


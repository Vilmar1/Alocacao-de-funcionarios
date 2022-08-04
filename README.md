# Alocacao-em-projetos
Projeto que visa a designação de membros de uma empresa aos projetos disponíveis nela.

O código tem como objetivo alocar trabalhadores em determinados projetos de uma empresa real, visando maximizar o sucesso da alocação, medida pela satisfação dos funcionários com a designação. Esse estudo foi entregue como trabalho final da disciplina de Pesquisa Operacional I da Escola de Admininstração da UFRGS. 


## Contexto
Uma empresa contratou 11 novos funcionários e deseja alocá-los nos 4 projetos da empresa. Para isso, enviou a eles um questionário pedindo suas qualificações em softwares e habilidades. Em seguida, o diretor de projeto gerou a "aptidão" de cada novo empregado a cada projeto a partir de combinações dessas habilidades e softwares, reservadas as particularidades de cada projeto. Portanto, o problema reside em determinar qual a alocação que maiximiza a soma das aptidões individuais dentre todas as possíveis, ilustrada na figura abaixo.
![image](https://user-images.githubusercontent.com/38505459/182950912-0a88cd1a-0559-4641-ad60-e4063ff09d9d.png)

Falar do trabalho final de disciplina de PO, EQ, contextualizar a modelagem (foto da rede)
<p align="center">
  <img src="https://user-images.githubusercontent.com/38505459/124338662-95790d00-db7f-11eb-9c5c-5ba292d3df07.png">
</p>

## Explicar um pouco mais os dados

## Explicar um pouco mais o modelo

## Explicar um pouco dos resultados
Todos os caras foram alocados e a satisfação dentro da empresa foi muito boa, somente uma pessoa quis trocar de projeto e achou que foi mal alocada. Falar que tem a Analise de sensibilidade 

## Como reproduzir os resultados?
vai ter o .dat ali e tem que instalar o ampl e rodar o .run

# Outlier Detection and Smoothing

Although the filtering made in the nightlights images by National Oceanic and Atmospheric Administration, there are some outliers in the data. Establishing a criterion to detect these errors, the samples of each state were compared to themselves longitudinally, using descriptive statistics of each state to detect its outliers. Lastly, a moving average process replace this errors.

This README explains the outlier treatment in the nighlight time series. Thus, after detrending the data, a sample is considered an outlier if its nightlight intensity cross the threshold of the mean plus (or minus) two standard deviations of the of observations in this state. The observations in which this statement is true - 4,82% of the total - were substituted by the average luminosity of the eleven months before (or after if the sample is in the first 11 months) in that state. To replicate the results, refer to [outlier_substitution.py](https://github.com/viniciusbrei/PublicData/blob/data/outlier%20substitution/outlier_substitution.py).

## Detecting Outliers
One first picture of the data in each state is in the boxplot below (centering in the mean). Note that there are positives and negative outliers.

<p align="center">
  <img src="https://user-images.githubusercontent.com/38505459/124338662-95790d00-db7f-11eb-9c5c-5ba292d3df07.png">
</p>

To get a consistent descriptive measures, we need to remove the trend in each state time series. A way to capture the trend  in each state is to consider the month t (ranging from 0 to 92) and apply the corresponding function: 

<p align="center"><img src="https://latex.codecogs.com/gif.latex?f(t)&space;=&space;\frac{med_f&space;-&space;med_i}{N\_obs-1}&space;*t," title="f(t) = \frac{med_f - med_i}{N\_obs-1} *t," /></a>

where:
* <img src="https://latex.codecogs.com/gif.latex?med_f" title="med_f" /></a> is the mean luminosity in the 12 initial months;
* <img src="https://latex.codecogs.com/gif.latex?med_i" title="med_i" /></a> is the mean luminosity in the 12 last months;
* <img src="https://latex.codecogs.com/gif.latex?N\_obs" title="N\_obs" /></a> is the number of observations;
* <img src="https://latex.codecogs.com/gif.latex?t" title="t" /></a> ranges from 0 to 92, totalizing 93 months.

This process allow us remove the seasonal effects in the mean, previosly stuck in the intermediate values (like in Rio Grande do Sul). A second benefit is the decrasing in the variance, while before it had positive amounts from the trend. These two concepts allow us to see negative outliers when the series have a positive trend (like in Paraná) and positive outliers with positive trend (like in Amazonas). 

![image](https://user-images.githubusercontent.com/38505459/124339955-25bb5000-db88-11eb-85a2-bab5f827ff01.png)
![image](https://user-images.githubusercontent.com/38505459/124339961-2d7af480-db88-11eb-800d-fba8cab0f072.png)
![image](https://user-images.githubusercontent.com/38505459/124339966-353a9900-db88-11eb-9c2c-f91549877353.png)
![image](https://user-images.githubusercontent.com/38505459/124339979-497e9600-db88-11eb-840d-750f39785c56.png)


In this detrended time series, we now estabilish a criteria to detect the outliers. After several analysis, we define an outlier in the luminosity data as an observation which value is above the threshold given by the mean plus/minus two standard deviations evaluated in its detrended time series. Less than 5% of the 2511 samples were identified as outliers.   

![image](https://user-images.githubusercontent.com/38505459/124340343-e6423300-db8a-11eb-86fe-be73180b1b5a.png)
![image](https://user-images.githubusercontent.com/38505459/124340348-eb06e700-db8a-11eb-871f-f4cdd299f143.png)
![image](https://user-images.githubusercontent.com/38505459/124340333-d62a5380-db8a-11eb-828f-06370865479b.png)
![image](https://user-images.githubusercontent.com/38505459/124340351-f0fcc800-db8a-11eb-801d-3fabd4c7d608.png)


## Smoothing Outliers

After the detection, the last step is the substitution of this outliers. Then, it was proposed a smoothing by Moving Average processes with 2, 3 and 11 periods. 

![image](https://user-images.githubusercontent.com/38505459/124340724-931daf80-db8d-11eb-8e59-9daf9718c4c3.png)
![image](https://user-images.githubusercontent.com/38505459/124340722-8ef19200-db8d-11eb-8f42-6ae7cc55a783.png)
![image](https://user-images.githubusercontent.com/38505459/124340730-9f097180-db8d-11eb-83ba-1a4852aaed2e.png)
![image](https://user-images.githubusercontent.com/38505459/124340725-97e26380-db8d-11eb-8eef-2545a10f28dc.png)


Because this implementation often considers outliers in the MA itself, the MA carry a bias from the outliers. Therefore, the MA 11 is the best choice (less biased). The outliers were replaced by:

* The mean of the luminosity in the previous 11 months in the corresponding state, if the period is after or equal the 12th month;
* The mean of the luminosity in the next 11 months in the corresponding state, if the period is before the 12th month;

## Returning to the Original 

Lastly, in the final step we input the trend in each state to return to the original values. A comparison before and after the oulier removal is in the charts below:

![image](https://user-images.githubusercontent.com/38505459/124341025-e264df80-db8f-11eb-9058-c515a88dfb64.png)
![image](https://user-images.githubusercontent.com/38505459/124341023-dd079500-db8f-11eb-91ab-82d243c2b375.png)
![image](https://user-images.githubusercontent.com/38505459/124341032-ebee4780-db8f-11eb-9b80-80fba2892751.png)
![image](https://user-images.githubusercontent.com/38505459/124341029-e690fd00-db8f-11eb-9db9-8134584c707f.png)

This concludes the analysis and generates the `lights_2std` column in the Merged2 table.

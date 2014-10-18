from __future__ import print_function
__author__ = 'Fernando'

import os
import numpy as np
from scipy import stats
import pandas as pd
import matplotlib.pyplot as plt
import statsmodels.api as sm

os.chdir("C:\Users\Fernando\Dropbox (Pessoal)\Fernando\Dissertacao\Scripts")




wind = pd.read_csv('potenMERRA.csv', sep=';', encoding='latin1')
#print(wind)


wind.plot(figsize=(14,10))
plt.axis([1, 760, 0, 2700])
plt.xlabel('Semana');
plt.ylabel('Potencia');
#plt.show()

fig = plt.figure(figsize=(12,8))
ax1 = fig.add_subplot(211)
fig = sm.graphics.tsa.plot_acf(wind.values.squeeze(), lags=90, ax=ax1)
ax2 = fig.add_subplot(212)
fig = sm.graphics.tsa.plot_pacf(wind, lags=90, ax=ax2)

#plt.show()


wind.index = pd.date_range(start= '2000-01-07', periods=747, freq="7D")

#modelo ARMA(3,2)
#arma_mod32 = sm.tsa.ARMA(wind, (3,2), dates=wind.index).fit()
#print (arma_mod32.params)

#modelo ARIMA(3,0,2)
arima_mod302 = sm.tsa.ARIMA(wind, (3,0,2), dates=wind.index, exog=None).fit()

print(arima_mod302.params)

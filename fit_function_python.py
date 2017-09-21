#!/usr/bin/python

import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import curve_fit

# input variables
if_ma = open('file1.dat', 'r')
if_fa = open('file2.dat', 'r')
x_max_fit = 12

#program
def func(x,tau):
    return np.exp(-x/tau)

x_ma = [] ; y_ma = []
for line in if_ma.readlines():
    fields = line.split()
    if len(fields) == 2 and float(fields[0]) < x_max_fit:
        x_ma.append(float(fields[0]))
        y_ma.append(float(fields[1]))
if_ma.close()
x_ma = np.array(x_ma) ; y_ma = np.array(y_ma)
popt, pcov = curve_fit(func, x_ma, y_ma)
t_MA = popt[0]

plt.xlabel('t')
plt.ylabel('P')
plt.plot(x_ma, y_ma, 'g-', label = 'MA')
plt.plot(x_ma, func(x_ma,t_MA), 'r-', label = 'MA_fit')
#plt.xlim([0, 2*np.pi])
#plt.ylim([-1.5, 1.5])
plt.legend(loc = 'upper center', shadow = True)
plt.show()


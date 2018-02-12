# Multiple Linear Regression

# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Importing the dataset
dataset = pd.read_csv('50_Startups.csv')
X = dataset.iloc[:, :-1].values #training Data set
y = dataset.iloc[:, 4].values	#testing data set

------------------------------------------------------------------------------------------------------------------------

# Encoding categorical data
from sklearn.preprocessing import LabelEncoder, OneHotEncoder
labelencoder = LabelEncoder()
X[:, 3] = labelencoder.fit_transform(X[:, 3])
#Ths number '3' used here os to denote the column number of the categorical value
onehotencoder = OneHotEncoder(categorical_features = [3])
X = onehotencoder.fit_transform(X).toarray()

------------------------------------------------------------------------------------------------------------------------

# Avoiding the Dummy Variable Trap
X = X[:, 1:]

------------------------------------------------------------------------------------------------------------------------

# Splitting the dataset into the Training set and Test set
from sklearn.cross_validation import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.2, random_state = 0)

# Feature Scaling
"""from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler()
X_train = sc_X.fit_transform(X_train)
X_test = sc_X.transform(X_test)
sc_y = StandardScaler()
y_train = sc_y.fit_transform(y_train)"""

# Fitting Multiple Linear Regression to the Training set
from sklearn.linear_model import LinearRegression
regressor = LinearRegression()
regressor.fit(X_train, y_train)

# Predicting the Test set results
y_pred = regressor.predict(X_test)

#Now the aim is tofind an optimal team of independent variables has great impact on the dependent variable
#such that it is highly statistically significant 
#Building the optimal model using Backward Elimination
import statsmodels.formula.api as sm

#To add to the constant b0 in the formula of Multiple Linear Regression (b0 + b1X1 + b2X2 + ... +bnXn)
#So, we shall a column of ones to tell the statsmodel library that b0 exists #drama
!!! X = np.append(arr = X, values = np.ones{(50,1)}.astype{int}, axis = 1) !!! Don't execute this line as it is faulty as it adds the 1s to the end of the csv, but, we need to add it to the start of the csv
#This code ABOVE helps append a column of 1s to the end of the csv. 
#np.ones(no of rows, no of columns)
#If you want to add a row, then, axis = 0, else, if you want to add a column, then, axis = 1.
X = np.append(arr = np.ones((50,1)).astype(int), values = X, axis = 1 )

#Backward Elimination - remove independent variables that are not statistically significant
import statsmodels.formula.api as sm
X_opt = X[:, [0,1,2,3,4,5]]
refressor_OLS = sm.OLS(endog = y, exog = X_opt).fit() 
#OLS has (endog -> dependent variable) (exog -> independent variable) intercept not included by default
#To use the predictor, we have to use a summart() function to understand the data
regressor_OLS.summary()
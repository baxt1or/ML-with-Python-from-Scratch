import numpy as np
from sklearn  import datasets
import matplotlib.pyplot as plt
from logistic_regression import LogisticRegression
from sklearn.model_selection import train_test_split
import pandas as pd


bc =  datasets.load_breast_cancer()


X, y = bc.data, bc.target

X_train, x_test, y_train ,y_test = train_test_split(X, y, test_size=0.2, random_state=1234)

lgr = LogisticRegression()

lgr.fit(X_train, y_train)

y_pred = lgr.predict(x_test)


def accuracy(y_pred, y_test):
    return np.sum(y_pred == y_test)/len(y_test)


acc = accuracy(y_pred, y_test)

print(f"Accuracy: {acc:.2f}")

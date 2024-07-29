import numpy as np



def sigmoid(x):
    return 1/(1+np.exp(-x))

class LogisticRegression():

    def __init__(self, lr=0.001, epochs=1000):
        self.lr = lr
        self.epochs = epochs
        self.weight= None
        self.bias = None
    
    def fit(self, X, y):
        n_samples, n_features = X.shape
        self.weight = np.zeros(n_features)
        self.bias = 0

        for _ in range(self.epochs):
            linear_predictions = np.dot(X,self.weight)+ self.bias
            predictions = sigmoid(linear_predictions)

            df_dw = (1/n_samples) * np.dot(X.T, (predictions - linear_predictions))

            df_db = (1/n_samples) * np.sum(predictions - y)

            self.weight = self.weight - self.lr * df_dw
            self.bias = self.bias - self.lr *df_db

    def predict(self, X):
        linear_predictions = np.dot(X,self.weight)+ self.bias
        y_predictions = sigmoid(linear_predictions)

        class_predictions = [0 if y <= 0.5 else 1 for y in y_predictions]

        return class_predictions
        




    def __init__(self, lr=0.001, n_iters=1000):
        self.lr = lr
        self.n_iters = n_iters
        self.weights = None
        self.bias = None

    def fit(self, X, y):
        n_samples, n_features = X.shape
        self.weights = np.zeros(n_features)
        self.bias = 0

        for _ in range(self.n_iters):
            linear_pred = np.dot(X, self.weights) + self.bias
            predictions = sigmoid(linear_pred)

            dw = (1/n_samples) * np.dot(X.T, (predictions - y))
            db = (1/n_samples) * np.sum(predictions-y)

            self.weights = self.weights - self.lr*dw
            self.bias = self.bias - self.lr*db


    def predict(self, X):
        linear_pred = np.dot(X, self.weights) + self.bias
        y_pred = sigmoid(linear_pred)
        class_pred = [0 if y<=0.5 else 1 for y in y_pred]
        return class_pred
#import sys
#import scipy
import argparse
from argparse import ArgumentParser
import pandas
import sklearn
from sklearn import model_selection
from sklearn.metrics import classification_report
from sklearn.metrics import confusion_matrix
from sklearn.metrics import accuracy_score
from sklearn.linear_model import LogisticRegression
from sklearn.tree import DecisionTreeClassifier
from sklearn.neighbors import KNeighborsClassifier
from sklearn.discriminant_analysis import LinearDiscriminantAnalysis
from sklearn.naive_bayes import GaussianNB
from sklearn.svm import SVC

def runML():
	parser = ArgumentParser()
	parser.add_argument("sLength",type=float,help="Sepal length")
	parser.add_argument("sWidth",type=float,help="Sepal width")
	parser.add_argument("pLength",type=float,help="Petal length")
	parser.add_argument("pWidth",type=float,help="Petal width")

	args = parser.parse_args()

	# Load dataset
	url = "https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data"
	names = ['sepal-length', 'sepal-width', 'petal-length', 'petal-width', 'class']
	dataset = pandas.read_csv(url, names=names)

	# Split-out validation dataset (20% validation data)
	array = dataset.values
	X = array[:,0:4]
	Y = array[:,4]
	X.reshape(1,-1)
	validation_size = 0.20
	seed = 7
	X_train, X_validation, Y_train, Y_validation = model_selection.train_test_split(X, Y, test_size=validation_size, random_state=seed)


	# Test options and evaluation metric
	seed = 7
	scoring = 'accuracy'

	# Spot Check Algorithms
	models = []
	models.append(('LR', LogisticRegression()))
	models.append(('LDA', LinearDiscriminantAnalysis()))
	models.append(('KNN', KNeighborsClassifier()))
	models.append(('CART', DecisionTreeClassifier()))
	models.append(('NB', GaussianNB()))
	models.append(('SVM', SVC()))

	# evaluate each model in turn
	results = []
	names = []
	for name, model in models:
	 kfold = model_selection.KFold(n_splits=10, random_state=seed)
	 cv_results = model_selection.cross_val_score(model, X_train, Y_train, cv=kfold,scoring=scoring)
	 results.append(cv_results)
	 names.append(name)
	 msg = "%s: %f (%f)" % (name, cv_results.mean(), cv_results.std())
	 #print(msg)

	# Make predictions on validation dataset
	knn = KNeighborsClassifier()
	knn.fit(X_train, Y_train)
	#predictions = knn.predict(X_validation)
	#print(accuracy_score(Y_validation, predictions))
	#print(confusion_matrix(Y_validation, predictions))
	#print(classification_report(Y_validation, predictions))

	#predictions = knn.predict(X_validation[0])   #this is for scikit 0.19  version issue fix 
	#predictions = knn.predict([5.9, 3.0, 5.1, 1.8]) 
	predictions = knn.predict([args.sLength, args.sWidth, args.pLength, args.pWidth]) 
	print(predictions[0])
	return predictions[0]

runML()




import io
import requests
import argparse
from argparse import ArgumentParser
import pandas
import numpy as np
import sklearn
from sklearn import model_selection
from sklearn.linear_model import LinearRegression
from sklearn import preprocessing

def runML():
    parser = ArgumentParser()
    parser.add_argument("dist_taxi",type=int)
    parser.add_argument("dist_market",type=int)
    parser.add_argument("dist_hospital",type=int)
    parser.add_argument("carpet",type=int)
    parser.add_argument("builtup",type=int)
    parser.add_argument("parking",type=int)
    parser.add_argument("city_category",type=int)
    parser.add_argument("rainfall",type=int)

    args = parser.parse_args()
	
	# Load dataset
    url = 'http://ucanalytics.com/blogs/wp-content/uploads/2016/07/Regression-Analysis-Data.csv'
	#url = 'C:\\AI\\ApartmentPricePrediction\\data\\regression_newdata.csv'
    response = requests.get(url)
    file_object = io.StringIO(response.content.decode('utf-8'))
    dataset = pandas.read_csv(file_object)
    dataset.dropna(inplace=True)
	#dataset.fillna(value=0, inplace=True)
	
	#names = ['Observation', 'Dist_Taxi','Dist_Market','Dist_Hospital','Carpet','Builtup','Parking','City_Category','Rainfall','House_Price']
	#dataset = pandas.read_csv(file_object, names=names)
	
    le = preprocessing.LabelEncoder()
    dataset['Parking'] = le.fit_transform(dataset['Parking'].astype(str))
    dataset['City_Category'] = le.fit_transform(dataset['City_Category'].astype(str))
    dataset['Builtup'] = le.fit_transform(dataset['Builtup'].astype(str))
	
	#dataset['Dist_Taxi'] = le.fit_transform(dataset['Dist_Taxi'].astype(np.int64))
	#dataset['Dist_Market'] = le.fit_transform(dataset['Dist_Market'].astype(np.int64))
	#dataset['Dist_Hospital'] = le.fit_transform(dataset['Dist_Hospital'].astype(np.int64))
	#dataset['Carpet'] = le.fit_transform(dataset['Carpet'].astype(np.int64))
	
	#dataset.iloc[1,0:10] = le.fit_transform(dataset.iloc[1,0:10].astype(str))
	#dataset = dataset.apply(le.fit_transform)

	# Split-out validation dataset (20% validation data)
    array = dataset.values
    X = array[:,1:9] #ignores first column
    Y = array[:,9]
    validation_size = 0.20
    seed = 7
	
    X_train, X_validation, Y_train, Y_validation = model_selection.train_test_split(X, Y, test_size=validation_size, random_state=seed)
	 
    model = LinearRegression()
    kfold = model_selection.KFold(n_splits=3, random_state=seed)
    cv_results = model_selection.cross_val_score(model, X_train, Y_train, cv=kfold,scoring='r2')
    msg = "%f (%f)" % (cv_results.mean(), cv_results.std())
    #print(msg)

	# Make predictions on validation dataset
    model.fit(X_train, Y_train)
    predictions = model.predict([[args.dist_taxi,args.dist_market,args.dist_hospital,args.carpet,args.builtup,args.parking,args.city_category,args.rainfall]]) 
    price = abs(predictions[0].astype(np.int64))
    print(price)
    return price

runML()




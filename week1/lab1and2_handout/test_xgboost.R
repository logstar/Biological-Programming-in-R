require(xgboost)

data(agaricus.train, package='xgboost')
data(agaricus.test, package='xgboost')
train <- agaricus.train
test <- agaricus.test


bstSparse <- xgboost(data = train$data, label = train$label, 
                     max_depth = 2, eta = 1, nthread = 2, nrounds = 2, objective = "binary:logistic")
bstSparse
xgb.importance(model = bstSparse)

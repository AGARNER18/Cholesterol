# Amber Garner

# Find, load, and view sample of cholesterol data
dir()
chol <- read.csv("cholesterol.csv", head=T, sep=",")
head(chol)

# Set random number so can be replicated
set.seed(1234)

# Divide data into training and test sets
ind <- sample(2, nrow(chol), replace = TRUE, prob = c(0.7, 0.3))
train.chol <- chol[ind == 1, ]
test.chol <- chol[ind == 2, ]

# Formula: cholesterol is outcome, all other variables are input
myFormula<-chol~.

# Model the formula using the training set
model<-lm(myFormula, data=train.chol)

# See results of model
print(model)

# See available properties
attributes(model)

# See the coefficients
model$coefficients

# Predicted values for each instance
model$fitted.values

# View details about the model: coefficients, residuals, p-value, residual standard error
summary(model)

# Use predict function to evaluate the model using the test data
pred <- predict(model,  newdata=test.chol)

# Plot the predicted values against the actual values for the test data
plot(test.chol$chol, pred, xlab = "Observed", ylab = "Prediction")
abline(a = 0, b = 1)

# Create diagnostic plots
plot (model)

# Use step to remove an independent variable at each step to create minimal model
model2<-step(model, direction="backward")

# View details about minimal model
summary(model2)


###### Not necessary but to see difference between model and model2
pred <- predict(model2,  newdata=test.chol)

plot(test.chol$chol, pred, xlab = "Observed", ylab = "Prediction")
abline(a = 0, b = 1)

plot(model2)

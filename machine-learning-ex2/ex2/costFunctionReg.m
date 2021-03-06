function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta


predictions = sigmoid(X * theta);

thetaZero = theta;
thetaZero(1) = 0;

cost1 = (1/m)*(-y' * log(predictions) - (1-y')*log(1-predictions));
cost2 = (lambda/(2*m)) * sum(thetaZero.^2);
J = cost1 + cost2;

gradient1 = (1/m)*(X' * (predictions - y));
gradient2 = (lambda/m) * thetaZero;
grad = gradient1 + gradient2;

% =============================================================

end

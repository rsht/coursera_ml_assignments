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


hyphotesis = sigmoid(X * theta);

costs  = -(y' * log(hyphotesis)) - (((1 - y)') * log(1 - hyphotesis));
regulazation_terms = (lambda/(2*m)) * sum( theta(2:size(theta,1),:) .^ 2 );

J = 1/m * costs + regulazation_terms;

%theta-0 is regulazied, so is set to zero
theta_for_grad_reg = theta;
theta_for_grad_reg(1) = 0;

regulazation_terms_grad = (lambda / m) .* theta_for_grad_reg;
grad = (1/m * (X' * (hyphotesis - y))) + regulazation_terms_grad;
% =============================================================

end

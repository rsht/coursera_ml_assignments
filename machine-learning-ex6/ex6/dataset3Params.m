function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%


%C and Sigma values to itarate over
Cs = [ 0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30 ];
SigmaS = Cs;

errors = zeros(length(Cs), length(SigmaS));
for C_idx = 1:length(Cs)
  cur_c  = Cs(C_idx);
  for Sigma_idx = 1:length(SigmaS)
    cur_sigma  = SigmaS(Sigma_idx);
    
    cur_model = svmTrain(X, y, cur_c, @(x1, x2) gaussianKernel(x1, x2, cur_sigma));
    
    cur_predictions = svmPredict(cur_model, Xval);
    cur_error = mean(double(cur_predictions ~= yval));
    
    errors(C_idx, Sigma_idx) = cur_error;
  endfor
endfor

[colwise_min, colwise_min_rows_idx] = min(errors);
[matrix_min, min_col] = min(colwise_min);
min_row = colwise_min_rows_idx(min_col);

C = Cs(min_row);
sigma = SigmaS(min_col);

% =========================================================================

end

function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
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

C = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
sigma = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
%train_prediction = zeros(length(C), length(sigma));
%val_prediction = zeros(length(C), length(sigma));
train_error = zeros(length(C), length(sigma));
val_error = zeros(length(C), length(sigma));
model = zeros(1,8);
%size(C);
%size(sigma);
disp(C);
disp(sigma);
for i=1:length(C)
 for j=1:length(sigma)
  %disp(C);
  model = svmTrain(X, y, C(i), @(x1, x2) gaussianKernel(x1, x2, sigma(j)));
  %train_predictions(i,j) = svmPredict(model, X);
  train_predictions = svmPredict(model, X);
  train_error(i,j) = mean(double(train_predictions ~= y));
  %val_predictions(i,j) = svmPredict(model, Xval);
  val_predictions = svmPredict(model, Xval);
  val_error(i,j) = mean(double(val_predictions ~= yval));
 end
end

final_val_error = val_error(1,1);
final_val_x = 0;
final_val_y = 0;
for i=1:length(C)
 for j=1:length(sigma)
  if final_val_error > val_error(i,j)
   final_val_error = val_error(i,j);
   final_val_x = i;
   final_val_y = j;
  end
 end
end
disp(final_val_error);
disp(final_val_x);
disp(final_val_y);
C = C(final_val_x);
sigma = sigma(final_val_y);


% =========================================================================

end

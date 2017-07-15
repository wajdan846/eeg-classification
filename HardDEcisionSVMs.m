
% accuracy 30/50->37/50 using SVM classifier for F60 and F20
% classification

clc
clear all
%% USING Matlab
% Load the data and select features for classification
     
     dir('D:\4th yr.....7th semester\AI\project');
     load f20_features.mat
     load f60_features.mat
     
    F20_features=f20_features(1:50,:);
    F60_features=f60_features(1:50,:);

      X = [F20_features;F60_features];
      Y = [repmat(1,50,1);repmat(-1,50,1)];
      P = cvpartition(Y,'Holdout',0.50);
      Xtr = X(P.training,:); Ytr = Y(P.training,:);
      Xte = X(P.test,:);  Yte = Y(P.test,:);
     svmStruct = svmtrain(Xtr,Ytr,'showplot',true);

      
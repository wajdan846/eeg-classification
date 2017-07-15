% accuracy (30->39)/50 using KNN classifier for F60 and F20
% classification
clc
clear all
dir('D:\4th yr.....7th semester\AI\project');
     load f20_features.mat
     load f60_features.mat
     load SVMmodelForF20and60Classification.mat
     
      F20_features=f20_features(1:50,:);
      F60_features=f60_features(1:50,:);
      
       X = [F20_features;F60_features];
      Y = [repmat(1,50,1);repmat(-1,50,1)];
      P = cvpartition(Y,'Holdout',0.50);
      Xtr = X(P.training,:); Ytr = Y(P.training,:);
      Xte = X(P.test,:);  Yte = Y(P.test,:);
      
      %svmStruct = svmtrain(Xtr,Ytr,'showplot',true);
          
      C = svmclassify(svmStruct,Xte,'showplot',true);
      errRate = sum(Yte~= C)/P.TestSize  %mis-classification rate
      conMat = confusionmat(Yte,C) % the confusion matrix
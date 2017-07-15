
% accuracy (18->28)/50 using KNN classifier for F60 and F20
% classification

clc
clear all

     dir('D:\4th yr.....7th semester\AI\project');
     load f20_features.mat
     load f60_features.mat
F20_features=f20_features(1:50,:);
F60_features=f60_features(1:50,:);
my_data_set = [F60_features;F20_features];
group = [repmat(1,50,1);repmat(-1,50,1)];
[my_data_set,group1] = shufflerows(my_data_set,group);

test  = [];
train = [];
labeltst=[];
labeltrain =[];
for i = 1:50
 labeltst = [labeltst;group1(i)];
 test = [test;my_data_set(i)];
end
for i = 51:100
 labeltrain = [labeltrain;group1(i)];
 train = [train;my_data_set(i)];
end

outputk2 = [];
for i=1:50
    testSample = test(i,:);   
    outputk2 = [outputk2 knearest(3,testSample,train,labeltrain)];

end
outputk2 = transpose(outputk2);
cor2=0;
for i=1:50
    if(outputk2(i) == labeltst(i))
        cor2=cor2+1;
    end
end
cor2 = cor2/50;

confusionUsingKnn = confusionmat(labeltrain,outputk2)
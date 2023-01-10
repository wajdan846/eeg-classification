# Classification of eeg signals using knn and svm based upon significant features
## eeg-classification 
The main aim of this code is to extract a set of characteristic feature from time series data and create feature matrix of all the segmented signals which can be further used for classification or clustering purpose.

This code is loading a Matlab file called "Fast20MVCCat.mat" which contains the variable "Fast20" and "F20_Epoch_Start". Then it's extracting certain features from "Fast20" and grouping them based on the "F20_Epoch_Start" values. The code first loads the data and the epoch information from the "Fast20MVCCat.mat" file, then it loops through the data and based on the values in "F20_Epoch_Start" array, it creates segments of the data of length 2500 and stores them in "signal_epochs" matrix. After that, for each segment, it creates a feature vector of size 6 by extracting different properties of the signal like Slope of the initial positive phase, Amplitude of the most negative value, Mean amplitude and so on. These Feature vectors are stored in "F20_features" matrix.

# features
EEG signals from motor cortex comprises of v shaped patterns wheredecaying regions specifies intention whereas rising line shows 
execution of the respective muscle,
based on this the two EEG sample types belong to right and left ankle movement and following are the features

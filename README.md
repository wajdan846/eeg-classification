# eeg-classification
Classification of eeg signals using knn and svm based upon significant features
# features
EEG signals from motor cortex comprises of v shaped patterns wheredecaying regions specifies intention whereas rising line shows 
execution of the respective muscle,
based on this the two EEG sample types belong to right and left ankle movement and following are the features as specified in the code:-

    FeatureVector(1) = p(2);    %% Slope of the initial positive phase (after 100 ms before Peak Positivity)
    FeatureVector(2) = p(1);    % Slope of the initial negative phase (until 100 ms before Peak Negativity)
    FeatureVector(3) = min(y);  % Amplitude of the most negative value in the interval [-0.5 to -0.1] before Peak Negativity
    FeatureVector(4) = mean(y); % Mean amplitude in the interval [-1.05 to -0.05] before Peak Negativity
    y = y(end-10:end);
    x = 1:length(y);
    p = polyfit(x,y,1);
    FeatureVector(5) = p(1);    % Slope of the segment in the interval [-0.6 to -0.1 s] according to Peak Negativity

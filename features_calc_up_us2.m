% 
 clc
 close all
 clear all
dir('D:\4th yr.....7th semester\AI\project');
load Fast60MVCCat.mat
epoch=F60_Epoch_Start;
data = Fast60;
lap_band_dat= data;

i=1;
s12=1;
s13=1;
len=1;
for s21=1:length(data)
if (i<=length(epoch))
	if(s21==epoch(i))
	 len=epoch(i)+2500;
	 s13=1;
     if(len<=length(data))
		    for s12=s21:len
		      signal_epochs(i,s13)=lap_band_dat(s12);
		      s13=s13+1;
            end
	  i=i+1;
     end 
    end
end
end

for k=1:length(epoch)
signal=signal_epochs(k,:);
m = size (signal, 1);
Feature_Vector = zeros (m, 6);

for i = 1:1:m
    y = signal (i, :);
    x = 1:length(y);
    p = polyfit(x,y,1);
    FeatureVector(1) = p(2);
    FeatureVector(2) = p(1);    % Slope of the initial negative phase (until 100 ms before Peak Negativity)
    FeatureVector(3) = min(y);  % Amplitude of the most negative value in the interval [-0.5 to -0.1] before Peak Negativity
    FeatureVector(4) = mean(y); % Mean amplitude in the interval [-1.05 to -0.05] before Peak Negativity
    y = y(end-10:end);
    x = 1:length(y);
    p = polyfit(x,y,1);
    FeatureVector(5) = p(1);    % Slope of the segment in the interval [-0.6 to -0.1 s] according to Peak Negativity

        FeatureVector(6) = min(y(end-10:end-1)); % Largest amplitude in the interval [-0.5 to -0.05 s] according to Peak Negativity
    

    Feature_Vector (i, :) = FeatureVector;
end

F60_features(k,:) = Feature_Vector;
end

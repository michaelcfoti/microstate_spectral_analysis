clear; clc;close all; 

addpath(genpath('./functions'));

load('data/sample_data.mat');

param.fs = 256;
param.fmax = 35;
param.nCluster = 5;

printInputSummary(GFP, param);

conditions = {'unshuffled','gfp_shuffled', 'labels_shuffled'};
validateCondition(conditions);
microstateLabels = arrayfun(@(x) char('A' + x - 1), 1:param.nCluster, 'UniformOutput', false);


% ======== Example running all conditions ========
for i = 1:numel(conditions)

    fprintf('\n Running: %s', conditions{i}) 
    F{i} = lombScargleSpectrum(GFP, labels, conditions{i}, param);

    % Users should ideally use FOOOF, but here we use a simple log-log
    % linear fit to calculate the scaling exponent
    meanSlope(i,:) = computeSlope(F{i}, [1 8]);
    printSlope(meanSlope(i,:), microstateLabels, param)   

    plotMicrostateSpectra(F{i},microstateLabels, param.nCluster, conditions{i});

end


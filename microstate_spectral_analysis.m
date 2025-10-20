clear; clc;close all; 

addpath(genpath('./functions'));

load('data/sample_data.mat');

param.fs = 256;
param.fmax = 35;
param.nCluster = 5;

printInputSummary(GFP, param);

conditions = {'unshuffled', 'gfp_shuffled', 'labels_shuffled'};
titles = {'Unshuffled', 'GFP shuffled', 'Labels shuffled'};
microstateLabels = arrayfun(@(x) char('A' + x - 1), 1:param.nCluster, 'UniformOutput', false);

% ======== Example running all conditions ========
for i = 1:numel(conditions)
    F{i} = lombScargleSpectrum(GFP, labels, conditions{i}, param);
    meanSlope(i,:) = computeSlope(F{i}, [1 8]);
    plotMicrostateSpectra(F{i},microstateLabels, param.nCluster, titles{i});
end
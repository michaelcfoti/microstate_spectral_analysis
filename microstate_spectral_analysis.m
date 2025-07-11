clear; clc; close all;
addpath(genpath('./functions'));

load('data/sample_data.mat');

param.fs = 256;
param.fmax = 35;
param.nCluster = 5 ;

printInputSummary(GFP, param);

conditions = {'unshuffled', 'gfp_shuffled', 'labels_shuffled'};
titles = {'Unshuffled', 'GFP shuffled', 'Labels shuffled'};
S = struct();  % Struct array to hold results
microstateLabels = arrayfun(@(x) char('A' + x - 1), 1:param.nCluster, 'UniformOutput', false);

% ======== Example running all conditions ========
for i = 1:numel(conditions)
    F{i} = lombScargleSpectrum(GFP, labels, conditions{i}, param);
    
    meanSlope(i,:) = computeSlope(F{i}, [1 8]);
  
    plotMicrostateSpectra(F{i}, param.nCluster, titles{i});
end


%% HELPER FUNCTION 
function meanSlope = computeSlope(F, freqRange)

nCluster = numel(F.po);
nEpo = size(F.po{1}, 1);
slope = NaN(nCluster, nEpo);

for i = 1:nCluster
    for j = 1:nEpo
        freq = F.fr{i}(j,:);
        power = F.po{i}(j,:);
        valid = freq >= freqRange(1) & freq <= freqRange(2);

        if sum(valid) > 2
            p = polyfit(log10(freq(valid)), log10(power(valid)), 1);
            slope(i, j) = abs(p(1));
        end
    end

end
meanSlope = mean(slope,2);

end




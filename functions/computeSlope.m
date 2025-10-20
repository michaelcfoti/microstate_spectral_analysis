function meanSlope = computeSlope(F, freqRange)

% computeSlope: mock slope calculation using a simple linear regression.
% Users should ideally use FOOOF, but here we use a simple log-log linear fit
% to estimate the 1/f spectral slope within a given frequency range.


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
meanSlope = mean(slope,2, 'omitnan');

end
function [F]= lombScargleSpectrum(GFP, labels, analysis, param)

if isempty(GFP)
    F.po = {};
    F.fr = {};
    return;
end

[nEpo, nSamples] = size(GFP);

% parameters
fmax = param.fmax;
fs = param.fs;
nCluster = param.nCluster;

% frequency vec
Nfrac = floor(nSamples/2) + 1;
freq = (0:Nfrac-1) * (fs / nSamples);
freq = freq(1:find(freq >= fmax, 1, 'first'));

%time vec
time = (0:nSamples-1) / fs;

for i = 1:nCluster
    F.po{i} = NaN(nEpo, length(freq));
    F.fr{i} = NaN(nEpo, length(freq));
end

% Lomb-Scargle spectrum
for i = 1:nCluster
    for j = 1:nEpo

        GFPepo = GFP(j,:);
        labelEpo = labels(j,:);

        [GFPepo, idx] = processMicrostate(GFPepo, labelEpo, i, analysis);

        if ~isempty(idx)
            [pow, fre] = plomb(GFPepo(idx), time(idx), freq);
            F.po{i}(j,:) = pow;
            F.fr{i}(j,:) = fre;
        end
    end
end

end


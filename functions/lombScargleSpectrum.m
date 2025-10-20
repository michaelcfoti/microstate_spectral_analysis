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
             % [pow, fre] = plomb(GFPepo(idx), time(idx), freq);
            pow = lombScargle(GFPepo(idx), time(idx), freq);

            F.po{i}(j,:) = pow;
            F.fr{i}(j,:) = freq;
        end
    end
end

end


%%
% function P = lombScargle(x, t, f)
% 
%     if ~isvector(x) || ~isvector(t) || ~isvector(f)
%         error('Inputs x, t, and f must all be vectors.');
%     end
% 
%    % column-ize
%     x = x(:);
%     t = t(:);
%     f = f(:);
% 
%     % de-mean the data
%     x = x - mean(x);
% 
%     % angular frequencies (row)
%     omega = 2*pi*f.';            % 1×M
% 
%     % precompute ω t (N×M)
%     wt = t * omega;              % (N×1)*(1×M) -> N×M
% 
%     % compute  Tau
%     two_wt = 2*wt;
%     S2 = sum(sin(two_wt), 1);    % 1×M
%     C2 = sum(cos(two_wt), 1);    % 1×M
%     tau = atan2(S2, C2) ./ (2 * omega);
% 
%     % compute Af and Bf
%     wtau = omega .* tau;        
%     wt_tau = wt - wtau;          
%     c = cos(wt_tau);             
%     s = sin(wt_tau);            
%     Af = 1./sqrt(sum(c.^2, 1));        
%     Bf = 1./sqrt(sum(s.^2, 1));        
% 
%     % projections
%     Xc = sum(x .* c, 1);         % 1×M
%     Xs = sum(x .* s, 1);         % 1×M
% 
%     % LombScargle equation
%     P = 0.5 * (Af.^2 .* Xc.^2 + Bf.^2 .* Xs.^2).';
% end
% 

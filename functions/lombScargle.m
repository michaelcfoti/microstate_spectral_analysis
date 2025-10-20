function P = lombScargle(x, t, f)
% implementation of LombScargle
%
% INPUTS:
%     - x: signal ( in this case the Global field power)
%
%     - t:  time vector
%
%     - f: frequency vector 
%       
% OUTPUTS:
%     - P: Lomb Scargle Power 


    if any(isnan(x)) || any(isnan(t)) || any(isnan(f))
        error('Inputs cannot contain NaN values.');
    end

    if ~isvector(x) || ~isvector(t) || ~isvector(f)
        error('Inputs must be vectors.');
    end
    if numel(x) ~= numel(t)
        error('signal and time must have the same length.');
    end
    
    isIncreasing = all(diff(t) > 0);
    if ~ isIncreasing
        error('Time input must ascending');
    end

   % column-ize
    x = x(:);
    t = t(:);
    f = f(:);

    % de-mean the data
    x = x - mean(x);

    omega = 2*pi*f.';         

    % precompute ω t (N×M)
    wt = t * omega;           

    % compute  Tau
    two_wt = 2*wt;
    S2 = sum(sin(two_wt), 1);    
    C2 = sum(cos(two_wt), 1);  
    tau = atan2(S2, C2) ./ (2 * omega);

    % compute Af and Bf
    wtau = omega .* tau;        
    wt_tau = wt - wtau;          
    c = cos(wt_tau);             
    s = sin(wt_tau);            
    Af = 1./sqrt(sum(c.^2, 1));        
    Bf = 1./sqrt(sum(s.^2, 1));        

    % projections
    Xc = sum(x .* c, 1);         
    Xs = sum(x .* s, 1);    

    % LombScargle equation
    P = 0.5 * (Af.^2 .* Xc.^2 + Bf.^2 .* Xs.^2).';
end


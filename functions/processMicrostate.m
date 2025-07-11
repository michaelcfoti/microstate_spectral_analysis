function [GFPepo, idx] = processMicrostate(GFPepo, labelEpo, i, analysis)
switch analysis
    case 'unshuffled'
        idx = find(labelEpo == i);
    case 'gfp_shuffled'
        shuffledEpoGFP = shuffleGFP(GFPepo, labelEpo);
        idx = find(labelEpo == i);
        GFPepo = shuffledEpoGFP;
    case 'labels_shuffled'
        labelEpoShuffled = shuffleLabels(GFPepo, labelEpo);
        idx = find(labelEpoShuffled == i);
    otherwise
        error('Unknown analysis type: %s', analysis);
end
end

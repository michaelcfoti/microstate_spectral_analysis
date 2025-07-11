
function shuffleEpoGFP = shuffleGFP(GFPepo, labelEpo)

labelsName = unique(labelEpo);
labelsName(labelsName == 0) = [];

for i = 1:length(labelsName)
    idx = find(labelEpo == labelsName(i));
    shuffleEpoGFP(idx) = GFPepo(idx(randperm(length(idx))));
end
end

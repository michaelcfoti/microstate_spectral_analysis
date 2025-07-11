function labelEpoShuffled = shuffleLabels(GFPepo, labelEpo)
shuffleIdx = randperm(length(GFPepo));
labelEpoShuffled = labelEpo(1,shuffleIdx);
end
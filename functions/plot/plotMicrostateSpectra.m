function plotMicrostateSpectra(F,xLabels, nCluster, condition)

    switch condition
        case 'unshuffled',      t = 'Unshuffled';
        case 'gfp_shuffled',    t = 'GFP shuffled';
        case 'labels_shuffled', t = 'Labels shuffled';
    end
    
    fig = figure;
    set(fig, 'Position', [1 992 1199 211]);

    for p = 1:nCluster
        subplot(1, nCluster, p);
        freq = F.fr{p};
        meanPow = mean(F.po{p}, 1, 'omitnan');

        plot(log(freq), log(meanPow), 'k'); hold on;
        formatPlot();
        title(['Microstate ', xLabels{p}]);
    end

    sgtitle(t);
end


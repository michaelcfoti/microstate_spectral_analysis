function plotMicrostateSpectra(F, nCluster, mainTitle)

    xLabels = numberToAlphabet(nCluster);
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

    sgtitle(mainTitle);
end


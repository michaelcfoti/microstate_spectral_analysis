
function formatPlot()
ax = gca;
ax.Color = 'none';
ax.XTick = log([1 2 4 8 16 32]);
ax.XTickLabel = {'1', '2', '4', '8', '16', '32'};
ax.XTickLabelRotation = 0; 

xlabel('Frequencies (log)');
ylabel('Power (dB)');
 ylim([-5 6]);
end

function printSlope(meanSlope, microstateLabels, param)
fprintf('\n Scaling Exponent: ');
for p = 1:param.nCluster
    fprintf('%s = %.2f', microstateLabels{p}, meanSlope(p));
    if p < param.nCluster
        fprintf(' | ');
    else
        fprintf('\n');
    end
end

end
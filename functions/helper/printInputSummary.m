function printInputSummary(GFP, param)

    fprintf('  GFP Data:\n');
    fprintf('    - %d epochs\n', size(GFP, 1));
    fprintf('    - %d samples per epoch (%.2f seconds @ %.2f Hz)\n\n', ...
        size(GFP, 2), size(GFP, 2) / param.fs, param.fs);

    fprintf('  Label Sequences:\n');
    fprintf('    - Aligned with GFP (same size: %d x %d)\n\n', size(GFP, 1), size(GFP, 2));

    fprintf('  Microstate Analysis:\n');
    fprintf('    - %d microstates (clusters)\n', param.nCluster);
end

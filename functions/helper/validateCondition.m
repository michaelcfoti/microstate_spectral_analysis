function conditions = validateCondition(conditions)

    validConditions = {'unshuffled', 'gfp_shuffled', 'labels_shuffled'};

    % make sure input is a cell array of char or string
    if ischar(conditions)
        conditions = {conditions};
    elseif isstring(conditions)
        conditions = cellstr(conditions);
    end

    % find invalid entries
    bad = setdiff(conditions, validConditions);

    if ~isempty(bad)
        error('validateConditions:UnknownCondition', ...
              'Invalid condition(s): %s\nValid options are: %s', ...
              strjoin(bad, ', '), strjoin(validConditions, ', '));
    end
end

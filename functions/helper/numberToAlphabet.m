function labels = numberToAlphabet(N)
    labels = strings(1, N);
    for i = 1:N
        idx = i;
        label = "";
        while idx > 0
            idx = idx - 1;
            rem = mod(idx, 26);
            label = string(char(65 + rem)) + label;
            idx = floor(idx / 26);
        end
        labels(i) = label;
    end
end
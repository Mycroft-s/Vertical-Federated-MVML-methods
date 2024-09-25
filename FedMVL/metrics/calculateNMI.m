function nmi = calculateNMI(predictedLabels,trueLabels)
    [~, ~, nmi] = compute_information_measures(trueLabels, predictedLabels);
end



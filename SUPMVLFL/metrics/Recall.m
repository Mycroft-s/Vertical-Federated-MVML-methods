function recall = Recall(Pre_Labels, test_target)
%RECALL Calculate the recall for multi-label classification
%   Pre_Labels: predicted labels matrix
%   test_target: ground truth labels matrix

truePositives = sum(sum(test_target == 1 & Pre_Labels == 1));
actualPositives = sum(sum(test_target == 1));
recall = truePositives / actualPositives;
end



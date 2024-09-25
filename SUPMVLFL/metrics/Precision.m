function precision = Precision(Pre_Labels,test_target)

%Computing the hamming loss
%Pre_Labels: the predicted labels of the classifier, if the ith instance belong to the jth class, Pre_Labels(j,i)=1, otherwise Pre_Labels(j,i)=-1
%test_target: the actual labels of the test instances, if the ith instance belong to the jth class, test_target(j,i)=1, otherwise test_target(j,i)=-1

 truePositives = sum(sum(test_target == 1 & Pre_Labels == 1));
 predictedPositives = sum(sum(Pre_Labels == 1));
     precision = truePositives / predictedPositives;
end


function f1 = F1(precision, recall)
%F1 此处显示有关此函数的摘要
%   此处显示详细说明
if isnan(precision) || isnan(recall)
    f1 = 0;
else
    f1 = 2 * ((precision * recall) / (precision + recall));
end
end


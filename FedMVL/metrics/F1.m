function f1 = F1(precision, recall)
%F1 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
if isnan(precision) || isnan(recall)
    f1 = 0;
else
    f1 = 2 * ((precision * recall) / (precision + recall));
end
end


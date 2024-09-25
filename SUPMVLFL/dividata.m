function [X_train, Y_train,  X_test, Y_test,index] = dividata(X, Y,  ratio)
%SPLIT_DATA 用于将数据集分割成训练集和测试集
%   输入：
%       X: 特征矩阵，每一行为一个样本，每一列为一个特征
%       Y: 标签向量，每个元素为一个样本的类别标签
%       ratio: 训练集所占比例
%   输出：
%       X_train: 训练集的特征矩阵
%       Y_train: 训练集的标签向量
%       X_test: 测试集的特征矩阵
%       Y_test: 测试集的标签向量

% 获取数据集的样本数量和特征数量
m = size(X, 1);
n = size(Y, 1);

% 将数据集的样本和标签随机打乱
perm = randperm(m);
X = X(perm, :);
Y = Y(:, perm);
index=size(m,1);
% 计算训练集的大小
m_train = floor(m * ratio);


vector_length = m;  % 这里可以自定义向量长度

% 计算1和0的数量
num_ones = round(vector_length * ratio);
num_zeros = vector_length - num_ones;

% 生成向量
index = [ones(1, num_ones), zeros(1, num_zeros)];


% 获取训练集和测试集的样本和标签
X_train = X(1:m_train, :);
Y_train = Y(:,1:m_train);
X_test = X(m_train+1:end, :);
Y_test = Y(:,m_train+1:end);
fprintf('finished divide\n');
end


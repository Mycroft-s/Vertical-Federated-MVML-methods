function [multi_view_data] = datachange(multi_view_data)
% 假设 multi_view_data 是一个 cell 数组，其中每个 cell 包含一个视图的数据
num_views = length(multi_view_data);

% 极小值，用于添加到对角线位置
epsilon = 1e-10;

% 遍历每个视图
for i = 1:num_views
    % 获取当前视图
    view_data = multi_view_data{i};
    
    % 删除全为零的列
    non_zero_cols = any(view_data, 1);
    view_data = view_data(:, non_zero_cols);
    
    % 获取当前视图的大小
    [num_rows, num_cols] = size(view_data);
    
    % 给对角线位置加上极小值
    min_dim = min(num_rows, num_cols);
    for j = 1:min_dim
        view_data(j, j) = view_data(j, j) + epsilon;
    end
    
    % 将调整后的视图数据存回 multi_view_data
    multi_view_data{i} = view_data;
end

end


function map = calculateMAP(averagePrecisions)
%averagePrecisions 是一个包含每个查询的平均精度的向量。
    map = mean(averagePrecisions);
end


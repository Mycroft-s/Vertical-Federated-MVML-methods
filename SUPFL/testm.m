function Z = testm(X,W,para,Y)
%TEST 此处显示有关此函数的摘要
%   此处显示详细说明
m=length(X);
for cc=1:m
[n,d{cc}]=size(X{cc,1});
end
y=size(Y,1);
Lk=para.Lk;

%initialize
Zk=cell(m,1);

for xx=1:m
    Zk{xx}=rand(n,y);
end
Z=rand(n,y);

maxIter=1e-8; score=0; compare=1; score_old=0; 
for k=1:m
        Z=Z+X{k}*W{k};
end

end





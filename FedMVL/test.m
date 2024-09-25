function Z = test(X,W,para,Y)
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
while compare>=maxIter
    Zkall=0;
    for kk=1:m
        Zkall=Zkall+Lk*Zk{kk};
    end
    Z=Zkall/ (m*Lk);
    
    for k=1:m
        Zk{k}=(X{k}*W{k}+Lk*Z)/(1+Lk);
    end
    for i=1:m
    score=score+norm(X{k}*W{k}-Zk{k},'fro')^2;
    end
    score=score+Lk*norm(Zk{k}-Z,'fro')^2;
    %判断是否收敛
     compare=abs(score-score_old);
            score_old=score;
            if(compare<=(1e-4)*score) 
                    break;
            end
end



end


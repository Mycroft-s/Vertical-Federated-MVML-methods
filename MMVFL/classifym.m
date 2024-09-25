function [score,W] = classifym(X,Y,para)
%CLASSIFY 此处显示有关此函数的摘要
%   此处显示详细说明
m=length(X);
for cc=1:m
[n,d{cc}]=size(X{cc,1});
end
y=size(Y,1);
Y=Y';
b=para.b; Lk=para.Lk; new=para.new; e=para.e;
%initialize
Zk=cell(m,1);
W=cell(m,1);
A=cell(m,1);
for xx=1:m
    Zk{xx}=rand(n,y);
    W{xx}=rand(d{xx},y);
    A{xx}=zeros(d{xx},d{xx});
end
Z=rand(n,y);
time=0;
maxIter=1e-8; score=0; compare=1; score_old=0; scoreX_old=0;comparel=1; 
while compare>=maxIter
%     fprintf("%d\n",time);
%     time=time+1;
    scoreX=0;
    scoreS=0;
    for k=1:m
         %update Ak
            for i=1:d{k}
                  A{k}(i,i)= 1/(2*(norm(W{k},2)+e));
            end
            %update Wk
            W{k} = pinv(X{k}'*X{k} + b*A{k}) * (X{k}'*Zk{k});
%            W{k}=2* W{k}+2* X{k}'*(X{k}*W{k}-Zk{k}); 
            norms = sum(abs(W{k}),2);
            norms = max(norms,1e-30);
            W{k}=abs(W{k})./repmat(norms,1,size(W{k},2));
             L21=0;
            for qq=1:m
            scoreX=scoreX+norm(X{k}*W{k}-Zk{k},'fro')^2; 
            L21=L21+norm(W{k},2);
            end
            %如何表示2，1范数
             for ff=1:m
                 for i=1:d{k}
                 L21=L21+norm(W{k}(i,:));
                 end
             end
            L21 = sum(sqrt(sum(W{k}.^2, 2)));
            scoreX=scoreX+b*L21;
            %update Zk
            if(k==1)
                Zk{k}=(X{k}*W{k}+Lk*Z+new*Y)/(1+Lk+new);
         norms = sum(abs(Zk{k}),2);
         norms = max(norms,1e-30);
         Zk{k}=abs(Zk{k})./repmat(norms,1,size(Zk{k},2));
            else
         Zk{k}=(X{k}*W{k}+Lk*Z)/(1+Lk);
         norms = sum(abs(Zk{k}),2);
         norms = max(norms,1e-30);
         Zk{k}=abs(Zk{k})./repmat(norms,1,size(Zk{k},2));
            end 
    end
    Zkall=0;zz=0;
    for kk=1:m
        Zkall=Zkall+Lk*Zk{kk};
    end
    %update Z
    Z=Lk*Zkall/ (m*Lk);
    norms = sum(abs(Z),2);
    norms = max(norms,1e-30);
    Z=abs(Z)./repmat(norms,1,size(Z,2));
     for as=1:m
        zz=zz+norm(Zk{as}-Z,'fro')^2;
    end
    scoreS=scoreS+Lk*zz+new*norm(Zk{1}-Y,'fro')^2;
    score=scoreS+scoreX;
    %判断是否收敛
    compare=abs(score-score_old);
            score_old=score;
            if(compare<=(1e-8)*score) 
                    break;
            end
end
   
    
end





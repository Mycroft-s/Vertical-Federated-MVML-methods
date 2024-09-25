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
            W{k}= (X{k}'*X{k}+b*A{k})^(-1)*(X{k}'*Y); 
%            W{k}=2* W{k}+2* X{k}'*(X{k}*W{k}-Zk{k}); 
            norms = sum(abs(W{k}),2);
            norms = max(norms,1e-30);
            W{k}=abs(W{k})./repmat(norms,1,size(W{k},2));
             L21=0;
            for qq=1:m
            scoreX=scoreX+norm(X{k}*W{k}-Y,'fro')^2; 
            L21=L21+norm(W{k},2);
            end
%             如何表示2，1范数
%             for ff=1:m
%                 for i=1:d{k}
%                 L21=L21+norm(W{k}(i,:));
%                 end
%             end
            scoreX=scoreX+b*L21;
         
            
            
     
    
end
   score=scoreX;
    %判断是否收敛
    compare=abs(score-score_old);
            score_old=score;
            if(compare<=(1e-6)*score) 
                    break;
            end
    
end





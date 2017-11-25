%总共需要求400对
%求解每一对语音信号 t 和 r 最短距离
%  均为两个 150 x 5 的 矩阵
function dist = dtw(t,r)
n = size(t,2);%test的帧数
m = size(r,2);%ref的帧数
% 两帧匹配距离矩阵

d = zeros(n,m);
for i = 1:n
    for j = 1:m
%         size(t(:,i))
%         size(r(:,j))
        
        d(i,j) = sum((t(:,i)-r(:,j)).^2);
    end
end

% 累积距离矩阵
D = ones(n,m) * realmax;
D(1,1) = 0;
% 动态规整
for j=2:m
    D3=D(1,j-1);
    D2=inf;
    D1=inf;
    D(1,j) = d(1,j) + min([D1,D2,D3]);
end
for i = 2:n
    D1=inf;
    D2=inf;
    D3=inf;
    for j = 1:m
        if i>1
        D1 = D(i-1,j);
          if  j>1 
            D2 = D(i-1,j-1);
          end
          end
        
        
        if j>1
            D3 = D(i,j-1);
       
        end
        
        D(i,j) = d(i,j) + min([D1,D2,D3]);
    end
    end
    dist = D(n,m);
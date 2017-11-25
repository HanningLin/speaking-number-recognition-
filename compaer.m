 function result=compaer(t)
%     
% t=ref4_6;

 %—µ¡∑ºØ
N1=9;
N2=9;
%≤‚ ‘ºØ
%tsize=1;
tempdist(10,10)=zeros();
tempd(1,10)=zeros();


for i=0:N1
    for j=0:N2
        eval(['global ','ref',num2str(i),'_',num2str(j+1)]);%%i is num
        i
        j
        tempdist(i+1,j+1)=dtw(t,eval(['ref',num2str(i),'_',num2str(j+1)]));       
    end
end




% for i=1:10
%  for j=1:10
%     tempd(1,i)=tempd(1,i)+tempdist(i,j);
%  end
% end



% [M,I] = min(tempdist(:));
% [I_row, I_col]=ind2sub(size(tempdist),I); 
 [M,I] = min(tempdist(:));
 M;
 [I_row, I_col]=ind2sub(size(tempdist),I);
I_row;
I_col;
result=I_row-1;

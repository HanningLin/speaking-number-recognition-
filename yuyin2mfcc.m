N1=119;
N2=9;
for i=0:N1
    for j=0:N2
%         i
%         j
    %str=eval(['cut',num2str(i),'_',num2str(j)]);
     str=database(:,i+1,j+1);%j is num
      eval(['ref',num2str(j),'_',num2str(i+1),'=mfcc(str);']);
    end
end
  
 
database=zeros(16000,120,10);
for i=1:10
    database(:,:,i)=eval(['data',num2str(i-1),';']);
end
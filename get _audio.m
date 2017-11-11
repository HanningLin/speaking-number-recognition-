data_total=zeros(16000,10,10);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%READ ME
%本程序按顺序将0-10数字每个记录10遍，每次朗读1个数字，一次记录2秒。
%最终数据会存放在名为data_total的16000*10*10的矩阵中,
%16000为音频数据长度，第2个10为同一数字的次数，第3个10为不同数字，1-10分别为数字0-9
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rec9_1 = audiorecorder;
disp('本程序按顺序将0-10数字每个记录10遍，每次朗读一个数字，一次记录2秒，请按照下面指示进行操作')
       pause(5);
for i=1:10
    for j=1:10
       
       disp(['请准备朗读数字']) 
       pause(1);
       disp(['朗读数字',num2str(i-1)])
        recordblocking(rec9_1, 2);
        disp('End of Recording.');
        data_total(:,j,i) = getaudiodata(rec9_1);
        sound(data_total(:,j,i));
        plot(data_total(:,j,i));
        pause(2);
    end
end
  
% 回放录音数据

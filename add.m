  rec9_1 = audiorecorder;
disp('please speak a number')
       recordblocking(rec9_1, 2);
        disp('End of Recording.');
        database(:,i+1,j+1)= getaudiodata(rec9_1);
         
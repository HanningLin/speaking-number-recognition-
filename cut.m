function new_audio=cut(audio)
i=1;
j=size(audio);
j1=j(1);
j=j1;
ave=mean(abs(audio));
start=i;
ending=j;
while(i<j1)
        if abs(audio(i))>ave;
                start=i;
                break
        end
      i=i+1;
end

%j=i;
while(j>0)
    if audio(j)>ave
            ending=j;
            break
    end
       j=j-1;
  
    
end
new_audio=audio(start:ending);
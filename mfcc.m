%%%%%assignment 2
%%% lin hanning
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%1, 预处理
% function mfcc_14_real=solve_mfcc()
%%%%%%%%1，1预加重
function [mfcc_real]=mfcc(data)
% % data_cut=cut(data);
data_cut=data;
% size(data_cut)
data_cut=data_cut/(sum(abs(data_cut))/size(data,1));

%plot(data_cut);
%sound(data_cut);
size_cut=size(data_cut);
size_cut=size_cut(1);
for(i=1:1:size_cut)
    h1(i,1)=1-0.97/i;data;
end
dft_cut=fft(data_cut);
dft_cut_after=dft_cut.*h1;
cut_afterjiazhong=ifft(dft_cut_after);
%%%%%%%%1,2 分帧，加窗
%%%%%%%%%%1,2,1hamming窗
zhen_size=100;
for n=1:1:zhen_size
    w(n,1)=0.54-0.46*cos(2*pi*n/zhen_size);%%一帧长zhen_size
end
%%%%%%%%%%1,2,2一帧zhen_size，分zhen_num帧
zhen_num=floor(size_cut/(zhen_size-10));
zhen(zhen_size,zhen_num)=zeros();
for n=2:1:zhen_num
    zhen_t(:,n-1)=cut_afterjiazhong((zhen_size-10)*(n-1)-10+1:(zhen_size-10)*n,1).*w; 
end
E_zhen=zhen_t.^2;
E_zhen=sqrt(real(E_zhen).^2+imag(E_zhen).^2);

% size(E_zhen)
% zhen_num
%%%temp
E_zhen=ones(1,zhen_size)*E_zhen;

% size(E_zhen)
% (E_zhen(1)==0)
% plot(E_zhen);
% starting=1;
% ending=zhen_num;
for n=1:zhen_num
    if E_zhen(n)>0.001
        starting=n;
        break
    end
end
for m=1:zhen_num
    if E_zhen(zhen_num-m)>0.001
        ending=zhen_num-m;
        break
    end
end
%
zhen=zhen_t(:,starting:ending);
zhen_num=ending+1-starting;
E_zhen_dt=E_zhen(:,starting:ending);
% size(E_zhen_dt)
%%%%2,每一帧fft
for i=1:1:zhen_num
    X(:,i)=fft(zhen(:,i));
end
%%%%4,mel滤波器
N=22;%%滤波器个数
bank=melbankm(N,zhen_size,8000,0,0.5,'m');
ban=full(bank);
ban=ban/max(ban(:));
%%%%3,谱线能量
E_size=size(ban);
E_size=E_size(2);
for(i=1:1:zhen_num)
    E(:,i)=X(1:E_size,i).^2;
    E_real=sqrt(real(E).^2+imag(E).^2);
   
end
%  size(E_real)

%%%算系数
%%%%%%%%4，3求能量
S=bank*E;
 S_real=sqrt(real(S).^2+imag(S).^2);
 
%%%%5，求DCT-MFCC系数
%mfcc n=14,22个mel滤波器
 m=0:1:N-1;

for n=1:3
    mfcc=sqrt(2/N)*(cos(pi*n*(2*m-1)/(2*N))*log(S(m+1,:)));
    mfcc_real(n,:)=sqrt(real(mfcc).^2+imag(mfcc).^2);
end
% size(S_real)
% size(mfcc_real)
% mfcc_real(3,:)=E_zhen_dt;
% for n=1:size(mfcc_real,1)
%     mfcc_real(n,:)=mfcc_real(n,:)/max(mfcc_real(n,:));
% end
% mfcc(1,:)=mfcc(1,:)/max
% temp=size(mfcc_real);
% temp=temp(2);
% mfcc_real=mfcc_real(:,1:(temp-1));

% mfcc_r=mfcc_real(:,:)';


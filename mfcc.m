%%%%%assignment 2
%%% lin hanning
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%1, 预处理
% function mfcc_14_real=solve_mfcc()
%%%%%%%%1，1预加重
function [mfcc_14,mfcc_14_real]=mfcc(cut)
size_cut=size(cut);
size_cut=size_cut(1);
for(i=1:1:size_cut)
    h1(i,1)=1-0.97/i;
end
dft_cut=fft(cut);
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
    zhen(:,n-1)=cut_afterjiazhong((zhen_size-10)*(n-1)-10+1:(zhen_size-10)*n,1).*w; 
end
%%%%2,每一帧fft
for i=1:1:zhen_num
    X(:,i)=fft(zhen(:,i));
end
%%%%4,mel滤波器
N=22%%滤波器个数
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


%%%算系数
%%%%%%%%4，3求能量
S=bank*E;
 S_real=sqrt(real(S).^2+imag(S).^2);
%%%%5，求DCT-MFCC系数
%mfcc n=14,22个mel滤波器
m=1:1:N;
mfcc_14=sqrt(2/N)*(cos(pi*14*(2*m-1)/2*n)*log(S(m,:)));
mfcc_14_real=sqrt(real(mfcc_14).^2+imag(mfcc_14).^2);

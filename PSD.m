function PSD(y, m, type)
%PSD: this function plot the psd of the input y and put it in mth order
%for example if we hade 4 signals and we want to plot the psd of them:
%psd(signal1,1,title); psd(signal2,2); psd(signal3,3); psd(signal4,4);

%get the psd using pwelch matlab build in function
pxx = pwelch(y);
%plot the psd 
subplot(3,2,m);
plot(10*log10(pxx)); grid on
%you can comment the following line of code 
axis([0 15 -50 50]);
title(type);
end


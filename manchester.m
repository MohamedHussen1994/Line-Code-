function y = manchester(h, m)
%manchester: this function plot the manchester line code for the input bit stream h and
%put them in mth order.
%example: manchester(bitstream, 4)

%output array for the line code 
y = [];
%output array for the time axis
time = [];
%loop over bit stream
for i = 1 : length(h)-1
   t = i-1:0.001:i;
   %total time axis
   time = [time t];
   if h(i)==1
       if h(i+1)==1
          y = [y ones(1,(length(t)-1)/2) -1*ones(1,(length(t)-1)/2) 1];
       else
          y = [y ones(1,(length(t)-1)/2) -1*ones(1,(length(t)-1)/2) -1];
       end
   elseif h(i)==0
       if h(i+1)==0
          y = [y -1*ones(1,(length(t)-1)/2) ones(1,(length(t)-1)/2) -1]; 
       else
          y = [y -1*ones(1,(length(t)-1)/2) ones(1,(length(t)-1)/2) 1];
       end
   end
end
%plot the signal
subplot(3,2,m)
d = plot(time,y);grid on
title('Line code Manchester');
set(d,'LineWidth',2.5);
hold on;
axis([0 length(h)-1 -2 2]);
end


function y = NRZI(h, m)
%NRZI: this function plot the NRZI line code for the input bit stream h and
%put them in mth order.
%example: NRZI(bitstream, 4)

%output array for the line code 
y = [];
%output array for the time axis
time = [];
const = 1;
%loop over bit stream
for i = 1 : length(h)-1
   t = i-1:0.001:i;
   %total time axis
   time = [time t];
   if h(i)==1
       const = -1*const;
       if h(i+1)==1
          if const==-1
            y = [y ones(1,(length(t)-1)) -1];
          else
            y = [y -1*ones(1,(length(t)-1)) 1];
          end
       else
          if const==-1
            y = [y ones(1,(length(t)-1)) 1];
          else
            y = [y -1*ones(1,(length(t)-1)) -1];
          end
       end
   elseif h(i)==0
       if h(i+1)==0
          if const==-1
            y = [y ones(1,(length(t)-1)) 1];
          else
            y = [y -1*ones(1,(length(t)-1)) -1];
          end 
       else
          if const==-1
            y = [y ones(1,(length(t)-1)) -1];
          else
            y = [y -1*ones(1,(length(t)-1)) 1];
          end
       end
   end
end
subplot(3,2,m)
d = plot(time,y);grid on
title('Line code NRZI');
set(d,'LineWidth',2.5);
hold on;
axis([0 length(h)-1 -2 2]);
end
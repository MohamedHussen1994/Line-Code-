function y = MLT3 (h, m)
%MLT3: this function plot the multi level transmission 3 line code for the input bit stream h and
%put them in mth order.
%example: MLT3(bitstream, 4)

%output array for the line code 
y = [];
%output array for the time axis
time = [];
%first level was 0 so at first comming 1 the output will be 1
level = 0; 
%at level zero the out go to 1 or -1 and this const will determine this
%if this const is 1 the out will go from 0 to 1
%if this const is -1 the out will go from 0 to -1
constz = 1; 
% loop over the bits in the bitstream 
for i = 1 : length(h)-1
   t = i-1:0.001:i;
   %total time axis
   time = [time t];
   % if the input bitstream is 1
   if h(i)==1
       %the following cases make the transition between levels
       %using the following main three rules:
       %1-	If the next bit is 0, there is no transition.
       %2-	If the next bit is 1 and the current level is not 0, the next level is 0. 
       %3-	If the next bit is 1 and the current level is 0, the next level is the opposite of the last nonzero level.
       if (level == 0)&&(constz==1)
        level = 1;
       elseif (level == 0)&&(constz==-1)
        level = -1;
       elseif level == 1
        level = 0;
       elseif level == -1
        level = 0;
       end
       %if the current bit is 1 and the next is 1 too
       if h(i+1)== 1
          if level == 1
            y = [y ones(1,(length(t)-1)) 0];
          elseif level == 0
            if constz == 1
              y = [y zeros(1,(length(t)-1)) -1];
            elseif constz == -1
              y = [y zeros(1,(length(t)-1)) 1];  
            end
            constz = constz*-1;
          elseif level == -1
            y = [y -1*ones(1,(length(t)-1)) 0];
          end
       %if the current bit is 1 and the next is 0   
       else
          if level == 1
            y = [y ones(1,(length(t)-1)) 1];
          elseif level == 0
            y = [y zeros(1,(length(t)-1)) 0];
            constz = constz*-1;
          elseif level == -1
            y = [y -1*ones(1,(length(t)-1)) -1];
          end
       end
   % if the input bitstream is 0
   elseif h(i)==0
       %if the input bitstream is 0 and the next bit is 0 too
       if h(i+1)==0
          if level == 1
            y = [y ones(1,(length(t)-1)) 1];
          elseif level == 0
            y = [y zeros(1,(length(t)-1)) 0];
          elseif level == -1
            y = [y -1*ones(1,(length(t)-1)) -1];
          end 
       % if the input bitstream is 0 and the next bit is 1  
       else
          if level == 1
            y = [y ones(1,(length(t)-1)) 0];
          elseif level == 0
            if constz == 1
              y = [y zeros(1,(length(t)-1)) 1];
            elseif constz == -1
              y = [y zeros(1,(length(t)-1)) -1];  
            end
          elseif level == -1
            y = [y -1*ones(1,(length(t)-1)) 0];
          end
       end
   end
end
%plot the mlt3
subplot(3,2,m)
d = plot(time,y);grid on
title('Line code multi level transmission 3');
set(d,'LineWidth',2.5);
hold on;
axis([0 length(h)-1 -2 2]);
end


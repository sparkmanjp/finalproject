
Time = [0,10,12,14,16,18,20,22];
temp2 = size(Time);
ntime = temp2(2); %total number of time points
CellNum = zeros(ntime, 1);
CellNum(1) = 100000; %time 0, the first in the time vector
load('cells.mat')

timenew = [0:.02:22];
figure(); hold on;
plot(timenew,exp(getLogNumCell(timenew, logNumCellInit, ParamOptimal(1), ParamOptimal(2)))...
    ,'linewidth', 3 ...
    ,'color', 'red' ...
    );



    for itime = 2:ntime
        CellNum(itime) = sum(sum(sum(cells(:,:,:,itime-1))));
    end
logCellNum = log(CellNum);
plot(Time...
    , CellNum...
    ,'.-'...
    ,'markersize', 30 ...
    ,'linewidth', 3 ...
    ,'color', 'blue' ...
    )
set(gca ,'yscale', 'log')
    
    legend('Gompertzian Fit', 'Experimental Data', 'location', 'northwest')
title('Gompertzian Fit to Rat''s Brain Tumor Growth', 'fontsize', 13)
xlabel('Time [days]')
ylabel('Tumor Cell Count')
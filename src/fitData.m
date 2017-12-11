%data set up%
global logNumCellInit Time LogNumCell ndata
load('cells.mat')
numCellInit = 100000;
logNumCellInit = log(numCellInit);
Time = [0,10,12,14,16,18,20,22];
temp = size(Time);
ndata = temp(2);

NumCell = zeros(ndata, 1);
LogNumCell = zeros(ndata, 1);
for itime = 2:ndata 
    NumCell(itime) = sum(sum(sum(cells(:,:,:,itime-1))));
    LogNumCell(itime) = log(NumCell(itime));
end

%data fitting section %
%the order of paraminit is: lamda, c, sigma
ParamInit = [10, .1, 1];
ParamOptimal = fminsearch(@getLogLike, ParamInit);
disp('The optimal parameters for the values are...');
disp(['lamda = ', num2str(ParamOptimal(1)), ',   c = ', num2str(ParamOptimal(2)), ',    sigma = ', num2str(ParamOptimal(3))])

...timenew = [1:.02:22];


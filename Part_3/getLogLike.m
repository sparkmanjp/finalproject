function logLike = getLogLike(Param)
    global Time LogNumCell logNumCellInit ndata
    Mean = getLogNumCell(Time, logNumCellInit, Param(1), Param(2));
    
    LogProb = zeros(ndata, 1);
    for itime = 1:ndata
        LogProb(itime) = log(normpdf(LogNumCell(itime), Mean(itime), Param(3)));
    end
    logLike = - sum(LogProb);


end
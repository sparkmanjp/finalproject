function logNumCell = getLogNumCell(Time, logNumCellInit, lamda, c)
    logNumCell = logNumCellInit + (lamda*(1.0 - exp(-c*Time)));
end

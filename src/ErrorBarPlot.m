load( 'cells.mat' );
binary = cells;
binary( binary ~= 0 ) = 1 ;

ntime = 8;
time = [0 10 12 14 16 18 20 22];

numCells = zeros( ntime , 1 );
errCells = zeros( ntime , 1 );
numCells(1) = 100000;
errCells(1) = 10000;

for itime = 2:ntime
    numCells(itime) = sum( sum( sum( cells( : , : , : , itime-1 ) ) ) );
end


for itime = 2:ntime
    
    error = 0;

    for izslice = 1:16   
       
        Bcell = bwboundaries( binary( : , : , izslice , itime-1 ) );
        dimensions = size( Bcell );
        
        for iobject = 1:dimensions(1)
           
            object = Bcell{ iobject };
            object = unique( object , 'rows' );
            length = size(object);
            
            if ~isempty(object)
                
                temp = size( object );
                lastrow = temp(1);
                
                for row = 1:lastrow
                   
                    error = error + cells( object( row , 1 ) , object( row , 2 ) , izslice , itime-1 );
            
                end
            end
            
        end
    end
    
    errCells(itime) = error;

end


errorbar( time ...
           , numCells ...
           , errCells  ...
           , '-o'     ...
           , 'linewidth', 3 ...
           , 'color', 'blue' ...
           );
       
title( 'Gompertzian Fit to Rat''s Brain Tumor Growth' );
xlabel( 'Time [days]' );
ylabel( 'Tumor Cell Count' );
legend( 'Experimental Growth' , 'location' , 'northwest' );

saveas( gcf , 'TumorGrowthWithErrorBars.png' );

title( 'Rat''s Brain Tumor Growth with Log Scale Y Axis' );
set( gca, 'YScale', 'log' );
saveas( gcf , 'LogTumorGrowthWithErrorBars.png' );
%PLOT #2 - Plots WPT file
%INFO: Plots Waypoint Files


if ~exist('wpts')
    error('load waypoint files first using load_wpts.m')
    
end

plot(wpts.N,wpts.E);
daspect([1 1 1]);
xlabel('Northing [m]')
ylabel('Easting [m]')



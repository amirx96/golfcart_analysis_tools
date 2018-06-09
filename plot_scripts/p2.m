%PLOT #2 - Acceleration Rpt with Speed Rpt
%INFO: Plots Pacmod speed vs. GPS speed. Up velocity in GPS speed is
%neglected.

try
hold on
plot(accel_rpt,'r')
yyaxis right;
plot(pacmod_spd,'b')
xlabel 'Time(MM:SS)'
legend('Throttle Cmd', 'Speed Rpt')
title 'Speed/Throttle Report'
datetick('x','MM:SS')
grid;
end


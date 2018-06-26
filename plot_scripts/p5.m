%PLOT #5 - Throttle_Cmd vs. Cmd Speed
%INFO: Plots for analyzing throttle command vs cmd_vel


if ~exist('cmd_vel')
    error('no cmd_vel loaded')
end

hold on;
plot(pacmod_spd) % mph
yyaxis right;
plot(accel_cmd);
title('')
xlabel('Time [MM:SS]')
datetick('x','MM:SS')
legend('Speed', 'Throttle %')


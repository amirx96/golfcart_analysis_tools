%PLOT #4 - cmd_vel vs actual
%INFO: Plot of commanded velocity vs actual

if ~exist('cmd_vel')
    error('no cmd_vel loaded')
end

hold on;
plot(cmd_vel.Time,cmd_vel.Data(:,1)./0.447) % convert to mph
plot(pacmod_spd);
title('')
ylabel('Speed [mph]')
xlabel('Time [MM:SS]')
datetick('x','MM:SS')
legend('Command Speed', 'Actual Speed')
%PLOT #7 - Brake_cmd vs. Speed
%INFO: Plots for analyzing braking command and speed

if ~exist('brake_rpt')
    error('no brake_rpt loaded')
end


hold on

duration_spd = datnum2duration(pacmod_spd.Time);
duration_brake = datnum2duration(brake_rpt.Time);
plot(duration_spd,pacmod_spd.Data,'b') % mph
yyaxis right;
plot(duration_brake,brake_rpt.Data,'r');
%ylabel('Speed [mph]')
% xlabel('Time [MM:SS]')
% datetick('x','MM:SS')
%legend('Actual Speed', 'Brake')
grid;


%%
if exist('reduced_selection')
    % Regression fitting
    x = datnum2duration(reduced_selection(:,1));
    X = [ones(length(x),1) x];
    y = (reduced_selection(:,2)./0.4407);

    avg_deaccel = X\y;
    
    clear x X y;

end
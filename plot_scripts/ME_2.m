%MobilEye Analysis 7/20/2018
% A. Darwesh20

%lateral error
e_lat = lane_models.L_c0 + lane_models.R_c0;
figure(1)

plot(lane_models.Time,e_lat,'-r')
grid;
ylabel('Lateral Error [m]')
hold on
yyaxis right;
ylabel('Heading Error (rad)')
plot(lane_models.Time,lane_models.L_c1,'-b')
title('Lateral & Heading Error')
legend('lateral error','heading error')
figure(2)
plot(datetime(cmd_vel.Time,'ConvertFrom','datenum'),cmd_vel.Data(:,2))
title('System Input (wheel angle)')
grid;
ylabel('Wheel Angle [rad]')

% Calculate Est. Yaw Rate based on wheel angle
% d = tan(L/R) where L is track width
% est_yaw_rate = V/R - > yaw_rate = atan(d)*V/L
% desired_yaw_rate = c2*V (V/R) where c2 is the curvature of the road

L = 5.1; %approx-  meters

% Need to synchronize wheel angle, velocity, and curvature into one vector.
% unforunately matlab can't sync more than two timeseries.... so we have
% to repeat synchronizations.


 curvatureTS = timeseries(lane_models.L_c2,datenum(lane_models.Time)); %curvature is now a time series

%Ts1               Ts2
[syncPacmodSpd, syncCmdVel] = synchronize(pacmod_spd,cmd_vel,'union');
%ts1            %ts3
[syncPacmodSpd,syncCurvature] = synchronize(syncPacmodSpd,curvatureTS,'union');
% ts2           %ts3
[syncCmdVel,syncCurvature] = synchronize(syncCmdVel,syncCurvature,'union');
%checks:
% all(syncPacmodSpd.Time == syncCmdVel.Time)
% all(syncCmdVel.Time == syncCurvature.Time)


% Now that all are synced lets simulate a correction for the wheel angle based on yaw rate.
% 
 est_yaw_rate = atan(syncCmdVel.Data(:,2)).*syncPacmodSpd.Data./L;
 des_yaw_rate = syncCurvature.Data.*syncPacmodSpd.Data;
 K_yaw = -0.4;
 correction = K_yaw.*(est_yaw_rate-des_yaw_rate);
 
 hold on;
 plot(datetime(syncCmdVel.Time,'ConvertFrom','datenum'),syncCmdVel.Data(:,2) + correction)
 legend('Current Algorithm Output', 'New Algorithm Output')

%plot(datetime(pacmod_enable.Time,'ConvertFrom','datenum'), pacmod_enable.Data)

%PLOT #1 - Pacmod speeds vs. GPS speed.
%INFO: Plots Pacmod speed vs. GPS speed. Up velocity in GPS speed is
%neglected.

if ~isempty('gps')    
    gps_speed = timeseries((gps.speed/0.4407),gps.time,'Name','GPS Speed (MPH)');
else 
    error('GPS not loaded')
end

if ~exist('pacmod_spd')
    error('pacmod_spd not loaded')
end

figure
plot(pacmod_spd)
hold on
plot(gps_speed);
datetick('x','MM:SS')
ylabel('Speed MPH')
xlabel('Time MM:SS')



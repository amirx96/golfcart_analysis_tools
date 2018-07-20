%% vehicle speed report
data = finddata(S,'_pacmod_parsed_tx_vehicle_speed_rpt');
if(~isempty(fieldnames(data)))
    [times idx] = unique(data.(1),'stable');
    dat = data.(8);
    pacmod_spd = timeseries(0.8787.*dat(idx),epoch2mat(times),'Name','Pacmod Speed (mph)'); %0.8787 is manual conversion from PACMOD since PACMOD speed is wrong
%         pacmod_spd = timeseries(dat(idx),times,'Name','Pacmod Speed (m/s)');
% Not sure what above code does. Why do we want to remove repeat times -
% Amir
    temp = pacmod_speed_integrate(datnum2duration(pacmod_spd.Time),pacmod_spd.Data);
    pacmod_distance = timeseries(temp,pacmod_spd.time,'Name', 'Pacmod Distance (m)');
end
clear data temp dat idx k times;

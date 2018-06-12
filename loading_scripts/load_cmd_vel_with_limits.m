%% cmd_vel_with_limits
data = finddata(S,'_cmd_vel_with_limits');
if(~isempty(fieldnames(data)))
    cmd_vel = timeseries([data.(4) data.(10)],epoch2mat(data.(1)),'Name','Command Speed (m/s)');
end
clear data;
%% cmd_vel
data = finddata(S,'_cmd_vel');
if(~isempty(fieldnames(data)))
    cmd_vel = timeseries([data.(3) data.(9)],epoch2mat(data.(1)),'Name','Command Speed (m/s)');
end

clear data;
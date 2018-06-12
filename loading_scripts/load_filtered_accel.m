%% filtered accel
data = finddata(S,'_filtered_accel');
if(~isempty(fieldnames(data)))
    filtered_accel = timeseries(data.(2),epoch2mat(data.(1)),'Name','Filtered Acceleration (m/s^2)');
end
clear data;
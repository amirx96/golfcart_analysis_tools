%% corrimudata %imu data earlier from novatel was is m/s^2 per sample
data = finddata(S,'_imu_data'); %Not sure if needed anymore
if(~isempty(fieldnames(data)))
    corrimudata = timeseries([data.(20) data.(21) data.(22)],data.(1),'Name','Acceleration');
end
clear data;
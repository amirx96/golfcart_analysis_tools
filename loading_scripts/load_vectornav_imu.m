data = finddata(S,'_vectornav_imu');
if(~isempty(fieldnames(data)))
    imu_data = timeseries([data.(14) data.(15) data.(16)],data.(1),'Name','Angular Speed (rad/s)');
end
clear data;
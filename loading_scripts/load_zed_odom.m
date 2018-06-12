%% zed_odom
data = finddata(S,'_zed_odom');
if(~isempty(fieldnames(data)))
    zed_odom = timeseries([data.(12) data.(13) data.(14)],data.(1),'Name','Zed Odometry');
end
clear data;


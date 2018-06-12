%% accel_rpt 
data = finddata(S,'_pacmod_parsed_tx_accel_rpt');
if(~isempty(fieldnames(data)))
    accel_rpt = timeseries(data.(17),epoch2mat(data.(1)),'Name','Accelerator Report (%)');
end
clear data;
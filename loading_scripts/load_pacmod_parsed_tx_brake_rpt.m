%% brake_rpt
data = finddata(S,'_pacmod_parsed_tx_brake_rpt');
if(~isempty(fieldnames(data)))
     brake_rpt = timeseries(data.(17),epoch2mat(data.(1)), 'Name', 'Brake Report Output (%)'); %If negative value, no braking. Value between 0 & -1
end
clear data;
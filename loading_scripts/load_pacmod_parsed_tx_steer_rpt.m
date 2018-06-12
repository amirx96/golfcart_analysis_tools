%% steer_rpt
data = finddata(S,'_pacmod_parsed_tx_steer_rpt');
if(~isempty(fieldnames(data)))
    steer_rpt = timeseries([data.(6) data.(5)+3.0110],data.(1),'Name','Steering Angle (rad)');
    for j = 1:length(steer_rpt.data(:,1))
       if(steer_rpt.data(j,1) > 30)
           steer_rpt.data(j,1) = steer_rpt.data(j,1) - 65.5;
       end
       if(steer_rpt.data(j,2) > 30)
           steer_rpt.data(j,2) = steer_rpt.data(j,2) - 65.5;

       end
    end
end
clear data;
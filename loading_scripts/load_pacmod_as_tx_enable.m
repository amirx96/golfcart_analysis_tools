%% enable
data = finddata(S,'_pacmod_as_tx_enable');
if(~isempty(fieldnames(data)))
    truefalse = [];
    for j = 1:length(data.(2))
        truefalse(j) = data.(2){j}=="True";
    end
    pacmod_enable = timeseries(truefalse',epoch2mat(data.(1)),'Name','Enable');
end
clear data truefalse;
data = finddata(S,'_lane_models');

if(~isempty(fieldnames(data)))
    
    
   lane_models = timetable(datetime(epoch2mat(data.(1)),'ConvertFrom','datenum'),data.(9),data.(10),data.(11),data.(12),data.(13),data.(14),data.(15),data.(16),data.(17),data.(19),data.(20),data.(21),data.(22),data.(23),data.(24),data.(25),data.(26),data.(27));
   lane_models.Properties.VariableNames = {'L_quality','L_marker_kind','L_curved_model_kind','L_c0','L_c1','L_c2','L_c3','L_width','L_view_range','R_quality','R_marker_kind','R_curved_modeR_kind','R_c0','R_c1','R_c2','R_c3','R_width','R_view_range'};
    
    
end
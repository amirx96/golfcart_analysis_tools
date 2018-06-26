close all; clear all; clc;
addpath(genpath('functions/'));
% This script trims the throttle, pacmod speed, and speed reports in bulk
% from a folder of mat files. This function will also resample the throttle
% command to 50 Hz

% The output of this function is a structure with each data mat.

%REQUIRED IN EACH MAT:
        %pacmod_enable
        %pacmod_spd
        %accel_rpt
%Optional IN EACH MAT:
        %trim_end_time
        %trim_start_time
%In case no trim times specified, the script will not trim times.


%BEGIN

% Get folder name
try
    folder_name = uigetdir();
catch
    return
end
% Get list of files
d = dir(strcat(folder_name,'/*.mat'));

% load files
for i = 1:length(d)
   fname = strtok(d(i).name,'.');
   s.(fname) = load( strcat(folder_name,'/',d(i).name));
   if ~isfield(s.(fname),'accel_rpt')
       error('no accel_rpt data in %s',fname)
   end
   if ~isfield(s.(fname),'pacmod_spd')
       error('no pacmod_spd data in %s',fname)
   end
   if ~isfield(s.(fname),'gps_speed')
       error('no gps_speed data in %s',fname)
   end
   
end
clear fname;

%perform a timeseries trim
for i = 1:numel(fieldnames(s))
    fields = fieldnames(s);
    
    if isfield(s.(fields{i}),'start_time') && isfield(s.(fields{i}),'end_time')
        
    start_time = s.(fields{i}).start_time;
    end_time = s.(fields{i}).end_time;
    
    s.(fields{i}).accel_rpt = timeseries_trim(start_time,end_time,s.(fields{i}).accel_rpt); %accel_rpt
    s.(fields{i}).pacmod_spd = timeseries_trim(start_time,end_time,s.(fields{i}).pacmod_spd); %accel_rpt
    s.(fields{i}).gps_speed = timeseries_trim(start_time,end_time,s.(fields{i}).gps_speed); %gps_speed
    
    end

end



% throttle resample @ 50Hz
for i = 1:numel(fieldnames(s))
    
%     y = s.(fields{i}).gps_speed.Data;
%     u = s.(fields{i}).accel_rpt.Data;
%     u = resample(u,length(y),length(u));
%     s.(fields{i}).accel_rpt = u;
    
%tsout = resample(tsin,timevec)
  % resample @ 50Hz
  s.(fields{i}).accel_rpt = resample(s.(fields{i}).accel_rpt,s.(fields{i}).gps_speed.Time,'zoh');
  % 0 if throttle less than 0.2
  
  idx = s.(fields{i}).accel_rpt.Data < 0.2;
  s.(fields{i}).accel_rpt.Data(idx) = 0;
  
  
    
end


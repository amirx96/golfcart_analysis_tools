close all; clear all; clc;
addpath(genpath('loading_scripts/'));
addpath(genpath('functions/'));
addpath(genpath('plot_scripts/'));
%% read from folder
try
    folder_name = uigetdir('../../June 6th 2018');
catch
    return
end
if(~exist(strcat(folder_name,'/data.mat')))
    S = csvread_all(folder_name);
    folder_name = strcat(folder_name,'/');
else
    load(strcat(folder_name,'/data.mat'))
%     return
end

%% zed_odom
load_zed_odom
%% corrimudata %imu data earlier from novatel was is m/s^2 per sample
load_corrimudata
%% Novatel INSPVAX
gps = load_novatel_gps(S);
%% imu_data
load_vectornav_imu
%% vehicle speed report
load_pacmod_parsed_tx_vehicle_speed_rpt
 %% accel_rpt 
load_pacmod_parsed_tx_accel_rpt
 %% brake_rpt
load_pacmod_parsed_tx_brake_rpt
 %% enable
load_pacmod_as_tx_enable
 %% steer_rpt
 load_pacmod_parsed_tx_steer_rpt
%% cmd_vel_with_limits
load_cmd_vel_with_limits
 %% req_accel
load_req_accel
%% filtered accel
load_filtered_accel
%% end
% clear S;
issim = false;
save(strcat(folder_name,'data.mat'));



%Originally made by:

%Garrison Neel @neelg1193

%Modified by:

%Amir Darwesh @amirx96

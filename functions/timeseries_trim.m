function [timeseries_out] = timeseries_trim(startT,endT,timeseries_in)
%TIMESERIES_TRIM Trims a time series given a star time and end time.
%   Detailed explanation goes here

idx = (timeseries_in.Time < endT & timeseries_in.Time > startT);

timeVal = timeseries_in.Time(idx);
datVal = timeseries_in.Data(idx);


timeseries_out = timeseries(datVal,timeVal,'Name',timeseries_in.Name);
%timseries_out = timseries_in( (timseries_in.Time < endT & timeseries_in.Time > startT));


end


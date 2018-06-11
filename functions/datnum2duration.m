function [duration] = datnum2duration(datenumvec)
%DATNUM2DURATION Conversion from MATLAB's datenum to a duration.
%   INPUT: datenum vector of time 
%   output: numeric vector of seconds



temp = datetime(datenumvec,'ConvertFrom','datenum');

durationvec = temp - temp(1);
durationvec.Format = 's';


duration = seconds(durationvec);

end


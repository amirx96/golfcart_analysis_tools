function [distance] = pacmod_speed_integrate(duration,pacmod_spd)
% Integrates pacmod_spd using trapezodial method to aquire a cumulative
% distance traveled over a timevector

% output is in meters

    if (length(duration) ~= length(pacmod_spd))
        error('dimension mismatch (duration,pacmod_spd)')
    end
    
for k = 2:length(pacmod_spd(1:end))
    temp(k) = trapz(duration(1:k),pacmod_spd(1:k).*0.44704); %%%%%%%%%% Integration for Distance. Remember to convert to m/s
end

distance = temp'; % meters;


end
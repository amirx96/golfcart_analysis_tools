
lane_model = finddata(S,'_lane_models');


left_c0 = lane_model.marker_offset;
left_c1 = lane_model.heading_angle;
left_c2 = lane_model.curvature;
left_c3 = lane_model.curvature_derivative;

right_c0 = lane_model.marker_offset_1;
right_c1 = lane_model.heading_angle_1;
right_c2 = lane_model.curvature_1;
right_c3 = lane_model.curvature_derivative_1;

x = linspace(1,70);

y_left = left_c0 + left_c1*x + left_c2*x.^2 + left_c3*x.^3; 
y_right = right_c0 + right_c1*x + right_c2*x.^2 + right_c3*x.^3; 



a1 = animatedline('Color','r')
a2 = animatedline('Color','g')
for i = 1:1:length(y_left(:,1))
    
%    hold on
%    
%    plot(x,y_left(i,:))
%    plot(x,y_right(i,:))
%   daspect([ 1 1 1])
    clearpoints(a1)
    clearpoints(a2)
    addpoints(a1,x,y_left(i,:));
    addpoints(a2,x,y_right(i,:));
    drawnow
    daspect([25 1 1])
    pause(0.01)
end
%% Energy Output of E20/ 435 Solar Panel
%% Setting up the Variables
A=50:50:400; % total area of panels in (m^2)
a= 2.162; % area of one solar panel (m^2)
Wp= 0.435; % peak power of one panel in (kW)
H= 1310.35; % Annual average solar radiation on tilted panels in (kWh/m².y)
PE= (Wp/a); % solar panel yeild
%% Calculating yearly energy output
for PR= 0.5:0.1:1 % Performance ratio, coefficient for losses 

E=A.*PE.*H.*PR % calcuates the amount of energy produced by the solar panels in(kWh)
plot(A,E)
hold on
end
%% Ploting Graph
title('Energy Produced Vs Weather and Age:E20 /435')
legend('Performance Ratio 0.5','Performance Ratio 0.6','Performance Ratio 0.7','Performance Ratio 0.8','Performance Ratio 0.9','Performance Ratio 1.0')
xlabel('Area in m^2')
ylabel('Energy Produced in kWh')
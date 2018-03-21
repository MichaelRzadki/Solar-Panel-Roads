%% Financial Model
%% Variables
M = zeros(1,51);    % Money generated by electricity
P = zeros(1,51);    % Profit
C = 0.14169;        % Average price of electricity in Ontario is $0.14169/kWh
I = 1.0142;         % Average annual increase of electricity price is 1.42%
S = 871.39;         % Money saved annually for clearing 55 m of road in Toronto
E = 81203;          % Energy generated by 400 m^2 of solar panels
H = 5455;           % Energy needed to melt snow during an average winter [kWh]

%% Equations
for i = 1:51
    M(i) = (C)*(I^(i-1));
end

% Revenue
R = S+((E-H).*M);

% Profit
for i = 1:51
    P(i) = (sum(R(1:(i-1))))-300000;    
end
%% Plotting
t = 0:50;
plot(t,P,'k')

% Sets dotted reference lines to indicate sigificant times
line = refline([0 0]);
set(line,'LineStyle',':','Color','r')
line2 = refline([0 30000]);
set(line2,'LineStyle',':','Color','b')

% Adds labels to the graph
title('Profit over Time')
xlabel('Time (years)')
ylabel('Profit (dollars)')
legend('Profit','0% Return Rate','10% Return Rate')
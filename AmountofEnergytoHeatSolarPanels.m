%% Amount of Energy to Heat Solar Panels
%% Variables
W=100; %Width and length of panel (cm)
Thickness=0.5; % thickness of glass (cm)
T=2; %required temp of glass
gDensity=2.4; %grams per cm^3 for plate glass
Cg=0.5; %joules per g kelvin [kJ/(kg*K)] 
Cv=0.718; %Specific heat capacity of air at constant volume 
Ma=28.97; %molar mass of air (grams per mol)
aDensity=0.001293; %density of air in grams per cm^3
Ta=linspace(0,-45); %temperature of air 
Thicklayer=4; %thickness of the layer of air responsible for removing heat (cm)
SA=404;
Density=0.1; %grams per cm^3 for the snow
Thickness_snow=linspace(0,260); %0 to double the average snowfall in Toronto per year
HF= 333.55; %Kilojoules per Kg
C_snow= 2.01; %Kilojoules per kg kelvin [kJ/(kg*K)] 

%% Energy to Heat and Keep the Panels at 2 Degrees Celsius
Volumeg=W^2*Thickness; %volume of glass
Volumea=W^2*Thicklayer; %volume of air responsible for removing heat
na=Volumea*aDensity/Ma; %number of moles of air
Qa=Cv*na*(T-Ta)/1000; %Energy required to keep the panels at 2 Celsius
Qg=Volumeg*gDensity*Cg*(T-Ta)/1000; %Energy required to bring the panels to 2 celsius from current temp /1000 to make kJ

%% Energy Taken Away by ice/snow
Volume_snow=Thickness_snow.*(W^2); %volume of ice/snow that will the the panel during a storm
m_snow=(Volume_snow.*Density)/1000; %mass of ice/snow that will hit the panel during a storm
Q_snow=(HF*m_snow)+(C_snow*m_snow.*(T-Ta)); %energy taken away by snow/ice hitting the panel

%% Total Energy Used
Energyperpanel=(41.*Qg)+((60*24*41)*Qa)+Q_snow;
%Energy per year per panel Qg is multplied by the average number of precip. days
%Qa is multiplied by the number of minutes in a 41 days 
%the air is assumed to go back to ambient temp every second due to winds 
Energy=(Energyperpanel*SA)/3600; %404 square metres of coverage /3600 to change to KW hours
plot(Ta,(Energy))
title('Energy consumption Over Various Temperatures')
xlabel('Ambient Temperature (C)')
ylabel('Energy (kJ)')
figure(2)
plot(Thickness_snow,Energy)
title('Energy Cosumption Over Various Amounts Of Snowfall') 
xlabel('Amount of snow fall (cm)')
ylabel('Energy (kJ)')
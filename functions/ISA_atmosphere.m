function [T,P,rho] = ISA_atmosphere( h )
%This function returns the ISA temperature given an altitude [h]
%Input:
%altitude h [m]
%Output:
%Temperature T [K]
%Pressure P [Pa]
%density rho [kg/m3]


%Mean sea level conditions
P0=101325; %[Pa]
rho0=1.225; %[kg/m3]
T0=288.15;  %[k]
a0=340.294; %[m/s]
g0=9.80664; %[m/s2]
R=287.058; %specific gas constant of air [J/Kg*K]

%limit values
T1=T0-6.5*11;
T2=T1+3*(47-25);
T3=T2-4.5*(79-53);

P1=P0*(T1/T0)^(-g0*1000/(-6.5*R));
P2=P1*exp(-g0*(25000-11000)/(R*T1));
P3=P2*(T2/T1)^(-g0*1000/(3*R));
P4=P3*exp(-g0*(53000-47000)/(R*T2));
P5=P4*(T3/T2)^(-g0*1000/(-4.5*R));
P6=P5*exp(-g0*(90000-79000)/(R*T3));

%temperature modelling
if h<11000;
    grad=-6.5/1000; %[K/m]
    T=T0+grad*h;
elseif h>=11000 && h<25000
    T=T1;
elseif h>=25000 && h<47000
    grad=3/1000; %[K/m]
    T=T1+grad*(h-25000);
elseif h>=47000 && h<53000
    T=T2;
elseif h>=53000 && h<79000
    grad=-4.5/1000; %[K/m]
    T=T2+grad*(h-53000);
elseif h>=79000 && h<90000
    T=T3;
elseif h>=90000
    grad=4/1000; %[K/m]
    T=T3+grad*(h-90000);
else T=0;
end


%pressure modelling
if h<11000;
    P=P0*(T/T0)^(-g0/(grad*R));
elseif h>=11000 && h<25000
    P=P1*exp(-g0*(h-11000)/(R*T1));
elseif h>=25000 && h<47000  
    P=P2*(T/T1)^(-g0/(grad*R));
elseif h>=47000 && h<53000
    P=P3*exp(-g0*(h-47000)/(R*T2));
elseif h>=53000 && h<79000
    P=P4*(T/T2)^(-g0/(grad*R));
elseif h>=79000 && h<90000
    P=P5*exp(-g0*(h-79000)/(R*T3));
elseif h>90000
    P=P6*(T/T3)^(-g0/(grad*R));
else P=0;
    
end


%density modelling
rho=P/(R*T);

end


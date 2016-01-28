function [ mp,dt,de,Te,Me,Ve,eps,Tt ] = disseny_tovera( P0,T0,Pe,Pa,F,M,k )
% disseny tovera gas ideal
% Suposem gola crítica
% entrada:
% P0 P cambra bar
% T0 T cambra K
% Pe P sortida tovera bar 
% Pa P ambient bar
% F  N empenta
% M  massa molecular gas kg/mol
% k  cp/cv gasos
% Torna:
% mp, cabal massic propulsants kg/s
% dt, diametre gola mm
% de, diametre sortida mm
% Me, Mach sortida
% Ve, velocitat sortida m/s
% eps, expansion ratio = Area sortida / Area gola
% Tt , temperatura a la gola K 

%CÀLCUL CONSTANTS
R=8.31446; %J/molK
r=R/M; % J/kgK

%EXHAUST MACH
auxFunction=@(Me) tov_Pressures(Pe,P0,k,Me);
Me=fsolve(auxFunction ,1);


%EXHAUST TEMPERATURE
Function2=@(Te) tov_Temperatures(Te, T0, k, Me);
Te=fsolve(Function2 ,T0);   %[k]


%EXHAUST VELOCITY
Ve=soundSpeed(k,r,Te)*Me; %[m/s]

%EXHAUST PRESSURE
auxFunction=@(Pe) tov_Pressures(Pe,P0,k,Me);
Pe=fsolve(auxFunction ,P0); %[bar]

%DENSITAT A LA GOLA (M=1)
%Rhot=density(P0,r,T0)/(1+(k-1)/2*1^2)^(1/(k-1));


%x(1) mp [kg/s]
%x(2) Ae [m2]
Sys=@(x)[ mass_flow(x(1),density(Pe,r,Te),Ve,x(2));...
        Thrust(x(1), Ve, F, Pe*1e5, Pa*1e5, x(2))];

x0=[0.01;...
    0.0001];

sol=fsolve(Sys, x0);

mp=sol(1);  %[kg/s]
Ae=sol(2);  %[m2]

auxFunction=@(At) tov_Areas(Me,Ae,At,k);
At=fsolve(auxFunction ,0.0001); %[m2]

eps=Ae/At;

dt=sqrt(4*At/pi)*1e3;  %[mm]
de=sqrt(4*Ae/pi)*1e3;  %[mm]

%TEMPERATURA GOLA (M=1)
auxFunction=@(Tt)tov_Temperatures(Tt,T0,k,1);
Tt=fsolve(auxFunction ,T0);          %[k]

end
function [Pe,F,mp,Tt,Pt,Te,Me,Ve]=analisi_tovera( dt,de,T0,P0,Pa,M,k )
% analissi tovera gas ideal
% Suposem gola crítica
% entrada:
% dt, diametre gola mm
% de, diametre sortida mm
% T0 T cambra K
% P0 P cambra bar
% Pa P ambient bar
% M  massa molecular gas kg/mol
% k  cp/cv gasos
% sortida:
% Pe P sortida tovera bar --
% F  N empenta
% mp kg/s cabal massic
% Tt , temperatura a la gola K --
% Pt , pressio a la gola bar --
% Te , temperatura a la sortida K --
% Me, Mach sortida--
% Ve, velocitat sortida m/s--

%CÀLCUL CONSTANTS
R=8.31446; %J/molK
r=R/M; % J/kgK


addpath('\functions')

%CÀLCUL MAC SORTIDA
At= circular_area(dt*1e-3); % m2
Ae= circular_area(de*1e-3);  %m2

auxFunction=@(Me)tov_Areas(Me,Ae,At,k);
Me=fsolve(auxFunction ,1.1);

%TEMPERATURA SORTIDA
auxFunction=@(Te)tov_Temperatures(Te,T0,k,Me);
Te=fsolve(auxFunction ,T0);          %[k]


%PRESIÓ SORTIDA
auxFunction=@(Pe)tov_Pressures(Pe,P0,k,Me);
Pe=fsolve(auxFunction ,P0);          %[bar]

%VELOCITAT SORTIDA
Ve=Me*soundSpeed(k,r,Te);   %[m/s]


%TEMPERATURA GOLA (M=1)
auxFunction=@(Tt)tov_Temperatures(Tt,T0,k,1);
Tt=fsolve(auxFunction ,T0);          %[k]


%PRESIÓ A LA GOLA
auxFunction=@(Pt)tov_Pressures(Pt,P0,k,1);
Pt=fsolve(auxFunction ,P0);          %[bar]


%MASS FLOW
Function2=@(mp)mass_flow(mp,density(Pe,r,Te),Ve,Ae);
mp=fsolve(Function2 ,1.1);      %[kg/s]

%THRUST
Function3=@(T)Thrust(mp,Ve,T,Pe*1e5,Pa*1e5,Ae);
F=fsolve(Function3,1.1); % N

end

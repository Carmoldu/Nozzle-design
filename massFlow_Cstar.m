function F = massFlow_Cstar( mp,Pchamber,Athroat,Cstar )
%function which relater mass flow with Cstar through the chamber pressure
%and throat area
%INPUTS:
%mp: mass flow [kg/s]
%Pchamber: chamber's pressure [bar]
%Athroat:throat area [m2]
%Cstar: Cstar [m/s]

F=mp-Pchamber*1e5*Athroat/Cstar;


end


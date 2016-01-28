function [ a ] = soundSpeed( k, r, T )
%Funció per avaluar la velocitat del so [m/s] donades gamma, R i temperatura del
%punt en qüestió
% r= [J/kgK](=R/MassaMolecular)
% t: temperatura al punt d'estudi [k]

a=sqrt(k*r*T); %m/s


end


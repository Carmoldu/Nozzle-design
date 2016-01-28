function Cstar = Cstar( Tchamber, r, k )
%The function returns Cstar from the chamber's temperature
%INPUTS:
%Tchamber: chamber temperature [K]
%r: R/molecular mass [J/KgK]
%k: cp/cv
%OUTPUT:
%Cstar: cstar [m/s]

Cstar=sqrt(r*Tchamber)/(sqrt(k)*(2/(k+1))^((k+1)/(2*(k-1))));
end


function [ rho ] = density( P,r,T )
%Calculate density from pressure, temperature and the specific constant of
%gasses of the fluid (R/molecular mass)
% Inputs:
%  P: pressure in bar
%  r: specific gas constant J/kgK

rho=P*1e5/(r*T);


end


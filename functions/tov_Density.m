function F=tov_Density(tho,rho0,k,M)
% La funci� dona la densitat a qualsevol punt de la tobera donada la
% presi� a la cambra de combusti� i el mach en el punt a estudiar

%rho0: densitat a la cambra de combusti� [kg/m3]
%rho: densitat al punt a estudiar [kg/m3]
%k: cp/cv gasos
%M: Mach en el punt a estudiar

F= rho0/rho -(1 + (k-1)/2 *M^2)^(k/(k-1));

end
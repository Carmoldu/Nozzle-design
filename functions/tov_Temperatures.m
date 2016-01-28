function F=tov_Temperatures(T,T0,k,M)
% La funci� dona la temperatura a qualsevol punt de la tobera donada la
% temperatura a la cambra de combusti� i el mach en el punt a estudiar

%T0: temperatura a la cambra de combusti� 
%T: temperatura al punt a estudiar
%k: cp/cv gasos
%M: Mach en el punt a estudiar

F= T0/T-(1 + (k-1)/2 *M^2); 

end
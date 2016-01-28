function F=tov_Pressures(P,P0,k,M)
% La funci� dona la presi� a qualsevol punt de la tobera donada la
% presi� a la cambra de combusti� i el mach en el punt a estudiar

%P0: presi� a la cambra de combusti�
%P: presi� al punt a estudiar
%k: cp/cv gasos
%M: Mach en el punt a estudiar

F= P0/P -(1 + (k-1)/2 *M^2)^(k/(k-1)); 

end
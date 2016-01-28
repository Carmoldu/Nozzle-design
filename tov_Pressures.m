function F=tov_Pressures(P,P0,k,M)
% La funció dona la presió a qualsevol punt de la tobera donada la
% presió a la cambra de combustió i el mach en el punt a estudiar

%P0: presió a la cambra de combustió
%P: presió al punt a estudiar
%k: cp/cv gasos
%M: Mach en el punt a estudiar

F= P0/P -(1 + (k-1)/2 *M^2)^(k/(k-1)); 

end
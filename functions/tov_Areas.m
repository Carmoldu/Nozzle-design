function F = tov_Areas( M, Ae, At,k)
% La funci� dona l'�rea a qualsevol punt de la tobera donada l'�rea
%a la cambra de combusti� i el mach en el punt a estudiar

%At: area a la gola [m2]
%Ae: area al punt a estudiar [m2]
%k: cp/cv gasos
%M: Mach en el punt a estudiar

F=((1/(M^2))*(2/(k+1)*(1+(k-1)*(M^2)/2))^((k+1)/(k-1)))-((Ae/At)^2);


end


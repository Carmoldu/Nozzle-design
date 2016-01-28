function F = mass_flow( mp, rho, V , A )
%Computes the mass flow from the density, velocity and area of a point
% mp: mass flow (kg/s)
% rho: density (kg/m3)
% V: normal velocity to the plane at the point (m/s)
% A: area of the duct at the point (m2)

F= mp-rho*V*A;


end


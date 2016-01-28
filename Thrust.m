function F = Thrust( mp ,ve, T, Pe, Pa, Ae )
%function to compute thrust
% mp: mass flow (Kg/s)
% ve: exhaust velocity (m/s)
% T:thrust (N)
% Pe: exhaust pressure (Pascals)
% Pa: atmospheric pressure (Pascals)
% Ae: exhaust area (m2)

F=T-mp*ve-(Pe-Pa)*Ae;


end


function Cf = Thrust_coefficient( Pchamber, Pexhaust, Patmos, Athroat, Aexhaust, k)
%This function returns the thrust coefficient given the pressure at the
%chamber, exhaust and atmospheric; the throat and exhaust area and the cp/cv
%INPUTS:
%Pchamber: combustion chamber pressure  [ All pressures  ]
%Pexhaust: exhaust pressure             [ must be in the ]
%Patmos: atmospheric pressure           [ same units     ]
%Athroat: throat area       [ All areas must be ]
%Aexhaust: exhaust area     [ in the same units ]
%k: cp/cv
%OUTPUT:
%Cf: thrust coefficient (adim)

Cf=sqrt(2*(k^2)*((2/(k+1))^((k+1)/(k-1)))*(1-((Pexhaust/Pchamber)^((k-1)/k)))/(k-1))+((Pexhaust/Pchamber)-(Patmos/Pchamber))*Aexhaust/Athroat;


end



%DADES

M=17.7; %[g/mol]
k=1.15; %cp/cv


Q1=3*10;
Q2=3/10;


F=700; %[kN]
T0=3000+Q1; %[K]
P0=50+Q2; %[bar]

%CONSTANTS
R=8.31446; %J/molK
r=R*1e3/M; % J/kgK


%At launch:
Pe=0.4; %[bar]

%final altitude
hf=100; %[km]

%mp=cte

%1. PARÁMETRES DE DISENY DE LA TOBERA (diámetre gola, diámetre exhaust,
%rati d'expansió)

%al llençar des del nivell del mar, considerarem P0 de l'atmosfera ISA
Pa=1.01325; %[bar]

[ mp,dt,de,Te,Me,Ve,eps,Tt ]=disseny_tovera(P0,T0,Pe,Pa,F*1e3,M*1e-3,k);

fprintf('1. PARÁMETRES DE DISENY DE LA TOBERA (diámetre gola, diámetre exhaust,rati d expansió)\n');
fprintf('Ae/At                     eps = %.2f   \n',eps);
fprintf('Throat diameter           dt= %.3f mm\n',dt);
fprintf('Outlet diameter           de= %.3f mm\n\n',de);


%2. CONDICIONS A LA SORTIDA DE LA TOVERA (Mach, P, T)
fprintf('2. CONDICIONS A LA SORTIDA DE LA TOVERA (Mach, P, T)\n');
fprintf('Exhaust Mach number        Me= %.3f       \n',Me);
fprintf('Exhaust temperature        Te= %.3f K    \n',Te);
fprintf('Exhaust pressure        Pe= %.3f bar    \n\n',Pe);


%3. CAUDAL MÀSIC
fprintf('3. CAUDAL MÀSIC \n');
fprintf('Propellant mass flow rate mp= %.3f kg/s \n\n',mp);


%4. EMPENYIMENT EN FUNCIÓ DE L'ALTURA (representar)
h=zeros(101,1);
pres=zeros(101,1);    %[Pa]
thrust=zeros(101,1);

for i=1:+1:101 
    h(i,1)=(i-1)*1000;
    [~,pres(i,1),~]=ISA_atmosphere(h(i,1));
end

thrust=mp*Ve+(Pe*1e5-pres)*circular_area(de*1e-3);  %[N]
    
figure('name','4.EMPENYIMENT EN FUNCIÓ DE L´ALTURA','numberTitle','off')
plot(h/1000, thrust/1000,'-');
title('Thrust VS altitude')
xlabel('altitude [km]')
ylabel('Thrust [kN]')


%5. THRUST COEFFICIENT EN FUNCIÓ DE L'ALTURA (representar)
ThrustCoef=zeros(101,1);

for i=1:+1:101 
    ThrustCoef(i,1)=Thrust_coefficient(P0*1e5,Pe*1e5,pres(i,1),circular_area(dt*1e-3),circular_area(de*1e-3),k);
end

figure('name','5.THRUST COEFFICIENT EN FUNCIÓ DE L´ALTURA','numberTitle','off')
plot(h/1000, ThrustCoef,'-');
title('Thrust Coefficient VS altitude')
xlabel('altitude [km]')
ylabel('Thrust coefficient')

%6. C*
Cs=Cstar(T0,r,k); %[m/s]

fprintf('6. C* \n');
fprintf('C star C*= %.3f m/s \n\n',Cs);

%7. VERIFICAR QUE F=Cf*At*Pc i que F=Cf*m*C* EN TOT MOMENT
thrust1=ThrustCoef*circular_area(dt*1e-3)*P0*1e5;
thrust2=ThrustCoef*mp*Cs;

error1=abs(thrust1-thrust);
error2=abs(thrust2-thrust);

figure('name','7.VERIFICAR QUE F=Cf*At*Pc i que F=Cf*m*C* EN TOT MOMENT','numberTitle','off')
plot(h/1000, error1,'-r'); hold on;
plot(h/1000, error2,'-b');
title('Error en el càlcul dels thrusts')
xlabel('altitude [km]')
ylabel('Thrust error [N]')
legend('Error utilitzant F=Cf*At*Pc','Error utilitzant F=Cf*mp*C*')
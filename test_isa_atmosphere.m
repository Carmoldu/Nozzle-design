addpath(genpath('..\disseny i anàlisi de toveres'))

x=zeros(101,1);
temps=zeros(101,1);
pres=zeros(101,1);
dens=zeros(101,1);

for i=1:+1:101 
    x(i,1)=(i-1)*1000;
    [temps(i,1),pres(i,1),dens(i,1)]=ISA_atmosphere(x(i,1));
end

figure
plot(temps,x,'-');
figure
plot(pres,x,'-');
figure
plot(dens,x,'-');
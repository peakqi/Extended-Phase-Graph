function ir=epg_monoexponential(x,ESP,fid)
t=ESP*(1:6);
F=x(1)+x(2)*exp(-t/x(3));
ir=sum((F-fid).^2);



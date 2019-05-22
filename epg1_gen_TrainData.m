function [X,T]=epg1_gen_TrainData(n)
   
    switch nargin    
        case 1
            nn=n;
        otherwise
            nn = 25;
    end

    
% alpha_in=x(1);
% T2_in=x(2);
% den=x(3);
% T1_in=450;
% ESP_in=10;
% N_in=6;




x10=0;x11=180;x1_n=nn;
x20=1;x21=60;x2_n=nn;
x30=0;x31=4000;x3_n=nn;

X=[];
T=[];

for ii=1:x1_n
    for jj=1:x2_n
        for kk=1:x3_n
            x1=rand*(x11-x10)+x10;
            x2=rand*(x21-x20)+x20;
            x3=rand*(x31-x30)+x30;
            
            X=cat(2,X,[x1,x2,x3]');
            F0_vector_out = epg_cpmg([x1,x2,x3]); 
            T=cat(2,T,F0_vector_out');
            
        end
    end
end
    


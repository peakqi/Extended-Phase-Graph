function epg_comparison_fmin_VS_fb


[X,T]=epg1_gen_TrainData(5);

x1=[];
for ii=1:30
    tse=squeeze(T(:,ii));
    f=@(x)epg_cpmg_alp_T2_s0_inp(x,tse);
    
    % alpha_in=x(1);
    % T2_in=x(2);
    % S0=x(3);
    % T1_in=450;
    % x(4)=0;
    % ESP_in=10;
    % N_in=6;
    try
    [xx,fval]=fminsearch(f,double([20,50,1500]));
    x1=cat(2,x1,xx');
    catch exp
    end


end
XX=X;
TT=T;
xx1=x1;
sz=size(x1);
titl{1}='alp';titl{2}='T2';titl{3}='S0';
netnum{1}='epg-net20.mat';netnum{2}='epg-net50-A180degT60.mat';netnum{3}='epg-net200-A200deg.mat';

for jj=1:3
    load (netnum{jj})
    xx2=net(TT);
    for ii=1:3
      

        a0=XX(ii,1:sz(2));
        a1=xx1(ii,1:sz(2));
        a2=xx2(ii,1:sz(2));
        
        figure;hold on; 
        plot(a0,'r*')
        plot(a0,'r')
        plot(a1,'gd')
        plot(a2,'bo')
        plot(a1,'g')
        plot(a2,'b')
        title(strcat(titl{ii},netnum{jj}(4:end-4),...
            '-fmin:',num2str(sum((a1-a0).^2)),...
            '-fb:',num2str(sum((a2-a0).^2))))
        saveas(gcf,strcat(netnum{jj}(5:end-4),'-vs-fminsearch-',titl{ii},'.jpeg'))
        
        
        if ii==3
            
        title(strcat(titl{ii},netnum{jj}(4:end-4),...
            '-fmin:',num2str(sum((a1-a0).^2)),...
            '-fb:',num2str(sum((a2-a0).^2))))
        ylim([0,4000])
        saveas(gcf,strcat(netnum{jj}(5:end-4),'-vs-fminsearch-',titl{ii},'res.jpeg'))
            
        end
    end
end

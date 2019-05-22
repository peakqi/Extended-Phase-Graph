clear all; close all;

lambda=[0 0.01 0.1 1 2 5 10 100];
a{1}='test_lambda0';
a{2}='test_lambda001'
a{3}='test_lambda01'
a{4}='test_lambda1'
a{5}='test_lambda2'
a{6}='test_lambda5'
a{7}='test_lambda10'
a{8}='test_lambda100'
b{1}='_T2.nii.gz'
b{2}='_s0.nii.gz'
b{3}='_alp.nii.gz'

for ii=1:8
        T2{ii}=squeeze(qf_load(strcat(a{ii},b{1})));
        S0{ii}=squeeze(qf_load(strcat(a{ii},b{2})));
        alpha{ii}=squeeze(qf_load(strcat(a{ii},b{3})));
end

disp('reading files');
% T2=squeeze(qf_load(strcat(a{ii},b{1})));
% S0=squeeze(qf_load(strcat(a{ii},b{2})));
% alpha=squeeze(qf_load(strcat(a{ii},b{3})));

%mask=squeeze(read_avw('mask.nii.gz'));

disp('making line plots');
xx=[87 97 146];
Smax=8192;
ind=8;
%     figure;hold on
% suptitle(a{ii})
for n=1:3
    subplot(3,3,(n-1)*3+1);hold on;
    title(['T2 for line ' num2str(xx(n))]);
    axis([0 180 0 80]);
    for ii=1:8
      plot(squeeze(T2{ii}(xx(n),121,:)),'LineWidth',2);   
    end
    
    
    subplot(3,3,(n-1)*3+2);hold on 
    title(['alpha for line ' num2str(xx(n))]);
    axis([0 180 0 180]);
    for ii=1:8
      plot(squeeze(alpha{ii}(xx(n),121,:)),'LineWidth',2);
    end
    
    
    subplot(3,3,(n-1)*3+3);hold on
    title(['S0 for line ' num2str(xx(n))]);
    axis([0 180 0 Smax]);
    for ii=1:8
       plot(squeeze(min(S0{ii}(xx(n),121,:),Smax)),'LineWidth',2); 

    end

end
legend(num2str(lambda'));


fname=['figs/profiles_all.png'];
print(fname,'-dpng');

figure;
for ii=1:8
    figure;
    suptitle(a{ii}(end-6:end))
  for n=1:3
    subplot(3,3,(n-1)*3+1); plot(squeeze(T2{ii}(xx(n),121,:)),'r-','LineWidth',2);   
    title(['T2 for line ' num2str(xx(n)) ', \lambda=' num2str(lambda(ind))]);
    axis([0 180 0 80]);
    subplot(3,3,(n-1)*3+2); plot(squeeze(min(S0{ii}(xx(n),121,:),Smax)),'b-','LineWidth',2); 
    title(['S0 for line ' num2str(xx(n)) ', \lambda=' num2str(lambda(ind))]);
    axis([0 180 0 Smax]);
    subplot(3,3,(n-1)*3+3); plot(squeeze(min(S0{ii}(xx(n),121,:),Smax)/Smax),'b-','LineWidth',2); 
    hold on; plot(squeeze(T2{ii}(xx(n),121,:)/80),'r-','LineWidth',2); 
    title('normalized T2 (red) and S0 (blue)');
    axis([0 180 0 1]); hold off;
  end
%   fname=['figs/profiles_lambda' num2str(lambda(ind)) '.png'];
%   print(fname,'-dpng');
end

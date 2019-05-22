nm{1}='expVSepg_MND12.mat'
nm{2}='expVSepg_MND13.mat'
nm{3}='expVSepg_MND14.mat'
nm{4}='expVSepg_MND17.mat'
nm{5}='expVSepg_MND20.mat'
nm{6}='expVSepg_MND22.mat'
nm{7}='expVSepg_CTL10.mat'
nm{8}='expVSepg_CTL11.mat'
nm{9}='expVSepg_CTL12.mat'
for ii=1:9
   
    load (nm{ii})
    if ii==2 |ii ==1 |ii==5
        A(ii,1:2,1:4)=M(1:2,2:5);
    else
        A(ii,1:2,1:4)=M(1:2,1:4);
    end
    
    
end

for ii=1:4
B(:,:,ii)=abs(A([1,2,5,7,8,9],:,ii))
figure
boxplot(B(:,:,ii))
end


function epg_fix_linegap


ind=[];
for ii=1:176
    try
       	%load (strcat('fb-net100-',num2str(ii),'.mat'));
        load(strcat('fminsearch-',num2str(ii),'.mat'));


    catch exception


        ind=cat(1,ind,ii);
    end


end
ind 

sz=max(size(ind))
for ii=1:sz
    try
    load(strcat('fminsearch-',num2str(ind(ii)-1),'.mat'));
    alpzlow=alpz;
    s0zlow=s0z;
    t2zlow=t2z;
    load(strcat('fminsearch-',num2str(ind(ii)+1),'.mat'));
    alpzhigh=alpz;
    s0zhigh=s0z;
    t2zhigh=t2z;
    alpz=(alpzlow+alpzhigh)/2;
    s0z=(s0zlow+s0zhigh)/2;
    t2z=(t2zlow+t2zhigh)/2;
    catch e1
        try
            load(strcat('fminsearch-',num2str(ind(ii)-1),'.mat'));
        catch e2
            try
                load(strcat('fminsearch-',num2str(ind(ii)+1),'.mat'));
            catch e3
                'no 3 slides'
            end
        end
            
        
    end
    save(strcat('fminsearch-',num2str(ind(ii)),'.mat'),'alpz','s0z','t2z')
end


%% import STREETBLOCK CSV from SQL SERVER 
%% import combinations.csv from SBAS

firstcol=4;
plot(COHERENCESTREETBLOCKS(1000:2000,4:end))

SBID = 33261;
rowID = find(COHERENCESTREETBLOCKS(1:end,1)==SBID);

d = (datenum(num2str(combinations(1:end,1)),'yyyymmdd')+ datenum(num2str(combinations(1:end,2)),'yyyymmdd')) /2;
mind = min(d);
maxd = max(d);

% indices to unique values in column 3
[~, ind] = unique(d(:, 1), 'rows');
% duplicate indices
duplicate_ind = setdiff(1:size(d, 1), ind);
% duplicate values
duplicate_value = d(duplicate_ind, 1);
d = removerows(d,'ind',duplicate_ind)


X = d';%dates time
V = COHERENCESTREETBLOCKS(rowID,4:end)'%coherence values for each time X
[V,PS] = removerows(V,'ind',duplicate_ind)
%figure; plot(X);
%figure; plot(V);
Xq  = mind:1:maxd;
%Vq1 = interp1(X,V,Xq,'linear');figure; plot(X,V,'o',Xq,Vq1,':.');ylim([0 1]);title('linear Interpolation');
%Vq1 = interp1(X,V,Xq,'nearest');figure; plot(X,V,'o',Xq,Vq1,':.');title('nearest Interpolation');
%Vq1 = interp1(X,V,Xq,'next');figure; plot(X,V,'o',Xq,Vq1,':.');title('next Interpolation');
%Vq1 = interp1(X,V,Xq,'previous');figure; plot(X,V,'o',Xq,Vq1,':.');title('previous Interpolation');
%Vq1 = interp1(X,V,Xq,'pchip');figure; plot(X,V,'o',Xq,Vq1,':.');title('pchip Interpolation');
Vq1 = interp1(X,V,Xq,'cubic');figure; plot(X,V,'o',Xq,Vq1,':.');ylim([0 1]);title(strcat('Cubic Interpolation for Streetblock: ',num2str(SBID)));
%Vq1 = interp1(X,V,Xq,'v5cubic');figure; plot(X,V,'o',Xq,Vq1,':.');title('v5cubic Interpolation');
%Vq1 = interp1(X,V,Xq,'spline');figure; plot(X,V,'o',Xq,Vq1,':.');title('spline Interpolation');





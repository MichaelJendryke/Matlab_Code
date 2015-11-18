function [ ] = GT_EXPORThugeM(r, fs , fp)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
filesize = fs;%1000000
result = r;%resultfile
filenumber = 1+roundn(size(result,1),6)/filesize;
b = linspace(filesize,filesize*filenumber,filenumber);
fileprefix = fp;%'resultfilteredEQFULL';
for bb=1:filenumber
    tic
    filename = strcat(fileprefix,'_',num2str(bb),'.csv');
    if bb==filenumber
        M = result(b(bb)-filesize+1:size(result,1),:);
    else
        M = result(b(bb)-filesize+1:b(bb),:);
    end
    M(M(:,3)==0,:) = []; %remove all rows that have 0 in the first image!!!
    fid=fopen(filename,'wt');
    temp=repmat('%.6f,',1,size(M,2));
    fprintf(fid,[temp(1:end-1) '#'],M.'); % is .' correct??
    fclose(fid);
    fprintf(['exported ', num2str(bb),' in: ']);toc
end

end


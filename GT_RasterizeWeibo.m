function [] = GT_RasterizeWeibo(cell, name,inputfile)
% name = 'Shanghai_Locals';
% cell = [100,200,250,400,500,800,1000,1600,2000];
% inputfile = 'E:\WeiboCSV\Shanghai_Locals_2014-01to06.csv';


wd = 'Rasterized';
mkdir(wd);
cd(wd);
fid = fopen(inputfile,'rt');
C = textscan(fid,'%s %s %f %f %*[^\n]',inf,'Headerlines',1,'Delimiter',',','CollectOutput',1);
fclose(fid);
utm = 51;
%celldisp(C);

foo = C{1}(:,2);
D=single(zeros(length(foo),1));
for i=1:length(foo)
D(i) = single(str2double(foo{i}));
%fprintf('%i\n',i);
end
addUTC = 8;
D = D + addUTC;
D(D>=24) = D(D>=24)-24;


Y = C{2}(:,1);
X = C{2}(:,2);

Y(Y==0) = NaN;
X(X==0) = NaN;

Y(Y>90) = NaN;
X(X>180) = NaN;

foo = [Y,X,D];

foo(any(isnan(foo(:,1:2)),2),:)=[];

Y = foo(:,1);
X = foo(:,2);
D = foo(:,3);
%delete NaNs
%Y(any(isnan(Y),2),:)=[];
%X(any(isnan(X),2),:)=[];


entries = length(X);
TopRight = [max(Y), max(X)];
TopLeft = [max(Y),min(X)];
BottomRight = [min(Y),max(X)];
BottomLeft = [min(Y), min(X)];



[Tx,Ty,utmzone] = deg2utm(TopRight(1),TopRight(2));
[Bx,By,utmzone] = deg2utm(BottomLeft(1),BottomLeft(2));

h = (Tx-Bx);% Meter
w = (Ty-By);

for g=1:length(cell)
cut = inf;
Rh = floor(h/cell(g));
Rw = floor(w/cell(g));

morning = 9;
evening = 21;

day = zeros(Rw,Rh);
night = zeros(Rw,Rh);
all = zeros(Rw,Rh);
fault = [];
for i=1:entries
    
    if rem(i,1000)==0
    fprintf('%i\n',i);
    end
    [x,y,utmzone] = deg2utm(Y(i),X(i));
    findx = x-Bx;
    findy = y-By;
    p = round(findx/cell(g));
    l = round(findy/cell(g));
    
    
    if (p>Rw)
        fault = [fault i];
        continue;
        %p = Rw;
    end
    if (l>Rh)
        fault = [fault i];
        continue;
        %l = Rh;
    end
    if (p<=0)
        fault = [fault i];
        continue;
        %p = 1;
    end
    if (l<=0)
        fault = [fault i];
        continue;
        %l = 1;
    end
    if D(i) < evening && D(i) >= morning %day
        if day(l,p)>cut-1
            disp('full');
        else
            day(l,p) = day(l,p) + 1;
        end
    else
        if night(l,p)>cut-1
            disp('full');
        else
            night(l,p) = night(l,p) + 1;
        end
    end
  
    all(l,p) = all(l,p) + 1;
    
end


comp = cat(3,day,night,all);
compname = {'DAY';'NIGHT';'TWENTYFOUR'};
% 
% figure; imagesc(comp(:,:,1)); axis image; 
% figure; imagesc(comp(:,:,2)); axis image;
% figure; imagesc(comp(:,:,3)); axis image;

max(max(comp(:,:,1)))
max(max(comp(:,:,2)))
max(max(comp(:,:,3)))

% only
% 24!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
for i=3:length(compname)
    
    exportname = strcat(name, '_', compname{i},'_',num2str(cell(g)),'m');
    
    bits = 32;
    result = comp(:,:,i);
    
    lines = size(result,2);
    pixels = size(result,1);
    
    
    %t = Tiff('all_redo500.tif','w');
    t = Tiff('temp1.tif','w');
    tagstruct.ImageLength = lines;
    tagstruct.ImageWidth = pixels;
    tagstruct.Photometric = Tiff.Photometric.MinIsBlack;
    
    %tagstruct.SampleFormat = Tiff.SampleFormat.UInt;
    %tagstruct.BitsPerSample = 8;
    
    tagstruct.SampleFormat = Tiff.SampleFormat.Int;
    tagstruct.BitsPerSample = bits;
    
    tagstruct.SamplesPerPixel = 1;
    tagstruct.RowsPerStrip = 16;
    tagstruct.PlanarConfiguration = Tiff.PlanarConfiguration.Chunky;
    tagstruct.Software = 'MATLAB';
    t.setTag(tagstruct);
    t.write(int32(fliplr(result')));
    t.close();
    
    
    command = ['D:\GeoTools\OSGeo4W\OSGeo4W.bat gdal_translate -of GTiff -a_srs EPSG:4326',...
        ' -gcp 1 1 ',                             num2str(TopLeft(2)), ' ', num2str(TopLeft(1)),...
        ' -gcp 1 ', num2str(lines),' ',              num2str(TopRight(2)), ' ', num2str(TopRight(1)),...
        ' -gcp ',num2str(pixels), ' 1 ',          num2str(BottomLeft(2)), ' ', num2str(BottomLeft(1)),...
        ' -gcp ',num2str(pixels),' ',num2str(lines),' ',  num2str(BottomRight(2)),' ', num2str(BottomRight(1)),...
        ' temp1.tif temp2.tif' ]
    
    system(command);
    
    command = ['D:\GeoTools\OSGeo4W\OSGeo4W.bat gdalwarp -t_srs "+proj=utm +zone=',num2str(utm),' +datum=WGS84" temp2.tif ' exportname '.tif'];
    
    system(command)
end  
end
end

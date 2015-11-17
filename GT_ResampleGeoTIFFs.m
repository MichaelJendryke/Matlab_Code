images = [  'GeoTIFF_20120811_20120902.tif';...
            'GeoTIFF_20120720_20121005.tif';...
            'GeoTIFF_20120628_20120811.tif';...
            'GeoTIFF_20120401_20120515.tif'];
        
cell =   [100,200,250,400,500,800,1000,1600,2000];
cell =   [50];

utmzone = 51;

band = ['A';'B';'C';'D';'E';'F';'G';'H';'I';'J';'K';'L';'M';'N';'O';'P';'Q';'R';'S';'T';'U';'V';'W';'X';'Y';'Z'];
 
cntimg = size(images,1);
cntcell = length(cell);
for i=1:cntimg
    fprintf('Resampling %s',images(i,:));
    for j=1:cntcell
        command = ['D:\GeoTools\OSGeo4W\OSGeo4W.bat ',...
        'gdalwarp -t_srs "+proj=utm +zone=',num2str(utmzone),' +datum=WGS84" -r average -tr ',...
        num2str(cell(j)), ' ' , num2str(cell(j)),' -srcnodata 0 -dstnodata 0 ',...
        images(i,:),' ',images(i,1:length(images(i,:))-4),'_UTM_',num2str(cell(j)),'m_avg.tif'];
system(command);
    end
end

%% Generate Commands to make mean images
for j=1:cntcell
    command = ['D:\GeoTools\OSGeo4W\OSGeo4W.bat ',...
        'gdal_calc.py '];
    command = ['gdal_calc.py '];
    
    foo = [];
    for i=1:cntimg
        foo = [foo, ' -',band(i),' ', images(i,1:length(images(i,:))-4),'_UTM_',num2str(cell(j)),'m_avg.tif'];
    end
    command = [command, foo,' --outfile=GeoTIFF_MEAN_UTM_',num2str(cell(j)),'m_avg.tif'];
    command = [command, ' --calc="(']; %A+B)/2"']
    foo = [];
    for i=1:cntimg
        foo = [foo, band(i),' + '];
    end
    command = [command, foo(1:length(foo)-2),') / ', num2str(cntimg),'"'];
    command = [command,' --NoDataValue=0 &'];
    disp(command);
end

function [  ] = GT_csv2shp(  )
fid = fopen('master_slave.vrt','w');
fprintf(fid,'<VRTDataset rasterXSize="%s" rasterYSize="%s">\n',num2str(pixels),num2str(lines));
fprintf(fid,'\t<VRTRasterBand dataType="%s" band="1" subClass="VRTRawRasterBand">\n', format);
fprintf(fid,'\t\t<SourceFilename relativetoVRT="1">master_slave.coh</SourceFilename>\n');
fprintf(fid,'\t\t<ImageOffset>0</ImageOffset>\n');
fprintf(fid,'\t\t<PixelOffset>%s</PixelOffset>\n',num2str(byte));
fprintf(fid,'\t\t<LineOffset>%s</LineOffset>\n',num2str(pixels*byte));
fprintf(fid,'\t\t<ByteOrder>LSB</ByteOrder>\n');
fprintf(fid,'\t</VRTRasterBand>\n');
fprintf(fid,'</VRTDataset>\n');
fclose(fid);






pathtoGDAL = 'D:\GeoTools\OSGeo4W\bin\';
tool = 'ogr2ogr';
attributes = '-f "ESRI Shapefile"';
outfile = 'Shanghai_Locals_2014-01to06_transformed.shp';
file = 'Shanghai_Locals_2014-01to06_transformed.vrt';
command = [pathtoGDAL, tool,' ',attributes,' ',outfile,' ',file];
system(command);
end


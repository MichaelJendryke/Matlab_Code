[A, R] = geotiffread('GeoTIFF_1_mean_UTM.tif');
t = 12501;
l = 9001;
h = 5000;
w = 5000;
s = A(t:t+h,l:l+h);

%imshow(s);

%s = phantom(512) + randn(512);
num_iter = 15;
delta_t = 1/7;
kappa = 30;
option = 1; % privileges high-contrast edges over low-contrast ones. 
%option = 2; % privileges wide regions over smaller ones. 
ad1 = anisodiff2D(s,num_iter,delta_t,kappa,option);
ad2 = anisodiff2D(s,num_iter,delta_t,kappa,option);
ad3 = anisodiff2D(s,num_iter,delta_t,kappa,option);
figure, subplot 221, imshow(s,[]), subplot 222, imshow(ad1,[]), subplot 223,imshow(ad2,[]),subplot 224,imshow(ad3,[])
    
    for i=1:10
        num_iter = 15;
        delta_t = 1/7;
        kappa = 30;
        option = 1; % privileges high-contrast edges over low-contrast ones.
        
        
        [A, R] = geotiffread(strcat('GeoTIFF_',num2str(i),'_mean_UTM.tif'));
        B = BLOCKPROC(A,[16 16],anisodiff2D,A,num_iter,delta_t,kappa,option);
        B = anisodiff2D(A,num_iter,delta_t,kappa,option);
        geotiffwrite(strcat('GeoTIFF_',num2str(i),'_mean_filtered_UTM.tif'),B,R);
        
    end
  
    
    
  figure  
  for i=5:5:25
      
      num_iter = i;
      B = anisodiff2D(A,num_iter,delta_t,kappa,option);
      figure; imshow(B(2400:2800,800:1200)), title(strcat('iterations: ',num2str(i), ' kappa: ',num2str(kappa),' delta_t: ', num2str(delta_t)));
      
  end
    
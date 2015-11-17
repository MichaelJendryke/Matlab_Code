%convert Coherence image to points
%extract weibo number from weibo raster with point
shapes = {'GeoTIFF_MEAN_UTM_50m_avg_CohWei.shp',...
    'GeoTIFF_MEAN_UTM_100m_avg_CohWei.shp',...
'GeoTIFF_MEAN_UTM_200m_avg_CohWei.shp',...
'GeoTIFF_MEAN_UTM_250m_avg_CohWei.shp',...
'GeoTIFF_MEAN_UTM_400m_avg_CohWei.shp',...
'GeoTIFF_MEAN_UTM_500m_avg_CohWei.shp',...
'GeoTIFF_MEAN_UTM_800m_avg_CohWei.shp',...
'GeoTIFF_MEAN_UTM_1000m_avg_CohWei.shp',...
'GeoTIFF_MEAN_UTM_1600m_avg_CohWei.shp',...
'GeoTIFF_MEAN_UTM_2000m_avg_CohWei.shp'};

%shapes = {'GeoTIFF_MEAN_UTM_400m_avg_CohWei.shp'};


cell = [50,100,200,250,400,500,800,1000,1600,2000];


%reference 100m cell = 50 messages
ref = [11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40];
ref = [22];
ref = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50];
ref = [24];
ref = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];
ref = [6];

cohThresholds = [0.40,0.425,0.45,0.475,0.5,0.525,0.55,0.575,0.6];%coherence Threshold
cohThresholds = [0.5];

table = zeros((length(cell)*length(cohThresholds)*length(ref)),5);
idx=0;
%move through reference areas
for a=1:length(ref)
    %move through different Coherence Thresholds
    for c=1:length(cohThresholds);
        cohT = cohThresholds(c);
        %move through all the shapes
        for s=1:length(shapes)
            weiT = cell(s)*cell(s)/10000*ref(a);%number of Messages per cell
            idx=idx+1;
            table(idx,1)=ref(a);
            table(idx,2)=cell(s);
            table(idx,3)=cohT;
             table(idx,4)=weiT;
            
            
            S = shaperead(shapes{s});
            coh = zeros(length(S),1);
            wei = zeros(length(S),1);
            for i=1:length(S)
                coh(i)=S(i).GRID_CODE;
                wei(i)=S(i).RASTERVALU;
                %disp(i)
            end
            
            cohThreshold = coh;
            cohThreshold(cohThreshold<cohT)=0;
            cohThreshold(cohThreshold>=cohT)=1;
            
            weiThreshold = wei;
            weiThreshold(weiThreshold<weiT)=0;
            weiThreshold(weiThreshold>=weiT)=1;
            
            comp = [cohThreshold,weiThreshold];
            
            match = 0;
            zeromatch = 0;
            missmatch = 0;
            
            coh1wei1 = 0;
            coh0wei0 = 0;
            coh1wei0 = 0;
            coh0wei1 = 0;
            
            for i=1:length(comp)
                if comp(i,1)==1 && comp(i,2)==1
                    match = match + 1;
                end
                if comp(i,1)==0 && comp(i,2)==0
                    zeromatch = zeromatch + 1;
                end
                if comp(i,1)~= comp(i,2)
                    missmatch = missmatch + 1;
                end
                
                if comp(i,1)==1 && comp(i,2)==1
                    coh1wei1 = coh1wei1 + 1;
                end
                if comp(i,1)==0 && comp(i,2)==0
                    coh0wei0 = coh0wei0 + 1;
                end
                if comp(i,1)==1 && comp(i,2)==0
                    coh1wei0 = coh1wei0 + 1;
                end
                if comp(i,1)==0 && comp(i,2)==1
                    coh0wei1 = coh0wei1 + 1;
                end
            end
            if (match+zeromatch+missmatch)==length(comp) && (coh1wei1 + coh0wei0 + coh1wei0 + coh0wei1) == length(comp)
                disp('perfect!')
            end
            fprintf('**************************\n');
            fprintf('Name: %s Coh: %2f Msg: %i \n',shapes{s},cohT,weiT);
            fprintf('    Match %2f percent\n',(100/length(comp))*(match+zeromatch));
            fprintf('MissMatch %2f percent\n',(100/length(comp))*(missmatch));
           
            fprintf('%2f percent are BuA \n',((100/(coh1wei1+coh1wei0+coh0wei0+coh0wei1))*(coh1wei1+coh1wei0)));
            fprintf('%2f percent of the urban area show Weibo messages \n',((100/(coh1wei1+coh1wei0))*coh1wei1));
            fprintf('%2f percent of the non urban area show Weibo messages \n',((100/(coh0wei1+coh0wei0))*coh0wei1));
            
            fprintf('CASE1: coh1wei1 %i cells are Urban and have WeiboMessge\n',coh1wei1);
            fprintf('CASE2: coh0wei1 %i cells have Weibo Messages but no Urban \n',coh0wei1);
            fprintf('CASE3: coh1wei0 %i cells are Urban but NO Weibo Messages\n',coh1wei0);
            fprintf('CASE4: coh0wei0 %i cells are NOT Urban and have NO Weibo Messge\n',coh0wei0);
            %     Cmatrix=[coh1wei1,coh1wei0;coh0wei1,coh0wei0];
            %     [p,x2] = chisquarecont(Cmatrix);
            %     fprintf('P-value = %s x2 = %s\n',num2str(p),num2str(x2));
            %
            
            
            table(idx,5)=(100/length(comp))*(match+zeromatch);
        end
    end
end



disp('numbers')
[         coh1wei1,         coh0wei1,                  coh1wei1+coh0wei1;
          coh1wei0,         coh0wei0,                  coh1wei0+coh0wei0;
 coh1wei1+coh1wei0,coh0wei1+coh0wei0,coh1wei1+coh1wei0+coh0wei1+coh0wei0]
disp('percentage')
[ 100/coh1wei1+coh1wei0*coh1wei1,         100/coh0wei1+coh0wei0*coh0wei1,                  coh1wei1+coh0wei1;
  100/coh1wei1+coh1wei0*coh1wei0,         100/coh0wei1+coh0wei0*coh0wei0,                  coh1wei0+coh0wei0;
 coh1wei1+coh1wei0,coh0wei1+coh0wei0,coh1wei1+coh1wei0+coh0wei1+coh0wei0]


% x = cohThreshold;
% y = weiThreshold;
% 
% C = cov(x,y);
% p=C(2)/(std(x)*std(y))
% coeff = C(1,2) / sqrt(C(1,1) * C(2,2))
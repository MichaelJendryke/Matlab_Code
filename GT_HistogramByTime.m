conn = database('weiboDEV','','',...
   'Vendor','Microsoft SQL Server','Server','localhost',...
   'AuthType','Windows','portnumber',123456)
sqlquery = 'use weiboDEV Select count(msgID)as NumberOfMessages, YEAR([createdAT]) as YYYY, MONTH([createdAT]) as MM,DAY([createdAT]) as DD from [dbo].[Shanghai_262] Group by YEAR([createdAT]),MONTH([createdAT]),DAY([createdAT])Order by YYYY asc, MM asc,DD asc'
results = fetch(conn,sqlquery)


start = 519;

x = date(start:end,1)

figure;
f = bar(x,date(start:end,2));
ax = gca;
ax.XTick = date(start:end,1);
set(gca,'xTickLabel',date(start:end,1))
th=rotateticklabel(gca,90); 



xticklabel_rotate;
set(gca,'XMinorTick','on','YMinorTick','on')



length(date)
strrep(date(1,:),' ','0')
plot(x,Hist(:,1))



set(gca,'XTickLabel',date)
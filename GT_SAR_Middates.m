function [ output_args ] = Untitled( input_args )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

d = dir;
dates = struct('master',{},'slave',{},'days',{},'mid',{})
x = 0;
for i=3:length(d)
    if (d(i).isdir ==1 && length(d(i).name)>=17)
        
        m=datenum(d(i).name(1:8)  ,'yyyymmdd');        % convert to number
        s=datenum(d(i).name(10:17),'yyyymmdd');        % convert to number
        difference=abs(m-s);
        mid = m+datenum(difference/2);
        x= x+1;
        dates{x}.master = m;
        dates{x}.slave = s;
        dates{x}.days = difference;
        dates{x}.mid = mid;
        
    end
end

m = [];
s = [];
days = [];
for i=1:length(dates)
m = [m; dates{i}.master];
s = [s; dates{i}.slave];
days = [days; dates{i}.days];

end

mind=min(min(m),min(s));
maxd=max(max(m),max(s));
diffd = maxd-mind;
x = linspace(mind,maxd,diffd);
y = linspace(0,length(dates),length(dates));

cutoff=500;
counter =0;
numberofimages = 3;
newmaster = mind;
for i=1:length(m)
    counter = counter+1;
    if days(i)<=cutoff
        axis([mind-100 maxd+100 -10 length(dates)+10])
        plot(m(i),i,'ob',s(i),i,'or');
        hold on;
        plot([m(i) s(i)],[i i],'k')
        hold on;
        text(s(i)+10,i,strcat(datestr(m(i),'yyyymmdd'),datestr(s(i),'yyyymmdd')));
        hold on;
    end
  
end

plot(s,'o');


function out=read_metstation_bow(fname)
%
% out=read_metstation_bow(fname)
% where fname is the filename of the raw data.
%
% Read the metstation bow data on board the Oceanus. Called by
% make_das_oceanus
%
% Originally written by Sasha Perlin
% updated and commented by Sally Warner, January 2014
%
fid=fopen(fname);
data=textscan(fid,'%s',1e6,'delimiter','\r');
fclose(fid);
data=char(data{:});
ik=strmatch('META_DATA_PRECISION',data);
out.readme=data(1:ik,:);
out.readme=char('Main metstation',...
    'T_air - air temperature [degC]',...
    'RH - relative humidity [%]',...
    'T_wetbulb - wet bulb temperature [degC]',...
    'T_dewpoint - dewpoint temperature [degC]',...
    'AH - absolute humidity [g/m^3]',out.readme);
tt=data(ik+1:end,:);
tt(:,end+1)=',';
frm='%s %s %s %f %s %f %s %f %s %f %s %s %s %s %s %s %s';
data=textscan(tt',frm,size(tt,1),'delimiter',',','bufsize',1e6);
tm=char(data{2});
if strcmp(tm(1,1),'"') == 1
    tm = tm(:,2:end-1);
end
out.time=datenum(tm(:,1:10))+datenum(tm(:,12:23))-fix(datenum(tm(:,12:23)));
out.T_air=data{4};
out.RH=data{6};
out.T_wetbulb=data{8};
out.T_dewpoint=data{10};
out.AH=str2num(char(data{12}));

end % function out=read_metstation_bow(fname)


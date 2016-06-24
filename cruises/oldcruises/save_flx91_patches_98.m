% set variables
profile_num=[];
start_depth=[];
end_depth=[];
depth=[];
fallspd=[];
theta=[];
sal=[];
sigth=[];
nu=[];
buoy_freq=[];
lt=[];
eps=[];
eps1=[];
eps3=[];
w2=[];

% load patches data set
load patches_98a.txt
a=patches_98a;
dat.prof=a(:,1);
dat.start_depth=a(:,2);
dat.end_depth=a(:,3);

% open data files
%for ipx=1:1:1;
for ipx=1:1:length(dat.prof);
q.script.num=dat.prof(ipx);
q.script.prefix='bflx91';
q.script.pathname='r:\data\tmp\';
clear cal data

raw_load

cali_flx91

%do other stuff
idx=find(cal.P > dat.start_depth(ipx) & cal.P < dat.end_depth(ipx));

cal.W2=(cal.W).^2;
head.irep.W2=head.irep.W;
head.sensor_index.W2=head.sensor_index.W;

cal.S2=cal.WP; %assign W' to S2 for use in average_data
head.irep.S2=head.irep.WP;
head.sensor_index.S2=head.sensor_index.WP;

dz(ipx)=dat.end_depth(ipx)-dat.start_depth(ipx); %use for average_data bin size

rho=cal.SIGTH(1:1:length(cal.SIGTH)-1);
g=9.81;
rhoav=1023;
cal.BV2=(g/rhoav).*diff(cal.SIGTH_ORDER)./diff(cal.P)
cal.BV2(length(cal.BV2)+1)=cal.BV2(length(cal.BV2));
head.irep.BV2=head.irep.P;
cal.VARLT=(cal.THORPE-mean(cal.THORPE)).^2; %variance Thorpe scale 
head.irep.VARLT=head.irep.THORPE;
cal.VARAZ=(cal.AZ-mean(cal.AZ)).^2; %variance of AZ
head.irep.VARAZ=head.irep.AZ;

avg=average_data({'P','FALLSPD','THETA','SAL','SIGTH','SIGTH_ORDER','BV2','VARLT','epsilon1','epsilon2','W2','varaz'},'min_bin',dat.start_depth(ipx),'max_bin',dat.end_depth(ipx),'binsize',dz(ipx)-.001,'nfft',256)

% correct epsilon2 if using W'
avg.EPSILON2=2.*avg.EPSILON2;

% flag AZ vibrations
idaz=find(avg.VARAZ>3.e-05);
avg.EPSILON1(idaz)=NaN;
avg.EPSILON2(idaz)=NaN;
avg.EPS=(avg.EPSILON1+avg.EPSILON2)./2;

% save averaged data
profile_num=[profile_num dat.prof(ipx)];
start_depth=[start_depth dat.start_depth(ipx)];
end_depth=[end_depth dat.end_depth(ipx)];
depth=[depth avg.P];
fallspd=[fallspd avg.FALLSPD];
theta=[theta avg.THETA];
sal=[sal avg.SAL];
sigth=[sigth avg.SIGTH];
nu=[nu sw_visc(avg.SAL,avg.THETA,avg.P)];
buoy_freq=[buoy_freq sqrt(avg.BV2)]; %buoyancy frequency
lt=[lt sqrt(avg.VARLT)]; %rms thorpe scale
eps1=[eps1 avg.EPSILON1];
eps3=[eps3 avg.EPSILON2];
eps=[eps avg.EPS];
w2=[w2 avg.W2];

%clear bv rho idx head cond temp press inds cal data avg

end

save patches_flx91_98 profile_num start_depth end_depth depth fallspd ...
   nu theta sal sigth buoy_freq lt eps eps1 eps3 w2

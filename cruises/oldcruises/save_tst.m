% test things

% Script to calibrate sensors:

% First one might want to modify the header coefficients

if head.coef.AX==[2.5 1.25 0 0 1]
   head.coef.AX=[-2 0.8 0 0 1];
end
if head.coef.AY==[2.5 1.25 0 0 1]
   head.coef.AY=[-2 0.8 0 0 1];
end
if head.coef.AZ==[2.5 1.25 0 0 1]
   head.coef.AZ=[-2 0.8 0 0 1];
end

head.coef.S1(1)=0.0000471;

% calibrate is called as 
% calibrate('series','method',{'filter1','filter2',...})
% where series is the series to calibrate ( 'T1', 'TP2', 'S1', 'UC', etc.)
% and method is the method to use ('T','TP','S','UC', etc.)
% filter is 'Axxx' where A is h,l,n for highpass, lowpass or notch filter
% and xxx is the cutoff frequency.  If A='n', then Axxx='n20-25' would notch
% out the frequencies between 20 and 25 Hz.
% NOTE: series could be 'temp' if data.TEMP coef.TEMP and irep.TEMP all exist
% prior to calling calibrate.

calibrate('p','p','l2')
calibrate('p','fallspd','l2') 
calibrate('az','az')
calibrate('ay','tilt')
calibrate('ax','tilt')

data.T=data.T/head.coef.T(5);
calibrate('t','t');
data.C=data.C/head.coef.C(5);
calibrate('c','c');

calc_salt('sal','c','t','p');
calc_theta('theta','sal','t','p');
calc_sigma('sigth','sal','t','p');

inds=calc_order('sigth','P');
inds=calc_order('t','P');

q.fspd=mean(cal.FALLSPD);

calibrate('s1','s',{'l25','h0.5'})
%calibrate('wp','wp',{'l30'})
calibrate('wp','wp',{'l25','h0.5'})

% filter and calibrate w
filter_w

%Determine the cutoff frequency for w:
% this should be a cutoff frequency at 3m.
%freq=num2str(3*q.fspd/100/3) ;
%calibrate('w','w',{['h' freq]})
%spd=q.fspd;
%sp=1/head.coef.W(2);
%rho=1.024;
%calibrate('w','volts',{'l20',['h' freq]});
%cal.W=cal.W./(2*rho*spd.*sp);

%correct_w

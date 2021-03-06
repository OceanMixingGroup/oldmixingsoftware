% script to read marlin mat files 

% specify Marlin tow number(s)
itow=[3:8 10:15];

for it=itow
   
str_it=num2str(it+100);

if it == 3
   iprof=[677:979]; %tow03
elseif it == 4
   iprof=[989:1286]; % tow04
elseif it == 5
   iprof=[1276:1681]; % tow05
elseif it == 6
   iprof=[1703:2086]; %tow06
elseif it == 7
   iprof=[2090:2460]; % tow07
elseif it == 8
   iprof=[2467:2699]; %tow08
elseif it == 10
   iprof=[2864:3076]; %tow10
elseif it == 11
   iprof=[3077:3365]; %tow11
elseif it == 12
   iprof=[3367:3710]; %tow12
elseif it == 13
   iprof=[3719:4060]; %tow13
elseif it == 14   
   iprof=[4083:4370]; % tow14
elseif it == 15   
   iprof=[4372:4453]; % tow 15
end

[lx ly]=size(iprof);
time_avg=1;
ll=ly*320/time_avg; % factor to presize the arrays
marlin.time=nan*ones(1,ll);
marlin.ptime=nan*ones(1,ll);
%fallspd=nan*ones(1,ll);
%vx=nan*ones(1,ll);
marlin.press2=nan*ones(1,ll);
marlin.t1=nan*ones(1,ll);
marlin.t2=nan*ones(1,ll);
%marlin.t3=nan*ones(1,ll);
marlin.t4=nan*ones(1,ll);
%marlin.t5=nan*ones(1,ll);
%marlin.tf2=nan*ones(1,ll);
%marlin.tf3=nan*ones(1,ll);
%marlin.tf4=nan*ones(1,ll);
marlin.c1=nan*ones(1,ll);
marlin.c2=nan*ones(1,ll);

icnt=0;

fout=['d:\analysis\m99b\marlin\tow',str_it(2:3),...
      '\summary_files\m99b_TC_tow',str_it(2:3)];

for ip=iprof
   fname=['d:\analysis\m99b\marlin\tow',str_it(2:3),...
         '\temperature\m99b_TC_cal',num2str(ip),'.mat'];
   if exist(fname) ~= 0
   eval(['load ' fname])
   disp(fname)
   
% find length of data set
len=length(avg.P2);
icnt=icnt+len;

% make arrays
%fallspd(icnt-len+1:icnt)=avg.FALLSPD;
%vx(icnt-len+1:icnt)=avg.VX;
marlin.time(icnt-len+1:icnt)=avg.TIME;
marlin.ptime(icnt-len+1:icnt)=avg.PTIME;
marlin.press2(icnt-len+1:icnt)=avg.P2;
marlin.t1(icnt-len+1:icnt)=avg.T1;
marlin.t2(icnt-len+1:icnt)=avg.T2;
%marlin.t3(icnt-len+1:icnt)=avg.T3;
marlin.t4(icnt-len+1:icnt)=avg.T4;
%marlin.t5(icnt-len+1:icnt)=avg.T5;
%marlin.tf2(icnt-len+1:icnt)=avg.TF2;
%marlin.tf3(icnt-len+1:icnt)=avg.TF3;
%marlin.tf4(icnt-len+1:icnt)=avg.TF4;
marlin.c1(icnt-len+1:icnt)=avg.C1;
marlin.c2(icnt-len+1:icnt)=avg.C2;

end

end

eval(['save ' fout ' marlin '])

end
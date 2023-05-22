for DEVRIM=1:2
    if DEVRIM==1
syms q0 q1 q2 a1 a2 a3;
disp('PART A')
fprintf('\n\n')
    else
    q0=.3;q1=.4;q2=.3;
    a1=.3;a2=.2;a3=.05;
    disp('PART B')
fprintf('\n\n')
    end
    
P=sym('b%d',[13 13]);
for i=1:13
for j=1:13
P(i,j)=0;
end
end
clear j

P(1,1)=q0;
P(1,2)=q1;
P(1,11)=q2;

P(2,1)=a1*q0;
P(2,2)=a1*q1;
P(2,3)=(1-a1)*q0;
P(2,5)=(1-a1)*q1;
P(2,8)=(1-a1)*q2;
P(2,11)=a1*q2;

P(3,1)=a2*q0;
P(3,2)=a2*q1;
P(3,4)=(1-a2)*q0;
P(3,6)=(1-a2)*q1;
P(3,9)=(1-a2)*q2;
P(3,11)=a2*q2;
P(4,1)=q0;
P(4,2)=q1;
P(4,11)=q2;

P(5,1)=a1*a2*q0;
P(5,2)=a1*a2*q1;
P(5,3)=(1-a1)*a2*q0;
P(5,4)=a1*(1-a2)*q0;
P(5,5)=a2*(1-a1)*q1;
P(5,6)=a1*(1-a2)*q1;
P(5,7)=(1-a1)*(1-a2);
P(5,8)=a2*(1-a1)*q2;
P(5,9)=a1*(1-a2)*q2;
P(5,11)=a1*a2*q2;

P(6,1)=a1*q0;
P(6,2)=a1*q1;
P(6,3)=(1-a1)*q0;
P(6,5)=(1-a1)*q1;
P(6,8)=q2*(1-a1);
P(6,11)=q2*a1;

P(7,1)=a2*q0;
P(7,2)=a2*q1;
P(7,4)=(1-a2)*q0;
P(7,6)=(1-a2)*q1;
P(7,9)=q2*(1-a2);
P(7,11)=a2*q2;

P(8,1) = q0*a1*a1*a2;
P(8,2) = q1*a1*a1*a2;
P(8,3) = q0*a2*a1*(1-a1)*2;
P(8,4) = q0*a1*a1*(1-a2);
P(8,5) = q1*a1*(1-a1)*a2*2;
P(8,6) = q1*a1*a1*(1-a2);
P(8,7) = (1-a2)*(1-a1)*a1*2;
P(8,8) = q2*a1*(1-a1)*a2*2;
P(8,9) = q2*(1-a2)*a1*a1;
P(8,10) = (1-a1)*(1-a1)*(1-a2);
P(8,11) = q2*a2*a1*a1;
P(8,12) = (1-a1)*(1-a1)*a2;

P(9,1) = q0*a1*a1;
P(9,2) = q1*a1*a1;
P(9,3) = a1*(1-a1)*q0*2;
P(9,5) = q1*a1*(1-a1)*2;
P(9,8) = q2*(1-a1)*a1*2;
P(9,11) = q2*a1*a1;
P(9,12) = (1-a1)*(1-a1);

P(10,1) = a2*a2*q0;
P(10,2) = q1*a2*a2;
P(10,4) = a2*(1-a2)*q0*2;
P(10,6) = q1*(1-a2)*a2*2;
P(10,9) = q2*a2*(1-a2)*2;
P(10,11) = q2*a2*a2;
P(10,13) = (1-a2)*(1-a2);

P(11,1) = q0*a1*a1;
P(11,2) = a1*a1*q1;
P(11,3) = a1*(1-a1)*2*q0;
P(11,5) = a1*(1-a1)*q1*2;
P(11,8) = a1*(1-a1)*q2*2;
P(11,11) = a1*a1*q2;
P(11,12) = (1-a1)*(1-a1);

P(12,1) = a2*a2*q0;
P(12,2) = q1*a2*a2;
P(12,4) = a2*(1-a2)*q0*2;
P(12,6) = a2*(1-a2)*q1*2;
P(12,9) = q2*a2*(1-a2)*2;
P(12,11) = q2*a2*a2;
P(12,13) = (1-a2)*(1-a2);

P(13,1) = q0;
P(13,2) = q1;
P(13,11) = q2;


Coef=P.';
for i=1:13
  Coef(i,i)=Coef(i,i)-1;  
end
 Coef(13,:)=1;
 Sol=zeros(13,1);
 Sol(13,1)=1;
PI=linsolve(Coef, Sol);
clear Sol
STATES=[0 0 0;1 0 0;0 1 0;0 0 1;1 1 0;1 0 1;0 1 1; 2 1 0; 2 0 1; 0 2 1; 2 0 0;0 2 0;0 0 2 ];

 for i=1:13
   fprintf('In the state when there is %d car in operation 1,%d car in operation 2,%d car in operation 3\n',STATES(i,1),STATES(i,2),STATES(i,3))   
     if DEVRIM==1
         disp(PI(i,1))
     fprintf('\n')
     else
      disp(double(PI(i,1)))
     fprintf('\n')   
        end
 end
 %1
 disp('1')
 %Define r(j,k) man hour requirments for each operation
if DEVRIM==1  
    R=sym('r',[2 3]);
else
R=[3 4.5 5.9; 4.4 3.8 5.3];    
end
 %Define A matrix of DWL(s,k) daily workload of labour with skill k in any
 %day which state is s.
 DWL=sym('b%d',[13 2]);
 DWL2=sym('b%d',[13 2]);
 for s=1:13
     for k=1:2
         TP=0;
         for f=1:3
            TP= TP+R(k,f)*STATES(s,f);  
         end   
       if DEVRIM==2  
      DWL(s,k)=min(8,TP);    %will be used if any data provided
      DWL2(s,k)=max(8,TP);      %will be used in part 2
       else   
           DWL(s,k)=TP;
       end
     end
 end
 
 disp('Daily needed workload of labour with skill k in any day which state is s is shown in matrix DWL')
 disp(DWL)
 if DEVRIM==1
 disp('Expected total daily workload of worker with skill k is ETDWL(k)=Transpose(PI)*(min(DWL,8)) ')
 else
 disp('Expected total daily workload of worker with skill k is ETDWL(k)=DWL*PI ')  
 ETDWL=PI.'*DWL;
 disp(double(ETDWL))
 end
 fprintf('\n')
%  2
disp('2')
% If any value in DWL matrix esceeds 8 this excess time is assigned to utility labour.
%  Also since utitity labours are unform and multiclear skilled no need to think
%  operation based

%ETDWLU=sum((max(DWL,8)-8),2)*PI; will be used if any data provided
 if DEVRIM==1
 disp('Expected total daily workload of Utility workers is ETDWLU=Transpose(PI)*sum((max(DWL,8)-8),2) ')
 else
     
   ETDWLU=PI.'*sum(((DWL2)-8),2);
   disp('Expected total daily workload of Utility workers is ETDWLU=Transpose(PI)*sum((max(DWL,8)-8),2) ')
   disp(double(ETDWLU))
 end
% 3
disp('3')

numberofcarso1 = zeros(1,13); 
numberofcarso2 = zeros(1,13); 
numberofcarso3 = zeros(1,13);  
     for i=1:13
         numberofcarso1(1,i) = STATES(i,1); %To find number of cars at a day under 1st operation in each state.
         numberofcarso2(1,i) = STATES(i,2); %To find number of cars at a day under 2nd operation in each state.
         numberofcarso3(1,i) = STATES(i,3); %To find number of cars at a day under 3rd operation in each state.
     end
   expnumberofcarso1= numberofcarso1*PI;
   expnumberofcarso2= numberofcarso2*PI;
   expnumberofcarso3= numberofcarso3*PI;
 
   disp('# of cars at a day under 1st operation in each state is as follows')
   disp(numberofcarso1)
     disp('# of cars at a day under 2nd operation in each state is as follows')
   disp(numberofcarso2)
     disp('# of cars at a day under 3rd operation in each state is as follows')
   disp(numberofcarso3)
 for k=1:3
     if DEVRIM==1
 fprintf('Expected # of cars in a day under operation %d is expnumberofcarso1%d = numberofcarso%d*PI\n',k,k,k)
     else
         expnumberofcarso=zeros(1,3);
         expnumberofcarso=[expnumberofcarso1  expnumberofcarso2    expnumberofcarso3 ];
  fprintf('Expected # of cars in a day under operation %d is expnumberofcarso%d=%f\n',k,k,expnumberofcarso(k))    
     end
     
     end
 
%  4
 disp('4')
 
 numberofcarsinsystem = zeros(1,13); %To find number of cars in each states.
 for i=1:13
     for j=1:3
         numberofcarsinsystem(1,i) = STATES(i,j) + numberofcarsinsystem(1,i);
     end
 end
 expnofc=numberofcarsinsystem*PI; %Expected number of cars in a repair shop in a day
 
 disp('# of cars in system in state s is given in numberofcarsinsystem(s)')
 disp('Expected # of cars in system is given in below')
 disp('expnofc=numberofcarsinsystem*PI')
 disp(expnofc);
 
% 5
disp('5')
% ASSUMPTION: We assumed that if two cars arrives at the same time they
% counted s two acceptance
disp(' ASSUMPTION: We assumed that if two cars arrives at the same time they counted s two acceptance')
disp('ASSUMTION FOR CASE 1: we assumed that the acceptance rate is the sum of states that the acceptance occured per day and  We assumed that if two cars arrives at the same time they counted as one acceptance ')
%In order to determine the acceptance rate we need to check the # of cars
%in first operation

% NFS(s)=number of cars in state s, under operation 1
NFS=STATES(:,1);
Ad=((NFS==0)-1)*(-1);
disp('# of cars in first state is given in NFS(s) matrix')
disp(NFS)
disp('Daily acceptance rate for Case 1 can be found as Transpose(NFS)*PI');
AR1=(Ad.')*PI;
disp(AR1)
disp('ASSUMTION FOR CASE 2:we assumed that the acceptance rate is the sum of states that the acceptance occured per day and  We assumed that if two cars arrives at the same time they counted s two acceptance , per day ')
ARM=[STATES(:,1) (STATES(:,2)+STATES(:,3))];
PIT=sym('b%d',[1 13]);
AR2=(NFS.')*PI;
disp('Daily acceptance rate for Case 2 can be found as AR2=Transpose(NFS)*PI');
disp(AR2)



%6
disp('6')
%In order to determine the expected time between two admission we need to
%find the admission rate.
disp('In order to determine the expected time between two admission we need to find the admission rate.')
NFS=STATES(:,1);
disp('Admission is occured if the element of Ad is 1, not occured is it is 0')
disp('Ad')
disp(Ad)
disp('Daily acceptance rate had been found as Transpose(Ad)*PI');
ARR=(Ad.')*PI;
Ans=1/ARR;
disp('expected time between two admission');
disp(Ans)

% 7
disp('7')
% Expected profit=revenue-cost
% cost factors: regular workers, utility workers, fixed cost for unrepaired
% cars.
if DEVRIM==1
syms c1 c2 p w ETDWL ETDWLU;
UWC=ETDWLU*c2;
else
   c1=10;
   c2=12;
   p=800;
   w=100;  
end
RWC=sum(ETDWL)*c1;
UWC=ETDWLU*c2;
TD=0;% total departures
for i=1:13
    if STATES(i,3)==0
        TD=TD+0;
    elseif STATES(i,3)==1
        TD=TD+(1-a3)*PI(i);
    else
       TD=TD+(1-a3)*a3*2*PI(i)+((1-a3)^2)*2*PI(i); %2*(1-a3) because 2 car left successfully      
    end  
end
TR=p*TD; %total revenue
% Total cars left because they didn' fixed is found by the difference
% between total arrival rate and total succesfull departure
TCL=AR2-TD; %total car left
fc=TCL*w;
TP=TR-fc-RWC-UWC;
disp(' Expected profit=revenue-cost')
disp('Cost factors: regular workers, utility workers, fixed cost for unrepaired cars')
disp('TP=TR-fc-RWC-UWC')
disp('total profit is equal to:')
if DEVRIM==1
disp(TP)
else
    disp(double(TP))
end

fprintf('\n\n')
% clear all
end












 
 

function Sensitivity_Analyzer(S,B,s1,s2)

A=zeros(B+2*S-s1,B+2*S-s1);
A(1,1)=24; A(1,2)=-16; % special equation for first state
for i=2:s2+B
  A(i,i)=40; A(i,i-1)=-24; A(i,i+1)=-16;    % same equation for all between -B and s2
end
A(s2+B+1,s2+B+1)=28;A(s2+B+1,s2+B)=-24;A(s2+B+1,s2+2+B)=-16;  %special equation for state s2
for i=s2+B+2:S+B-1
    A(i,i)=28; A(i,i-1)=-12; A(i,i+1)=-16;     %same equation for all between s2+1 and S-2
    if i==s1+B+1
      A(i,B+2*S-s1)=-16;      %except state of having s1 inventory 
    end
end
A(B+S,B+S)=28; A(B+S,B+S-1)=-12;  %special state of S-1
A(B+S+1,B+S+1)=16; A(B+S+1,B+S)=-12;        %special state of S
for i=B+S+2:B+2*S-s1-1
    A(i,i-1)=-16; A(i,i)=16;            % for states that production does not occur
end
A(B+2*S-s1,:)=1;                %Normalization equation

%disp(A)
C=zeros(B+2*S-s1,1);
C(B+2*S-s1,1)=1;            %solving system of linear equation
%disp(C)
PI=linsolve(A,C);

Revenue=16*(1-PI(1))*80;
Fixedcost=PI(B+2*S-s1)*16*100;      %depend on when setup is made
Variablecost=(sum(PI(1:s2+B))*24+sum(PI(s2+B+1:S+B))*12)*20;
%holdingcost=(sum(PI(1:s2+B))*24+sum(PI(s2+B+1:S+B))*12-16*(1-PI(1)))*9;
holdingcost=[(1:S) ((S-1):-1:(s1+1))]*PI(B+2:end)*9;
Demandlostcost=(16*PI(1))*20;
%Backordercost=sum(PI(2:(B+1)))*16*8;
Backordercost=((B:-1:1)*PI(1:B))*8;
Profit=Revenue-Fixedcost-Variablecost-holdingcost-Demandlostcost-Backordercost;
a1=sum(PI((S+B+1):end));
fprintf('Fraction of time that there is no production is equal to %d\n',a1)
a2=sum(PI((B+1+s2):(B+S)));
fprintf('Fraction of time that only one machine is working is equal to %d\n',a2)
a3=sum(PI(1:(B+s2)))+.5*sum(PI((B+s2+1):(S+B)));
fprintf('Average utilization of machines is equal to %d\n',a3)
a4=[(1:S) ((S-1):-1:(s1+1))]*PI(B+2:end);
fprintf('Expected inventory level is equal to %d\n',a4)
a5=((B:-1:1)*PI(1:B));
fprintf('Expected backorder level  is equal to %d\n',a5)

disp('Pi matrix is as follows')
disp(PI)





end



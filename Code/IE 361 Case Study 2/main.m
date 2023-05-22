Smax=input('Please input maximum allowable inventory level');
Bmax=input('Please input maximum allowable back ordering level');
Max=0;
for B=0:Bmax
    for S=1:Smax
        for s1=(2-B):(S-1)
            for s2=(1-B):(s1-1)
                candidate=profit_Finder(S,B,s1,s2);
                 if candidate>Max
                     solution=[S,B,s1,s2] ;
                 end
                 Max=max(Max,candidate);
             end
        end
    end
end
disp(solution)
disp(Max)
Sensitivity_Analyzer(solution(1),solution(2),solution(3),solution(4))
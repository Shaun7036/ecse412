

%general outer loop

%set up memory array


A1 = 75;
A2 = 51;
B1 = 9;
B2 = 7;

GA = 0.3;
GB = 0.4;
GC = 0.5;

KA = 1/(A1*A2);
KB = 1/(B1*B2);



xTotal = [];
yTotal = [];
yA1Total = [];
yA2Total = [];
yA3Total = [];
yA4Total = [];
yB1Total = [];
yB2Total = [];
yB3Total = [];
yC1Total = [];
nTotal = 0;


%iterate through frames:
    
    x = [];
    y = [];
    yA1 = [];
    yA2 = [];
    yA3 = [];
    yB1 = [];
    yB2 = [];
    yB3 = [];
    yC1 = [];

    OutputA  =[];
    OutputB  =[];
    OutputC  =[];

    for n=0,L-1:
        y[n] = x[n]
        xTotal[nTotal] = x[n]
        yTotal[nTotal] = y[n]

        yA1[n]=yA1[n-1]+x[n]+xTotal[nTotal-A1]  %RRS1 A
        yA1Total[nTotal] = yA1[n]
        yA2[n]=yA2[n-1]+yA1[n]+yA1Total[nTotal-A2]  %RRS2 A
        yA2Total[nTotal] = yA2[n]
        yA3[n]=yA2[n-(H1+H2)/2+1]
        yA3Total[nTotal] = yA3[n]
        yA4[n] = KA*yA3[n]
        yA4Total[nTotal] = yA4[n]

        yB1[n] = x[n-(H1+H2)/2+1]
        yB1Total[nTotal] = yB1[n]
        yB2[n] = yB2[n-1]+yB1[n]+yB1Total[nTotal-B1]  %RRS1
        yB2Total[nTotal] = yB2[n]
        yB3[n] = yB3[n-1]+yB2[n]+yB2Total[nTotal-B2]
        yB3Total[nTotal] = yB3[n]
        yB4[n] = KB*yB3[n]
        yB4Total[nTotal] = yB4[n]

        yC1[n] = yB1[n-(H1+H2)/2+1]
        yC1Total[nTotal] = yC1[n]
        
        OutputA[n] = GA*(yA4[n])
        OutputB[n] = GB*(yB4[n] - yA4[n])
        OutputC[n] = GC*(yC1[n] - yB4[n])

        Output[n] = OutputA[n] + OutputB[n] + OutputC[n]


        n += 1;
        nTotal += 1;
    end
    
    OutputA  =
    
end

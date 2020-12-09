

%general outer loop

%set up memory array


A1 = 75;
A2 = 51;
B1 = 9;
B2 = 7;

GA = 1;
GB = 1;
GC = 1;

KA = 1/(A1*A2);
KB = 1/(B1*B2);

%Louis sample
audioInput = audioread('/Users/louiscroquette/Desktop/2020-2021/Fall/ECSE 512/Term Project/Code/sample.wav');
frame_len = 100;

ip = audioread('/Users/louiscroquette/Desktop/2020-2021/Fall/ECSE 512/Term Project/Code/sample.wav');
[y,Fs] = audioread('/Users/louiscroquette/Desktop/2020-2021/Fall/ECSE 512/Term Project/Code/sample.wav');

% breaking signal into 0.1 seconds 
N = length(ip); 
numFrames = floor(N/frame_len); 

% frame1 = ip(1: frame_len); 
% frame2 = ip(frame_len + 1 : frame_len*2); 
% frame3 = ip(frame_len*2 + 1 : frame_len*3); 

count = 0;
new_sig = zeros(N,1); 
% numFrames shows the amount of frames 
for i = 1 : numFrames
    frame = ip( (i-1)*frame_len + 1 : frame_len*i); 
    % finding frames with amplitude less than 0.2  
    max_val = max(frame); 
    % ampliyfing sound by a gain of 4
    if (max_val > 0) 
        count = count + 1
        new_sig((count-1)*frame_len + 1 : frame_len*count) = frame; 
    end
end



allFrames = new_sig;

frameLength = frame_len;

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
globalTotal = [];
nTotal = frame_len;

globalOutput = [];

x = allFrames;        %splicedSignal(i);
y = zeros(frameLength,1);
yA1 = zeros(frameLength,1);
yA2 = zeros(frameLength,1);
yA3 = zeros(frameLength,1);
yB1 = zeros(frameLength,1);
yB2 = zeros(frameLength,1);
yB3 = zeros(frameLength,1);
yC1 = zeros(frameLength,1);

OutputA  =[];
OutputB  =[];
OutputC  =[];


% splicedSignal = frameSplitter(inputSignal); 
for i = 2:1:numFrames %iterate through frames:

    for n = 2:frameLength-1
        y(n) = x(n);
        xTotal(nTotal) = x(n);
        yTotal(nTotal) = y(n);

        yA1(n)=yA1(n-1)+x(n)+xTotal(nTotal-A1); %RRS1 A
        yA1Total(nTotal) = yA1(n);
        yA2(n)=yA2(n-1)+yA1(n)+yA1Total(nTotal-A2);  %RRS2 A
        yA2Total(nTotal) = yA2(n);
        yA3(n)=yA2Total(nTotal-(B1+B2)/2+1);
        yA3Total(nTotal) = yA3(n);
        yA4(n) = KA*yA3(n);
        yA4Total(nTotal) = yA4(n);

        yB1(n) = xTotal(nTotal-(A1+A2)/2+1);
        yB1Total(nTotal) = yB1(n);
        yB2(n) = yB2(n-1)+yB1(n)+yB1Total(nTotal-B1);  %RRS1
        yB2Total(nTotal) = yB2(n);
        yB3(n) = yB3(n-1)+yB2(n)+yB2Total(nTotal-B2);
        yB3Total(nTotal) = yB3(n);
        yB4(n) = KB*yB3(n);
        yB4Total(nTotal) = yB4(n);

        yC1(n) = yB1Total(nTotal-(B1+B2)/2+1);
        yC1Total(nTotal) = yC1(n);
        
        OutputA(n) = GA*(yA4(n));
        OutputB(n) = GB*(yB4(n) - yA4(n));
        OutputC(n) = GC*(yC1(n) - yB4(n));

        Output(n) = OutputA(n) + OutputB(n) + OutputC(n);
        globalOutput(n) = Output(n); 
        globalTotal(nTotal) = Output(n);
        
        n = n + 1;
        nTotal = nTotal + 1;
    end
end


globalTotal = transpose(globalTotal)
%check if code till line 76 works 

function [framesSplit] = frameSplitter(inputSignal, frameLength)

N = length(inputSignal); 
numFrames = floor(N/frameLength); 

count = 0;
new_sig = zeros(N,1); 

for i = 1 : numFrames
    frame = inputSignal( (i-1)*frameLength + 1 : frameLength*i); 
    new_sig((count-1)*frameLength + 1 : frameLength*count) = frame*4;
    end
end
% type sound(ip, 11025) in command window after running to hear original
% sound
% type sound(new_sig, 11025) in command window after running to hear
% amplified version



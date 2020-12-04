% Program runs out of this file. 


% ip = wavread('C:\Users\Shaun\Downloads\sample.wav');

% testing frame capture 

[y,FS] = audioread('C:\Users\Shaun\Downloads\sample.wav')

% breaking signal into 0.1 seconds 
fs = Fs; % 11025
frame_dur = 0.1; 
frame_len = floor(frame_dur*fs); 
N = length(ip); 
numFrames = floor(N/frame_len); 

% frame1 = ip(1: frame_len); 
% frame2 = ip(frame_len + 1 : frame_len*2); 
% frame3 = ip(frame_len*2 + 1 : frame_len*3); 

count = 0;
new_sig = zeros(N,1) 
numFrames
for i = 1 : numFrames
    frame = ip( (i-1)*frame_len + 1 : frame_len*i); 
    
    % finding frames with amplitude less than 0.2  
    max_val = max(frame); 
    
    if (max_val > 0.9) 
        count = count + 1
        new_sig((count-1)*frame_len + 1 : frame_len*count) = frame; 
    end
end

newTime = length(new_sig)/11025

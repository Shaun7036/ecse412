% Program runs out of this file. 

% testing frame capture 
ip = audioread('C:\Users\Shaun\Downloads\sample.wav');
% you'll have to download the 'sample' file and input the new path below. 
[y,Fs] = audioread('C:\Users\Shaun\Downloads\sample.wav');

% breaking signal into 0.1 seconds 
fs = Fs; % 11025
frame_dur = 0.1; %value of frames in seconds 
frame_len = floor(frame_dur*fs); 
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
        new_sig((count-1)*frame_len + 1 : frame_len*count) = frame*4; 
    end
end
% type sound(ip, 11025) in command window after running to hear original
% sound
% type sound(new_sig, 11025) in command window after running to hear
% amplified version
newTime = length(new_sig)/11025

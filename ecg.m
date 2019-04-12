% EMAY ECG Data Location:
% C:\Users\Ismail Degani\AppData\Local\VirtualStore\Program Files\Emay\PM10\data

fileID = fopen('rawdata\ECG\2019-04-12\74\ecg.dat','r');

% 10s sample should contain 1250 floats
% 30s sample should contain 3750 floats
% So, read up to 5000
A = fread(fileID, [5000],'float');
fclose(fileID);

fs = 125; % ECG Sample Rate in Hz
A = A - mean(A); % center around 0
time_sec = (1:length(A))/fs;

% Scale to mV:
% Sample peak: 1.35mV = [10.75 - (-5.35)] e-35 * scale_factor
scale_factor = 0.0838509e35;

% plot(time_sec, log10(A))
% plot(time_sec, log(A))
plot(time_sec, A*scale_factor)

xlabel('Time (s)')
ylabel('Voltage (mV)')



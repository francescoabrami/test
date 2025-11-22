%% TEST FOR HW1

clear all; 
close all; 
clc;

filename = 'AUDIO1.mp3';
M = 0.5;
useHann = true;

[x, fs] = audioread(filename);

if size(x,2) > 1
    x = mean(x, 2);
end


N = round(M * fs);
num_windows = floor(length(x) / N);

if useHann
    win = hann(N);
else
    win = ones(N,1);
end


for w = 1:20
    % fprintf("\nFinestra %d\n", w);
    % 
    % seg = x((w-1)*N + 1 : w*N) .* win;

    %% DFT lenta
 
    % tic
    % X_dft = zeros(N,1);
    % n = 0:N-1;
    % for k = 0:N-1
    %     X_dft(k+1) = sum(seg.' .* exp(-1j * 2*pi * k * n / N));
    % end
    % t_dft = toc;
    % fprintf("Tempo DFT = %.4f s\n", t_dft);

    % %% FFT veloce
    % 
    % tic
    % X_fft = fft(seg);
    % t_fft = toc;
    % fprintf("Tempo FFT = %.6f s\n", t_fft);

    % %% SPETTRO DI ENERGIA
    % E_dft = abs(X_dft).^2;
    % E_fft = abs(X_fft).^2;
    % 
    % f = (0:N-1) * fs / N / 1000;
    % half = floor(N/2);

     % %%   PLOT
     % figure;
     % plot(f(1:half), 10*log10(E_fft(1:half)+1e-12), 'LineWidth', 1.2); 
     % hold on;
     % %plot(f(1:half), 10*log10(E_dft(1:half)+1e-12), '--', 'LineWidth', 1.2);
     % xlabel('Frequenza (kHz)');
     % ylabel('Energia (dB)');
     % title(sprintf('Finestra %d | N = %d campioni | DFT vs FFT', w, N));
     % %legend('FFT','DFT (lenta)');
     % grid on;
end

spettro = fft(x);

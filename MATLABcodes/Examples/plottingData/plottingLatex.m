% Plotar a função seno recebida em relação à função seno local
figure;
plot(receive_times, sine_received, 'r--', 'DisplayName', 'Seno Recebido');
hold on;
plot(send_times, sine_local(1:N), 'b', 'DisplayName', 'Seno Local');

% Identificar pontos de maior e menor latência
[max_latency, max_index] = max(latencies);
[min_latency, min_index] = min(latencies);

xlabel('Tempo (s)', 'Interpreter', 'latex');
ylabel('Amplitude', 'Interpreter', 'latex');
title(sprintf('Compara\\c{c}\\~ao entre Seno Local e Seno Recebido para Ts = %.2f', Ts), 'Interpreter', 'latex');
legend('Interpreter', 'latex');
grid on;

line([send_times(max_index) receive_times(max_index)], ...
     [sine_local(max_index) sine_received(max_index)], 'Color', 'k', 'LineStyle', '--');
line([send_times(min_index) receive_times(min_index)], ...
     [sine_local(min_index) sine_received(min_index)], 'Color', 'k', 'LineStyle', '--');

set(gca, 'FontSize', 12);
set(gca, 'TickLabelInterpreter', 'latex');

% Adicionar zoom nos pontos de maior e menor latência
zoom_range = 10; % Número de pontos ao redor do ponto de interesse para mostrar no zoom

% Garantir que os índices estejam dentro dos limites válidos
max_start = max(1, max_index - zoom_range);
max_end = min(N, max_index + zoom_range);
min_start = max(1, min_index - zoom_range);
min_end = min(N, min_index + zoom_range);

% Zoom para maior latência
zoom1 = axes('Position', [0.17, 0.4, 0.1, 0.1]);
box on;
hold on;
plot(send_times(max_start:max_end), sine_local(max_start:max_end), 'b');
plot(receive_times(max_start:max_end), sine_received(max_start:max_end), 'r--');
line([send_times(max_index) receive_times(max_index)], ...
     [sine_local(max_index) sine_received(max_index)], 'Color', 'k', 'LineStyle', '--');
grid on;
set(gca, 'FontSize', 10);
set(gca, 'TickLabelInterpreter', 'latex');

% Zoom para menor latência
zoom2 = axes('Position', [0.3, 0.8, 0.1, 0.1]);
box on;
hold on;
plot(send_times(min_start:min_end), sine_local(min_start:min_end), 'b');
plot(receive_times(min_start:min_end), sine_received(min_start:min_end), 'r--');
line([send_times(min_index) receive_times(min_index)], ...
     [sine_local(min_index) sine_received(min_index)], 'Color', 'k', 'LineStyle', '--');
grid on;

set(gca, 'FontSize', 10);
set(gca, 'TickLabelInterpreter', 'latex');

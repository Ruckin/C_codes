% DECLARACOES INICIAIS:

clc;
clear;
close all;

% NUMERO DE TERMOS:

n = 20;

% CONDICOES INICIAIS

y = zeros(1, n);

y(1) = 0;
y(2) = 1; 

% CALCULANDO A SEQUENCIA DE FIBONACCI

for i = 3:n + 1

    y(i) = y(i - 1) + y(i - 2);

end

% MOSTRANDO A SEQUENCIA:

figure;
plot(0:n, y, 'ko');
legend('Fibonacci');
grid on;
xlabel('k');
ylabel('y[k]');
title('Fibonacci Sequence');

% CALCULANDO A RAZAO AUREA:

for j = 3:n + 1

    NO = (y(j) + y(j - 1))/(y(j - 1) + y(j - 2));

end

% APRESENTANDO A RAZAO AUREA:

figure;
plot(0:n, NO, 'r*');
legend('Razao Aurea');
grid on;
xlabel('k');
ylabel('NO');
title('Razao Aurea');

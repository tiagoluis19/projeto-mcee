function y = EulerODE(f,x,y0)
    % Utilização:
    % y = EulerODE(f, x, y0), com
    %
    % f é uma função anónima que representa f(x, y)
    % x é um vetor representa pontos discretos
    % y0 é a condição inicial, y(x0)
    n = length(x);
    y = zeros(1, n); % Pré-alocação de memória
    y(1) = y0;
    h = x(2)-x(1);

    for i = 1 : n - 1
     y(i+1) = y(i) + h*f(x(i), y(i));
    end
end

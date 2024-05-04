function RLC_Paralelo
    clc
    % Valor da fonte de corrente
    fprintf('VALOR DA FONTE DE CORRENTE: \n');
    i = input('Indique o valor da fonte de corrente (AC): ', 's');

    % Parametros
    fprintf('PARAMETROS: \n');
    L = input('Indique o valor da bobina (H): ');
    R = input('Indique o valor da resistência (Ohms): ');
    C = input('Indique o valor do condensador (F): ');

    % Condicoes iniciais
    fprintf('CONDIÇÕES INICIAIS: \n');
    vc0 = input('Valor da carga inicial no condensador: ');

    % Intervalo de tempo
    fprintf('INTERVALO DE TEMPO: \n');
    t = input('Indique o valor do intervalo de tempo (s): ');
    
    while t <= 0
        fprintf('Deve inserir um valor maior que 0!\n')
        t = input('Indique o valor do intervalo de tempo (s): ');
    end

    % Expressão
    rlc = @(t, y) [y(2); 
    (i(t)) - y(1)/(L*C) - y(2)/(R*C)];

    % Resolução
    







end
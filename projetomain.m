while 1
    
    clc; clear ; close all;

    fprintf(['menu: \n' ...
        '1 rl\n' ...
        '2 rc\n' ...
        '3 rlc\n' ...
        '4 sair\n'])

    opcao= input('opção: ');

    switch opcao

        case 1  %circuito rl
            clc;
            fprintf(['selecionou rl\n' ...
                'escolha se quer o citcuto em: \n' ...
                '1 série\n' ...
                '2 paralelo\n'])
            seroupar = input('opção: ');
            if seroupar==1    %se e serie ou paralelo
                disp('circuito série rl') %serie

                 % Intervalo de tempo
                fprintf('INTERVALO DE TEMPO: \n');
                ti = input('Indique o valor do itempo inicial (s): \n');
                tf = input('Indique o valor do itempo final (s):   \n');


                while tf-ti <= 0
                    fprintf('Deve inserir um valor maior que 0!\n')
                    ti = input('Indique o valor do itempo inicial (s): \n');
                    tf = input('Indique o valor do itempo final (s):   \n');
                end
                R=input('valor da resistencia Ohm ');
                L=input('valor da bobine Henry ');
                A=input('valor de amplitude ou dc da fonte de tensao Volt ');
                RL_Serie(R,L,ti,tf,A);

            else
                disp('circuito paralelo rl') %paralelo
                 % Intervalo de tempo
                fprintf('INTERVALO DE TEMPO: \n');
                ti = input('Indique o valor do itempo inicial (s): \n');
                tf = input('Indique o valor do itempo final (s):   \n');


                while tf-ti <= 0
                    fprintf('Deve inserir um valor maior que 0!\n')
                    ti = input('Indique o valor do itempo inicial (s): \n');
                    tf = input('Indique o valor do itempo final (s):   \n');
                end
                R=input('valor da resistencia Ohm ');
                L=input('valor da bobine Henry ');
                A=input('valor de amplitude ou dc da fonte de corrente Ampere ');
                A = transform_fontes(R,A);
                RL_Serie(R,L,ti,tf,A);

            end

        case 2 %circuito rc
            clc;
            fprintf(['selecionou rc \n' ...
                'escolha se quer o citcuto em: \n' ...
                '1 série\n' ...
                '2 paralelo\n'])
            seroupar = input('opção: ');
            if seroupar==1    %se e serie ou paralelo
                disp('circuito série rc') %serie

                  % Intervalo de tempo
                fprintf('INTERVALO DE TEMPO: \n');
                ti = input('Indique o valor do itempo inicial (s): \n');
                tf = input('Indique o valor do itempo final (s):   \n');


                while tf-ti <= 0
                    fprintf('Deve inserir um valor maior que 0!\n')
                    ti = input('Indique o valor do itempo inicial (s): \n');
                    tf = input('Indique o valor do itempo final (s):   \n');
                end
                R=input('valor da resistencia Ohm ');
                C=input('valor do condensador Farad ');
                A=input('valor de amplitude ou dc da fonte de tensao Volt ');
                RC_Serie(R,C,ti,tf,A);

            else
                disp('circuito paralelo rc') %paralelo
                
                 % Intervalo de tempo
                fprintf('INTERVALO DE TEMPO: \n');
                ti = input('Indique o valor do itempo inicial (s): \n');
                tf = input('Indique o valor do itempo final (s):   \n');


                while tf-ti <= 0
                    fprintf('Deve inserir um valor maior que 0!\n')
                    ti = input('Indique o valor do itempo inicial (s): \n');
                    tf = input('Indique o valor do itempo final (s):   \n');
                end
                R=input('valor da resistencia Ohm ');
                C=input('valor do condensador Farad ');
                A=input('valor de amplitude ou dc da fonte de corrente em Ampere ');
                transform_fontes(R,A)
                RC_Serie(R,C,ti,tf,A);

            end


        case 3 %circuito rlc
            clc;
            fprintf(['selecionou rlc\n' ...
                'escolha se quer o citcuto em: \n' ...
                '1 série\n' ...
                '2 paralelo\n'])
            seroupar = input('opção: ');
            if seroupar==1    %se e serie ou paralelo
                disp('circuito série rlc') %serie
                   
                % Intervalo de tempo
                fprintf('INTERVALO DE TEMPO: \n');
                ti = input('Indique o valor do itempo inicial (s): \n');
                tf = input('Indique o valor do itempo final (s):   \n');


                while tf-ti <= 0
                    fprintf('Deve inserir um valor maior que 0!\n')
                    ti = input('Indique o valor do itempo inicial (s): \n');
                    tf = input('Indique o valor do itempo final (s):   \n');
                end
                R=input('valor da resistencia Ohm ');
                L=input('valor da bobine Henry ');
                C=input('valor do condensador Farad ');
                A=input('valor de amplitude ou dc da fonte de tensao Volt ');
                RLC_Serie (R, L, C, ti, tf, A);

            else
                disp('circuito paralelo rlc') %paralelo

                % Intervalo de tempo
                fprintf('INTERVALO DE TEMPO: \n');
                ti = input('Indique o valor do itempo inicial (s): \n');
                tf = input('Indique o valor do itempo final (s):   \n');


                while tf-ti <= 0
                    fprintf('Deve inserir um valor maior que 0!\n')
                    ti = input('Indique o valor do itempo inicial (s): \n');
                    tf = input('Indique o valor do itempo final (s):   \n');
                end
                R=input('valor da resistencia Ohm ');
                L=input('valor da bobine Henry ');
                C=input('valor do condensador Farad ');
                A=input('valor de amplitude ou dc da fonte de corrente Ampere ');
                RLC_Paralelo (R, L, C, ti, tf, A);

            end





        case 4 %saida
            fprintf(['\n deseja sair? \n' ...
                's - sim \n' ...
                'n- não \n'])
            sn=input('opção: ','s');
            if ismember(sn,['s', 'S', 'sim' ,'Sim']) % sai se sn for membro do vetor
                return
            end

    end
    input('');
end
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


            else
                disp('circuito paralelo rl') %paralelo


            end



        case 2 %circuito rc
            clc;
            fprintf(['selecionou rc\n' ...
                'escolha se quer o citcuto em: \n' ...
                '1 série\n' ...
                '2 paralelo\n'])
            seroupar = input('opção: ');
            if seroupar==1    %se e serie ou paralelo
                disp('circuito série rc') %serie


            else
                disp('circuito paralelo rc') %paralelo


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


            else
                disp('circuito paralelo rlc') %paralelo


            end





        case 4 %saida
            fprintf(['\n deseja sair? \n' ...
                's - sim \n' ...
                'n- não \n'])
            sn=input('opção: ','s');
            if ismember(sn,['s', 'S', 'sim' ,'Sim']) % sai s e sn for membro do vetor
                return
            end

    end
    input('');
end
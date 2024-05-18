function RLC_Serie(R, L, C, ti, tf, A)


N=input('intoduza o numero de pontos a considerar ');

if N<30
    N=30;
end

% Condicoes iniciais
fprintf('CONDIÇÕES INICIAIS: \n');
vc0 = input('Valor da tensão inicial no condensador: \n');
vl0 = input('Valor da corrente inicial na bobine:   \n');


fprintf('DC ou AC: \n');
acdc = input('Indique se quer uma fonte de tensão ac ou dc\n','s');
if ismember(acdc,['ac' 'AC' 'Ac' 'aC'])

    onda=input('Indique se quer uma fonte sinusoidal quadrada ou dentes de serra(sin,cos,square,saw)\n','s');
    if onda=="sin"
        f=input('Indique a frquencia da fonte: \n');
        vs = @ (t) A*sin(f*2*pi*t);

        rlcs = @(t,y)[y(2);
            vs(t)/(L*C)-y(2)*R/(L)-y(1)/(L*C)];


        [t,y] = IEuler(rlcs,[ti,tf],[vc0; vl0],N);


    elseif onda=="cos"
        f=input('Indique a frquencia da fonte: \n');
        vs = @ (t) A*cos(f*2*pi*t);

        rlcs = @(t,y)[y(2);
            vs(t)/(L*C)-y(2)*R/(L)-y(1)/(L*C)];


        [t,y] = IEuler(rlcs,[ti,tf],[vc0; vl0],N);


    elseif onda=="square"
        f=input('Indique a frquencia da fonte: \n');
        vs = @ (t) A*square(f*2*pi*t);

        rlcs = @(t,y)[y(2);
            vs(t)/(L*C)-y(2)*R/(L)-y(1)/(L*C)];


        [t,y] = IEuler(rlcs,[ti,tf],[vc0; vl0],N);

    else %sawtooth
        f=input('Indique a frquencia da fonte: \n');
        vs = @ (t) A*sawtooth(f*2*pi*t);

        rlcs = @(t,y)[y(2);
            vs(t)/(L*C)-y(2)*R/(L)-y(1)/(L*C)];

        [t,y] = IEuler(rlcs,[ti,tf],[vc0; vl0],N);

    end

else %DC valores fixos

    rlcs = @(t,y)[y(2);
        A/(L*C)-y(2)*R/(L)-y(1)/(L*C)];

    [t,y] = IEuler(rlcs,[ti,tf],[vc0; vl0],N);


end
subplot(2,1,1)
plot(t,y(:,1));
ylabel('tensão V_c (V)')
xlabel('tempo (s)')
grid on
subplot(2,1,2)
plot(t,y(:,2)*C)
ylabel('corrente I_l (A)')
xlabel('tempo (s)')



end
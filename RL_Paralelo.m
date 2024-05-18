function RL_Paralelo (R, L, ti, tf, A)

N=input('intoduza o numero de pontos a considerar (mín 30)');

if N<30
    N=30;
end

% Condicoes iniciais
fprintf('CONDIÇÕES INICIAIS: \n');
vl0 = input('Valor da corrente inicial na bobine:   \n');

fprintf('DC ou AC: \n');
acdc = input('Indique se quer uma fonte de corrente ac ou dc\n','s');
if ismember(acdc,['ac' 'AC' 'Ac' 'aC'])

    onda=input('Indique se quer uma fonte sinusoidal quadrada ou dentes de serra(sin,cos,square,saw)\n','s');
    if onda=="sin"
        f=input('Indique a frquencia da fonte: \n');
        V = @ (t) (A)*sin(f*2*pi*t);

        rl = @(t,i)(V(t)-R*i)/L;
        [t,i]=ode45(rl,tempo, vl0);

    elseif onda=="cos"
        f=input('Indique a frquencia da fonte: \n');
        V = @ (t) (A)*cos(f*2*pi*t);

        rl = @(t,i)(V(t)-R*i)/L;
        [t,i]=ode45(rl,tempo, vl0);
        
    elseif onda=="square"
        f=input('Indique a frquencia da fonte: \n');
         V = @ (t) A*square(f*2*pi*t);

        rl = @(t,i)(V(t)-R*i)/L;
        [t,i]=ode45(rl,tempo, vl0);
        
    else %sawtooth
        f=input('Indique a frquencia da fonte: \n');
         V = @ (t) A*sawtooth(f*2*pi*t);

        rl = @(t,i)(V(t)-R*i)/L;
        [t,i]=ode45(rl,tempo, vl0);
        
    end

else %DC valores fixos
    rl = @(t,i)(A-R*i)/L;
    [t,i]=ode45(rl,tempo, vl0);

end

    plot(t,i);
    ylabel('corrente Il (A)')
    xlabel('tempo (s)')
   

end
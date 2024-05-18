function RL_Serie (R, L, ti, tf, A)


h=input('intoduza um intervalo entre os pontos (s)');
if isnan(h)
    tempo=linspace(ti,tf,1000);
else
    if h>=0
        if tf>(h*5)
            tempo=ti:h:tf;
        else
            tempo=linspace(ti,tf,20);
        end
    else
        tempo=linspace(ti,tf,20);
    end
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
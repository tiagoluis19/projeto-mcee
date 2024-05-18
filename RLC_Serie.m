function RLC_Serie(R, L, C, ti, tf, A)


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


        [t,y]=ode45(rlcs,tempo,[vc0 vl0]);

    elseif onda=="cos"
        f=input('Indique a frquencia da fonte: \n');
        vs = @ (t) A*cos(f*2*pi*t);

         rlcs = @(t,y)[y(2);
            vs(t)/(L*C)-y(2)*R/(L)-y(1)/(L*C)];


        [t,y]=ode45(rlcs,tempo,[vc0 vl0]);

    elseif onda=="square"
        f=input('Indique a frquencia da fonte: \n');
        vs = @ (t) A*square(f*2*pi*t);

          rlcs = @(t,y)[y(2);
            vs(t)/(L*C)-y(2)*R/(L)-y(1)/(L*C)];


        [t,y]=ode45(rlcs,tempo,[vc0 vl0]);

    else %sawtooth
        f=input('Indique a frquencia da fonte: \n');
        vs = @ (t) A*sawtooth(f*2*pi*t);

        rlcs = @(t,y)[y(2);
            vs(t)/(L*C)-y(2)*R/(L)-y(1)/(L*C)];

        [t,y]=ode45(rlcs,tempo,[vc0 vl0]);

    end

else %DC valores fixos

    rlcs = @(t,y)[y(2);
            A/(L*C)-y(2)*R/(L)-y(1)/(L*C)];

    [t,y]=ode45(rlcs,tempo,[vc0 vl0]);
    
end
subplot(2,1,1)
plot(t,y(:,1));
ylabel('tensao Vc (V)')
xlabel('tempo (s)')
grid on
subplot(2,1,2)
plot(t(1:end-1),C*diff(y(:,1)))
end
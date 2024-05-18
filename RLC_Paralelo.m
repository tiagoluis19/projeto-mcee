function RLC_Paralelo (R, L, C, ti, tf, A)


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
acdc = input('Indique se quer uma fonte de corrente ac ou dc\n','s');
if ismember(acdc,['ac' 'AC' 'Ac' 'aC'])

    onda=input('Indique se quer uma fonte sinusoidal quadrada ou dentes de serra(sin,cos,square,saw)\n','s');
    if onda=="sin"
        f=input('Indique a frquencia da fonte: \n');
        i = @ (t) A*sin(f*2*pi*t);

        rlc = @(t,y)[y(2);
            i(t)/(L*C)-y(2)/(R*C)-y(1)/(L*C)];
        [t,y]=ode45(rlc,tempo,[vc0 vl0]);

    elseif onda=="cos"
        f=input('Indique a frquencia da fonte: \n');
         i = @ (t) A*cos(f*2*pi*t);

        rlc = @(t,y)[y(2);
            i(t)/(L*C)-y(2)/(R*C)-y(1)/(L*C)];
        [t,y]=ode45(rlc,tempo,[vc0 vl0]);
        
    elseif onda=="square"
        f=input('Indique a frquencia da fonte: \n');
         i = @ (t) A*square(f*2*pi*t);

        rlc = @(t,y)[y(2);
            i(t)/(L*C)-y(2)/(R*C)-y(1)/(L*C)];
        [t,y]=ode45(rlc,tempo,[vc0 vl0]);
        
    else %sawtooth
        f=input('Indique a frquencia da fonte: \n');
         i = @ (t) A*sawtooth(f*2*pi*t);

        rlc = @(t,y)[y(2);
            i(t)/(L*C)-y(2)/(R*C)-y(1)/(L*C)];
        [t,y]=ode45(rlc,tempo,[vc0 vl0]);

    end

else %DC valores fixos
    rlc = @(t,y)[y(2);
            A/(L*C)-y(2)/(R*C)-y(1)/(L*C)];

    y = EulerODE(rlc,tempo,[vc0 vl0]);
    plot(y)
  

end


    plot(t,y(:,1));
    ylabel('corrente Il (A)')
    xlabel('tempo (s)')
     
    



end
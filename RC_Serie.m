function RC_Serie (R, C, ti, tf, A)

N=input('intoduza o numero de pontos a considerar (mín 30)');

if N<30
    N=30;
end

% Condicoes iniciais
fprintf('CONDIÇÕES INICIAIS: \n');
vc0 = input('Valor da tensão inicial no condensador:   \n');

fprintf('DC ou AC: \n');
acdc = input('Indique se quer uma fonte de corrente ac ou dc\n','s');
if ismember(acdc,['ac' 'AC' 'Ac' 'aC'])

    onda=input('Indique se quer uma fonte sinusoidal quadrada ou dentes de serra(sin,cos,square,saw)\n','s');
    if onda=="sin"
        f=input('Indique a frquencia da fonte: \n');
        V = @ (t) (A)*sin(f*2*pi*t);

        rc = @(t,v)(1/(R*C))*(V(t) - v);
        [t,v] = IEuler(rc,[ti,tf],vc0,N);

    elseif onda=="cos"
        f=input('Indique a frquencia da fonte: \n');
        V = @ (t) (A)*cos(f*2*pi*t);

        rc = @(t,v)(1/(R*C))*(V(t) - v);
        [t,v] = IEuler(rc,[ti,tf],vc0,N);

    elseif onda=="square"
        f=input('Indique a frquencia da fonte: \n');
         V = @ (t) A*square(f*2*pi*t);

        rc = @(t,v)(1/(R*C))*(V(t) - v);
        [t,v] = IEuler(rc,[ti,tf],vc0,N);
        
    else %sawtooth
        f=input('Indique a frquencia da fonte: \n');
         V = @ (t) A*sawtooth(f*2*pi*t);

        rc = @(t,v)(1/(R*C))*(V(t) - v);
        [t,v] = IEuler(rc,[ti,tf],vc0,N);
        
    end

else %DC valores fixos
    rc = @(t,v)(1/(R*C))*(A - v);
    [t,v] = IEuler(rc,[ti,tf],vc0,N);

end

    plot(t,v);
    ylabel('corrente Il (A)')
    xlabel('tempo (s)')
   

end
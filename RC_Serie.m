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

        rc = @(t,v)(V(t) - v)/(R*C);
        [t,v] = IEuler(rc,[ti,tf],vc0,N);

    elseif onda=="cos"
        f=input('Indique a frquencia da fonte: \n');
        V = @ (t) (A)*cos(f*2*pi*t);

        rc = @(t,v)(V(t) - v)/(R*C);
        [t,v] = IEuler(rc,[ti,tf],vc0,N);

    elseif onda=="square"
        f=input('Indique a frquencia da fonte: \n');
         V = @ (t) A*square(f*2*pi*t);

        rc = @(t,v)(V(t) - v)/(R*C);
        [t,v] = IEuler(rc,[ti,tf],vc0,N);
        
    else %sawtooth
        f=input('Indique a frquencia da fonte: \n');
         V = @ (t) A*sawtooth(f*2*pi*t);

        rc = @(t,v)(V(t) - v)/(R*C);
        [t,v] = IEuler(rc,[ti,tf],vc0,N);
        
    end

else %DC valores fixos
    rc = @(t,v)(A - v)/(R*C);
    [t,v] = IEuler(rc,[ti,tf],vc0,N);

end

    subplot(2,1,1)
plot(t,v);
ylabel('tensão V_c (V)')
xlabel('tempo (s)')
grid on
subplot(2,1,2)
plot(t(1:end-1),diff(v)*C)
ylabel('corrente I_l (A)')
xlabel('tempo (s)')
grid on

end
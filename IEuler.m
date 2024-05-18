function [ts,ys] = IEuler(f,tv,y0,N);
  t0 = tv(1); T = tv(2);
  h = (T-t0)/N;                   % stepsize h
  ts = zeros(N+1,1); ys = zeros(N+1,length(y0));
  t = t0; y = y0;                  % initial point
  ts(1) = t; ys(1,:) = y';

  for i=1:N
    k1 = f(t,y);                   % evaluate direction field at current point
    yE = y + k1*h;                 % find Euler value yE
    k2 = f(t+h,yE);                % evaluate direction field at Euler point
    y = y + (k1+k2)/2*h;           % use mean (s1+s2)/2 to find new y
    t = t + h;
    ts(i+1) = t; ys(i+1,:) = y';   % store y(1),y(2) in row of array ys
  end
end

% alteraçoes a IEuler feita na aula com base no metodo apresentado em 
% https://www.math.umd.edu/~petersd/460/html/Ieuler_demo2.html 
% mudanças em relaçao a aula
%   - inclusao de N (num de pontos) para definir o passo h
%   - tv é um vetor com abcissa inicial e final da EDO nao o vetor dos pontos  
%   - e alocada memoria para N+1 pontos em vez de se cortar o ciclo pr 1 iteração 
%   - devolve se o vetor de ts criado e a matriz ys com a equaçao e a sua 2
%     derivada util para calcular a componente (tensao ou corrente) no
%     circuito


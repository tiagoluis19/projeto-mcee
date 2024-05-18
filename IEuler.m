function [ts,ys] = IEuler(f,tv,y0,N);
  t0 = tv(1); T = tv(2);
  h = (T-t0)/N                    % stepsize h
  ts = zeros(N+1,1); ys = zeros(N+1,length(y0));
  t = t0; y = y0;                  % initial point
  ts(1) = t; ys(1,:) = y';

  for i=1:N
    s1 = f(t,y);                   % evaluate direction field at current point
    yE = y + s1*h;                 % find Euler value yE
    s2 = f(t+h,yE);                % evaluate direction field at Euler point
    y = y + (s1+s2)/2*h;           % use mean (s1+s2)/2 to find new y
    t = t + h;
    ts(i+1) = t; ys(i+1,:) = y';   % store y(1),y(2) in row of array ys
  end
end
%% CODING THE RUNGE-KUTTA 4TH ORDER SOLVER:

function xdot = rk4_step(fun, dt, tk, xk)

f1 = fun(tk, xk);
f2 = fun(tk + dt/2, xk + (dt/2)*f1);
f3 = fun(tk + dt/2, xk + (dt/2)*f2);
f4 = fun(tk + dt, xk + dt*f3);

xdot = xk + (dt/6)*(f1 + 2*f2 + 2*f3 + f4);

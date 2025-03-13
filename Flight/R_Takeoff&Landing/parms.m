%rocket parmtr:
%Engine:
m = 132;
burnt = 162.25;
%vehicle:
m_pay = 5000;
m_dry = 1360.7;
m_zfw = m_dry+m_pay;
%initial sim conditions:
v0 = 0.01;
g = 9.81;
gam_0 = pi/2;
RE = 6371e3;
h0 = 0;
x0 = 0;
%pulse after t sec:
%init gravity turn:
t_turn = 30;
gam_in = 0.10;



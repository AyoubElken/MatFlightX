clc; close all; clear all:
format short
A = [-1.064 1; 290.26 0];
B = [-0.25 ; -331.40];
C = [-123.34 0; 0 1];
D = [-13.51; 0];

states = {'AoA','q'};
inputs = {'\delta_c'};
outputs = {'Az','q'};

sys = ss(A,B,C,D,'statename',states,...
    'inputname',inputs,...
    'outputname',outputs);

TFs = tf(sys);
TF = TFs(2,1);
disp(pole(TF));

%LQR weights matrices:
Q = [0.1 0; 0 0.1];
R = 0.5;
%LQR gain:
[K,S,e] = lqr(A,B,Q,R);
fprintf('eigen values of A-BK\n');
disp(eig(A-B*K));
fprintf('feedback gain K\n');
disp(K);
%closed loop sys:
Acl = A-B*K;
Bcl = B;
syscl = ss(Acl,Bcl,C,D,'statename',states,...
    'inputname',inputs,...
    'outputname',outputs);

TF = tf(syscl);
TFc = TF(2,1);

%LGQ Kalman filter design:
G = eye(2);
H = 0*eye(2);
%Kalman noise matrices:
Qbar = diag(0.00015*ones(1,2));
Rbar = diag(0.55*ones(1,2));

%noisy sys:
sys_n = ss(A,[B G], C, [D H]);
[kest, L, P] = kalman(sys_n,Qbar,Rbar,0);
%kalman gain observer closed loop:
Aob = A-L*C;
fprintf('eigen values of observer');
disp(eig(Aob));


dT1 = 0.75;
dT2 = 0.25;

%%missile parms:
R = 6371e3;
Vel = 1021.08;
m2f = 3.2811;

%initial pos:
LAT_INIT = 34.2329;
LON_INIT = -119.4753;
ELEV_INIT = 10000;
%target:
LAT_TARGET = 34.6588;
LON_TARGET = -118.8429;
ELEV_TARGET = 795;
%obstacle:
LAT_OBS = 34.61916;
LON_OBS = -118.769745;

d2r = pi/180;
l2 = LAT_TARGET*d2r;
u2 = LON_TARGET*d2r;
l1 = LAT_INIT*d2r;
u1 = LON_INIT*d2r;

dl = l2-l1;
du = u2-u1;

a = (sin(dl./2)).^2 + cos(l1) .* cos(l2) .* (sin(du./2)).^2;
c = 2*atan2(sqrt(a),sqrt(1-a));
d = R*c; %horz disctance (m)
%range 0:
r = sqrt(d^2+(ELEV_TARGET-ELEV_INIT)^2);
%dis from North(azimuth):
yaw_init = azimuth(LAT_INIT,LON_INIT,LAT_TARGET,LON_TARGET);
yaw = yaw_init*d2r;

%Flight path angle 0;
dh = abs(ELEV_TARGET-ELEV_INIT);
FPA_INIT = atan(dh/d);






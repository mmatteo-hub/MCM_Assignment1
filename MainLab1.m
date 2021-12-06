%% MOCOM LAB1 - Luca Mosetti

%clc
%clear
%close all
addpath("./include");

%% Definition of the home-position matrices

biTri(1,1,1) = 1;  biTri(1,2,1) = 0;  biTri(1,3,1) = 0;  biTri(1,4,1) = 0;
biTri(2,1,1) = 0;  biTri(2,2,1) = 1;  biTri(2,3,1) = 0;  biTri(2,4,1) = 0;
biTri(3,1,1) = 0;  biTri(3,2,1) = 0;  biTri(3,3,1) = 1;  biTri(3,4,1) = 0.175;
biTri(4,1,1) = 0;  biTri(4,2,1) = 0;  biTri(4,3,1) = 0;  biTri(4,4,1) = 1;

biTri(1,1,2) = -1; biTri(1,2,2) = 0;  biTri(1,3,2) = 0;  biTri(1,4,2) = 0;
biTri(2,1,2) = 0;  biTri(2,2,2) = 0;  biTri(2,3,2) = 1;  biTri(2,4,2) = 0;
biTri(3,1,2) = 0;  biTri(3,2,2) = 1;  biTri(3,3,2) = 0;  biTri(3,4,2) = 0.108;
biTri(4,1,2) = 0;  biTri(4,2,2) = 0;  biTri(4,3,2) = 0;  biTri(4,4,2) = 1;

biTri(1,1,3) = 0;  biTri(1,2,3) = 0;  biTri(1,3,3) = 1;  biTri(1,4,3) = 0.105;
biTri(2,1,3) = -1; biTri(2,2,3) = 0;  biTri(2,3,3) = 0;  biTri(2,4,3) = 0;
biTri(3,1,3) = 0;  biTri(3,2,3) = -1; biTri(3,3,3) = 0;  biTri(3,4,3) = 0;
biTri(4,1,3) = 0;  biTri(4,2,3) = 0;  biTri(4,3,3) = 0;  biTri(4,4,3) = 1;

biTri(1,1,4) = 0;  biTri(1,2,4) = 1;  biTri(1,3,4) = 0;  biTri(1,4,4) = -0.1455;
biTri(2,1,4) = 0;  biTri(2,2,4) = 0;  biTri(2,3,4) = -1; biTri(2,4,4) = 0;
biTri(3,1,4) = -1; biTri(3,2,4) = 0;  biTri(3,3,4) = 0;  biTri(3,4,4) = 0.3265;
biTri(4,1,4) = 0;  biTri(4,2,4) = 0;  biTri(4,3,4) = 0;  biTri(4,4,4) = 1;

biTri(1,1,5) = 0;  biTri(1,2,5) = 0;  biTri(1,3,5) = -1; biTri(1,4,5) = 0.095;
biTri(2,1,5) = 0;  biTri(2,2,5) = -1; biTri(2,3,5) = 0;  biTri(2,4,5) = 0;
biTri(3,1,5) = -1; biTri(3,2,5) = 0;  biTri(3,3,5) = 0;  biTri(3,4,5) = 0;
biTri(4,1,5) = 0;  biTri(4,2,5) = 0;  biTri(4,3,5) = 0;  biTri(4,4,5) = 1;

biTri(1,1,6) = 0;  biTri(1,2,6) = 0;  biTri(1,3,6) = 1;  biTri(1,4,6) = 0;
biTri(2,1,6) = 0;  biTri(2,2,6) = 1;  biTri(2,3,6) = 0;  biTri(2,4,6) = 0;
biTri(3,1,6) = -1; biTri(3,2,6) = 0;  biTri(3,3,6) = 0;  biTri(3,4,6) = -0.325;
biTri(4,1,6) = 0;  biTri(4,2,6) = 0;  biTri(4,3,6) = 0;  biTri(4,4,6) = 1;

biTri(1,1,7) = 0;  biTri(1,2,7) = 0;  biTri(1,3,7) = 1;  biTri(1,4,7) = 0.132;
biTri(2,1,7) = 0;  biTri(2,2,7) = 1;  biTri(2,3,7) = 0;  biTri(2,4,7) = 0;
biTri(3,1,7) = -1; biTri(3,2,7) = 0;  biTri(3,3,7) = 0;  biTri(3,4,7) = 0;
biTri(4,1,7) = 0;  biTri(4,2,7) = 0;  biTri(4,3,7) = 0;  biTri(4,4,7) = 1;

% Constant matrix from link 7 to the end-eff.
T_7e(1,1) = 1;  T_7e(1,2) = 0;  T_7e(1,3) = 0;  T_7e(1,4) = 0;
T_7e(2,1) = 0;  T_7e(2,2) = 1;  T_7e(2,3) = 0;  T_7e(2,4) = 0;
T_7e(3,1) = 0;  T_7e(3,2) = 0;  T_7e(3,3) = 1;  T_7e(3,4) = 0.021;
T_7e(4,1) = 0;  T_7e(4,2) = 0;  T_7e(4,3) = 0;  T_7e(4,4) = 1;

% Define the type of links in the kinematic chain
linkTypes= zeros(7, 1);


% ========================================================================
%                         MOVE THE MANIPULATOR
% ========================================================================


%% Joint-space trajectory planning

% In order to reach a final configuration qf starting from an initial on qi
% in a given time t, it has been chosen to plan the trajectory in the joint 
% space q(t) by adopting a trapezoidal velocity profile.

% Set the initial and final configurations
q= zeros(7, 1);
qi= [0; 0; 0; 0; 0; 0; 0];
%qf= [-pi; 0; 0; -pi/2; 0; pi/2; 0];
%qf= [pi; pi/2; 0; 0; 0; pi/2; 0];
%qf= [pi; pi/2; -pi/6; pi/3; pi/4; pi/2; -pi/4];



% Specify how long we want to take to reach qf from qi
tf= 30;   %s
dt= 0.1;  %s, it's the time step

% Define the absolute value of the joint's acceleration q_2dot that we want
% to impose during the parabolic phases of the trajectory. In general, the 
% choice of this parameter should depend on the actuators and on the dynamic
% properties of the robot
%q_2dot= [-0.2; 0; 0; -0.1; 0; 0.1; 0];   
%q_2dot= [0.2; 0.1; 0; 0; 0; 0.1; 0];
q_2dot= [0.2; 0.1; -0.1; 0.1; 0.1; 0.1; -0.1];

% Determine the duration of each parabolic phase
tp= zeros(7, 1);
for k= 1:7
    tp(k)= abs(tf/2 - 1/2*sqrt((tf^2*q_2dot(k) - 4*(qf(k)-qi(k)))/q_2dot(k)));
end

% Initialize the quanties to perform the trajectory planning
n= round(tf/dt) + 1;     % number of interactions
t= 0;                    % initial time

% Initialize the matrices where to save the results of the joint-space planning
% in order to plot them later on  
Time= zeros(n, 1);
Trj= zeros(n, 7);

% Define the plot's parameters
figure;
title("Manipulator's motion");
xlabel('x');
ylabel('y');
zlabel('z');
grid on
axis equal
hold on;

for i = 1:n
  % Compute the joint-space trj.
  for k= 1:7
      if (t <= tp(k))
        % Initial parabolic phase
        q(k)= qi(k) + 1/2*q_2dot(k)*t^2;

      elseif (t > tp(k)) && (t < tf-tp(k))
        % Linear phase
        q(k)= qi(k) + q_2dot(k)*tp(k)*(t - tp(k)/2);

      else 
        % Final parabolic phase
        q(k)= qf(k) - 1/2*q_2dot(k)*(t - tf)^2;
      end
  end
  
  Trj(i, :)= q;
  Time(i, 1)= t;
  
  % Compute the transformation matrices from link i to link i+1 for the 
  % current configuration q
  biTei= GetDirectGeometry(q, biTri, linkTypes);
  
  % Compute the vectors that show the position of joint i wrt the base
  r1= GetBasicVectorWrtBase(biTei, 1);
  r2= GetBasicVectorWrtBase(biTei, 2);
  r3= GetBasicVectorWrtBase(biTei, 3);
  r4= GetBasicVectorWrtBase(biTei, 4);
  r5= GetBasicVectorWrtBase(biTei, 5);
  r6= GetBasicVectorWrtBase(biTei, 6);
  r7= GetBasicVectorWrtBase(biTei, 7);
  
  % Get the vector tha shows the end-eff. position wrt the base
  bTe= GetTransformationWrtBase(biTei, 7) * T_7e;
  re= bTe(1:3, 4);
  
  %% Plot the manipulator motion
  % Plot the links
  plot3([0 r1(1)], [0 r1(2)], [0 r1(3)], 'b'); 
  plot3([r1(1) r2(1)], [r1(2) r2(2)], [r1(3) r2(3)], 'r'); 
  plot3([r2(1) r3(1)], [r2(2) r3(2)], [r2(3) r3(3)], 'g'); 
  plot3([r3(1) r4(1)], [r3(2) r4(2)], [r3(3) r4(3)], 'c');
  plot3([r4(1) r5(1)], [r4(2) r5(2)], [r4(3) r5(3)], 'b');
  plot3([r5(1) r6(1)], [r5(2) r6(2)], [r5(3) r6(3)], 'm');
  plot3([r6(1) r7(1)], [r6(2) r7(2)], [r6(3) r7(3)], 'r');
  plot3([r7(1) re(1)], [r7(2) re(2)], [r7(3) re(3)], 'k');
  
  % Plot the joints
  plot3([r1(1) r2(1)], [r1(2) r2(2)], [r1(3) r2(3)], 'ko'); 
  plot3([r2(1) r3(1)], [r2(2) r3(2)], [r2(3) r3(3)], 'ko'); 
  plot3([r3(1) r4(1)], [r3(2) r4(2)], [r3(3) r4(3)], 'ko');
  plot3([r4(1) r5(1)], [r4(2) r5(2)], [r4(3) r5(3)], 'ko');
  plot3([r5(1) r6(1)], [r5(2) r6(2)], [r5(3) r6(3)], 'ko');
  plot3([r6(1) r7(1)], [r6(2) r7(2)], [r6(3) r7(3)], 'ko');
  
  % Plot the end-eff.
  plot3([0 re(1)], [0 re(2)], [0 re(3)], 'kx');
  
  drawnow;
  
  % Update the time
  t= t + dt;
  
end

% Plot the joint-space trajectories
figure;
title('Joint-space trajectories');
hold on
grid on
xlabel('t');
ylabel('qi');
axis equal;

plot(Time, Trj(:,1), 'DisplayName', 'q1');
plot(Time, Trj(:,2), 'DisplayName', 'q2');
plot(Time, Trj(:,3), 'DisplayName', 'q3');
plot(Time, Trj(:,4), 'DisplayName', 'q4');
plot(Time, Trj(:,5), 'DisplayName', 'q5');
plot(Time, Trj(:,6), 'DisplayName', 'q6');
plot(Time, Trj(:,7), 'DisplayName', 'q7');

lgd = legend;
lgd.NumColumns = 1;






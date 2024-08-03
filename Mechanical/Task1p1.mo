within Librosuned.Mechanical;

model Task1p1
extends Modelica.Blocks.Icons.Block;

parameter Modelica.Units.SI.Length L2 = 0.2;
parameter Modelica.Units.SI.Length L3 = 0.5;
parameter Modelica.Units.SI.Length L4 = 0.8;
parameter Modelica.Units.SI.Length e1init = 0.3;
parameter Modelica.Units.SI.TranslationalSpringConstant k1 = 20;
parameter Modelica.Units.SI.TranslationalSpringConstant k2 = 15;
parameter Modelica.Units.SI.TranslationalDampingConstant b1 = 0.2;

parameter Modelica.Units.SI.Frequency omega = 10;
parameter Modelica.Units.SI.Velocity v10 = 1;

Modelica.Units.SI.Force F1, F2, F3;
Modelica.Units.SI.Length e1(start = e1init), e2, e3(start=0.2,fixed=true);

Modelica.Units.SI.Velocity v1, v2, v3, v4;
Modelica.Units.SI.Angle alpha;

initial equation
der(e1) = 0;

equation

sin(alpha)*L2 = (e1-e1init);
v1 = if time > 2 and time < 20 then  v10*sin(omega*time) else 0;

F1 = k1 * e1;
F2 = k2 * e2;
F3 = b1 * v4;

0 = -L2*F1 + L3*F2 + L4*F3;

v3 = der(e2);
v4 = der(e3);

v2*L2 = -v3*L3;
v2*L2 = -v4*L4;

der(e1) = v2-v1;
annotation(experiment(StartTime = 0,StopTime = 1, Tolerance = 1e-06, Interval = 0.002));
end Task1p1;
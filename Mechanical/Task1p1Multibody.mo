within Librosuned.Mechanical;

model Task1p1Multibody
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
  parameter Modelica.Units.SI.Frequency f0 = 1;
  
  
  inner Modelica.Mechanics.MultiBody.World world annotation(
    Placement(transformation(origin = {-90, -90}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute hinge(n = {0, 0, 1}, stateSelect=StateSelect.always) annotation(
    Placement(transformation(origin = {-30, -68}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation leftArm(r = {-L2, 0, 0}) annotation(
    Placement(transformation(origin = {-64, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation rightFirst(r = {L3, 0, 0}) annotation(
    Placement(transformation(origin = {6, -46}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation rightSecond(r = {L4 - L3, 0, 0}) annotation(
    Placement(transformation(origin = {44, -46}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.MultiBody.Parts.Fixed wall(r = {L3, 1, 0}, animation = false) annotation(
    Placement(transformation(origin = {16, 32}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Forces.Spring s2(c = k2, s_unstretched = 1) annotation(
    Placement(transformation(origin = {16, -6}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Forces.Damper d3(d = b1) annotation(
    Placement(transformation(origin = {56, -4}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Parts.Fixed wall2(r = {L4, 1, 0}, animation = false) annotation(
    Placement(transformation(origin = {56, 32}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));

  Modelica.Units.SI.Length e1, e2, e3;
 Modelica.Mechanics.MultiBody.Forces.Spring s1(c = k1, s_unstretched = 1)  annotation(
    Placement(transformation(origin = {-80, -20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
 Modelica.Mechanics.MultiBody.Parts.Fixed ceil(animation = false, r = {-L2, 1, 0})  annotation(
    Placement(transformation(origin = {-80, 72}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
protected
//  Modelica.Units.SI.Force Fx, Fy;
  //Modelica.Units.SI.Velocity vTarget(start = 0);

initial equation
  der(hinge.angle) = f0;
  //prismatic.s = 1;
  //prismatic.v = 0;
equation
  //vTarget = if time > 2 or time < 20 then v10*sin(time*omega) else 0;
  e1 = s1.length;
  e2 = s2.length;
  e3 = d3.length;
  connect(world.frame_b, hinge.frame_a) annotation(
    Line(points = {{-80, -90}, {-30, -90}, {-30, -78}}, color = {95, 95, 95}));
  connect(hinge.frame_b, leftArm.frame_a) annotation(
    Line(points = {{-30, -58}, {-30, -46}, {-54, -46}}, color = {95, 95, 95}));
  connect(rightFirst.frame_a, hinge.frame_b) annotation(
    Line(points = {{-4, -46}, {-30, -46}, {-30, -58}}, color = {95, 95, 95}));
  connect(rightSecond.frame_a, rightFirst.frame_b) annotation(
    Line(points = {{34, -46}, {16, -46}}, color = {95, 95, 95}));
  connect(wall.frame_b, s2.frame_a) annotation(
    Line(points = {{16, 22}, {16, 4}}, color = {95, 95, 95}));
  connect(s2.frame_b, rightFirst.frame_b) annotation(
    Line(points = {{16, -16}, {16, -46}}, color = {95, 95, 95}));
  connect(d3.frame_b, rightSecond.frame_b) annotation(
    Line(points = {{56, -14}, {56, -46}, {54, -46}}, color = {95, 95, 95}));
  connect(wall2.frame_b, d3.frame_a) annotation(
    Line(points = {{56, 22}, {56, 6}}, color = {95, 95, 95}));
  connect(s1.frame_b, leftArm.frame_b) annotation(
    Line(points = {{-80, -30}, {-80, -46}, {-74, -46}}, color = {95, 95, 95}));
 connect(ceil.frame_b, s1.frame_a) annotation(
    Line(points = {{-80, 62}, {-80, -10}}, color = {95, 95, 95}));
  annotation(
    experiment(StartTime = 0, StopTime = 0),
    Diagram);
end Task1p1Multibody;
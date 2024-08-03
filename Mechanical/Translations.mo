within Librosuned.Mechanical;

model Translations

  parameter Modelica.Units.SI.Length yPivot = 0.35;
  parameter Modelica.Units.SI.Length LArm = 1.2;

  inner Modelica.Mechanics.MultiBody.World world annotation(
    Placement(transformation(origin = {-90, -90}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic(useAxisFlange = true, s(start = 1))  annotation(
    Placement(transformation(origin = {-34, -90}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.Translational.Sources.Speed speed(useSupport = true, s(fixed = false))  annotation(
    Placement(transformation(origin = {-38, -54}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y = targetSpeed) annotation(
    Placement(transformation(origin = {-78, -54}, extent = {{-10, -10}, {10, 10}})));

  Real targetSpeed;
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed(animation = false, r = {0, LArm + yPivot, 0})  annotation(
    Placement(transformation(origin = {-78, 30}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.MultiBody.Forces.Spring spring1(c = 15, s_unstretched = 0.2)  annotation(
    Placement(transformation(origin = {-28, 30}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(phi(fixed = true))  annotation(
    Placement(transformation(origin = {-2, -18}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed1(r = {1, yPivot, 0}, animation = false)  annotation(
    Placement(transformation(origin = {-34, -18}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation(r = {0, LArm, 0})  annotation(
    Placement(transformation(origin = {32, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Parts.PointMass pointMass(m = 1)  annotation(
    Placement(transformation(origin = {18, -90}, extent = {{-10, -10}, {10, 10}})));
initial equation
  
  speed.s = 1;

  
  
equation
  targetSpeed = if time > 0.5 then sin(time*2*Modelica.Constants.pi) else 0;
  connect(world.frame_b, prismatic.frame_a) annotation(
    Line(points = {{-80, -90}, {-44, -90}}, color = {95, 95, 95}));
  connect(prismatic.support, speed.support) annotation(
    Line(points = {{-38, -84}, {-38, -64}}, color = {0, 127, 0}));
  connect(speed.flange, prismatic.axis) annotation(
    Line(points = {{-28, -54}, {-26, -54}, {-26, -84}}, color = {0, 127, 0}));
  connect(realExpression.y, speed.v_ref) annotation(
    Line(points = {{-67, -54}, {-50, -54}}, color = {0, 0, 127}));
  connect(fixed.frame_b, spring1.frame_a) annotation(
    Line(points = {{-68, 30}, {-38, 30}}, color = {95, 95, 95}));
  connect(fixed1.frame_b, revolute.frame_a) annotation(
    Line(points = {{-24, -18}, {-12, -18}}, color = {95, 95, 95}));
  connect(revolute.frame_b, fixedTranslation.frame_a) annotation(
    Line(points = {{8, -18}, {32, -18}}, color = {95, 95, 95}));
  connect(spring1.frame_b, fixedTranslation.frame_b) annotation(
    Line(points = {{-18, 30}, {32, 30}, {32, 2}}, color = {95, 95, 95}));
  connect(prismatic.frame_b, pointMass.frame_a) annotation(
    Line(points = {{-24, -90}, {18, -90}}, color = {95, 95, 95}));
end Translations;
within Librosuned.Mechanical;

block RealVectorExpression
  extends Modelica.Blocks.Icons.Block;
  final parameter Integer n = 3;
  Modelica.Blocks.Interfaces.RealOutput y[n] annotation(
    Placement(transformation(origin = {104, -2}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {104, -2}, extent = {{-10, -10}, {10, 10}})));

end RealVectorExpression;
import 'dart:ui';

class CanvasHelper {
  static drawObjectWithShadow(
      List<Path> object, Canvas canvas, Size size, Paint brush) {
    double factorIncerememnt = 0.05;
    double shadowElevation = size.width * 0.025;
    double aspectRatio = size.width / size.height;
    double horizontalOffset = size.width * 0.115;
    Offset maxShadowOffset =
        Offset(-horizontalOffset, horizontalOffset / aspectRatio);
    for (Path shadowPath in object) {
      double factor = 0.01;
      while (factor <= 1) {
        canvas.drawShadow(
            shadowPath.shift(Offset(
                maxShadowOffset.dx * factor, maxShadowOffset.dy * factor)),
            const Color.fromRGBO(37, 45, 75, 0.25),
            shadowElevation,
            true);
        factor += factorIncerememnt;
      }
    }

    for (Path objectPath in object) {
      canvas.drawPath(objectPath, brush);
    }
  }

  draw3D(Canvas canvas, Size size, Paint brush, List<Path> object) {}
}

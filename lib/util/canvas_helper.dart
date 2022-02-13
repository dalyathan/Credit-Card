import 'dart:ui';

import 'package:flutter/cupertino.dart';

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
    double maxDepth = 10;
    double startZIndex = 0;
    double zIndexIncrement = 1;
    late Matrix4 transformer;
    Color currentColor = brush.color;
    for (Path objectPath in object) {
      double layerZIndex = startZIndex;
      while (layerZIndex <= maxDepth) {
        transformer =
            Matrix4.translationValues(layerZIndex, -layerZIndex, layerZIndex);
        Color darkenedColor = Color.fromRGBO(currentColor.red + 20,
            currentColor.green + 120, currentColor.blue + 120, 1);
        canvas.drawPath(objectPath.transform(transformer.storage),
            brush..color = darkenedColor);
        layerZIndex += zIndexIncrement;
      }
      canvas.drawPath(objectPath.transform(transformer.storage),
          brush..color = currentColor);
    }
  }

  draw3D(Canvas canvas, Size size, Paint brush, List<Path> object) {}
}

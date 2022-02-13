import 'dart:ui';
import 'package:vector_math/vector_math_64.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as material;

class CanvasHelper {
  static drawObjectWithShadow(List<Path> object, Canvas canvas, Size size,
      Paint brush, Vector3 objectDepthAxis) {
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
    makeAppear3D(object, canvas, size, brush, objectDepthAxis);
  }

  static makeAppear3D(List<Path> object, Canvas canvas, Size size, Paint brush,
      Vector3 objectDepthAxis) {
    double maxDepth = 20;
    double startZIndex = 0;
    double zIndexIncrement = 1;
    late Matrix4 transformer;
    Color currentColor = brush.color;
    Color darkenedColor = //material.Colors.black87;
        Color.alphaBlend(material.Colors.black87, currentColor);
    for (Path objectPath in object) {
      double layerZIndex = startZIndex;
      while (layerZIndex <= maxDepth) {
        transformer = Matrix4.translationValues(objectDepthAxis.x * layerZIndex,
            objectDepthAxis.y * layerZIndex, objectDepthAxis.z * layerZIndex);
        canvas.drawPath(objectPath.transform(transformer.storage),
            brush..color = darkenedColor);
        layerZIndex += zIndexIncrement;
      }
    }
    for (Path objectPath in object) {
      canvas.drawPath(objectPath.transform(transformer.storage),
          brush..color = currentColor);
    }
  }
}

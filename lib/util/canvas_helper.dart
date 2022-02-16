import 'dart:ui';
import 'package:vector_math/vector_math_64.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as material;

class CanvasHelper {
  static draw3dWithShadow(List<Path> object, Canvas canvas, Size size,
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
    draw3DWithoutShadow(object, canvas, size, brush, objectDepthAxis);
  }

  static draw3DWithoutShadow(List<Path> object, Canvas canvas, Size size,
      Paint brush, Vector3 objectDepthAxis,
      {bool isShader = false}) {
    double maxDepth = size.width * 0.1;
    double startZIndex = 0;
    double zIndexIncrement = 1;
    late Matrix4 transformer;
    Color currentColor = brush.color;
    late Color darkenedColor;
    if (isShader) {
      darkenedColor = const Color.fromRGBO(29, 53, 78, 1);
    } else {
      darkenedColor = Color.alphaBlend(material.Colors.black54, currentColor);
    }
    for (Path objectPath in object) {
      double layerZIndex = startZIndex;
      while (layerZIndex <= maxDepth) {
        transformer = Matrix4.translationValues(objectDepthAxis.x * layerZIndex,
            objectDepthAxis.y * layerZIndex, objectDepthAxis.z * layerZIndex);
        canvas.drawPath(objectPath.transform(transformer.storage),
            Paint()..color = darkenedColor);
        layerZIndex += zIndexIncrement;
      }
    }
    for (Path objectPath in object) {
      canvas.drawPath(objectPath.transform(transformer.storage),
          brush..color = currentColor);
    }
  }
}

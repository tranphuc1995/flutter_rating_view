import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:math' as math;

Widget RatingViewWidget(
    {required int sizeStar,
    required int spaceHorizontal,
    required double starRating,
    required Color colorStar}) {
  return CustomPaint(
      foregroundPainter: DrawStar(
          sizeStar: sizeStar,
          spaceHorizontal: spaceHorizontal,
          starRating: starRating,
          colorStar: colorStar));
}

class DrawStar extends CustomPainter {
  int sizeStar;
  int spaceHorizontal;
  double starRating;
  Color colorStar;
  final originalRotation = -72;
  var points = <Offset>[];
  DrawStar(
      {required this.sizeStar,
      required this.spaceHorizontal,
      required this.starRating,
      this.colorStar = Colors.yellow});
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();

    var paint = Paint()
      ..color = colorStar
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    var paintWhite = Paint()
      ..color = Colors.grey.shade50
      ..strokeWidth = 1
      ..style = PaintingStyle.fill;

    for (var i = 0; i < 5; i++) {
      var firstPoint =
          Offset((sizeStar * i) + sizeStar / 2 + (spaceHorizontal * i), 0);
      var tempPoint = Offset(
          (sizeStar * i) + (sizeStar / 2) + (spaceHorizontal * i),
          sizeStar / 4);

      // draw percent
      if (((starRating - i) > 0) && ((starRating - i) < 1)) {
        points.add(firstPoint);
        var percent = starRating - i;
        var bigTempRotation = (math.pi) * (originalRotation / 180);
        var circleBgTemp = Offset(
            (sizeStar * i) + (sizeStar / 2) + (spaceHorizontal * i),
            sizeStar / 2);
        var tempBgPoint = Offset(
            ((firstPoint.dx - circleBgTemp.dx) * math.cos(bigTempRotation)) -
                ((firstPoint.dy - circleBgTemp.dy) *
                    math.sin(bigTempRotation)) +
                circleBgTemp.dx,
            ((firstPoint.dx - circleBgTemp.dx) * math.sin(bigTempRotation)) +
                ((firstPoint.dy - circleBgTemp.dy) *
                    math.cos(bigTempRotation)) +
                circleBgTemp.dy);
        var newPath = Path();
        newPath.moveTo(tempBgPoint.dx, 0);
        newPath.lineTo(tempBgPoint.dx, sizeStar.toDouble());
        newPath.lineTo(
            tempBgPoint.dx + (sizeStar * percent), sizeStar.toDouble());
        newPath.lineTo(tempBgPoint.dx + (sizeStar * percent), 0);
        newPath.close();
        paint.style = PaintingStyle.fill;
        canvas.drawPath(newPath, paint);
      }
      if ((i + 1) > starRating) {
        paint.style = PaintingStyle.stroke;
      } else {
        paint.style = PaintingStyle.fill;
      }
      //
      path.moveTo(firstPoint.dx, firstPoint.dy);
      for (var j = 0; j < 5; j++) {
        var circleCenter = Offset(
            (sizeStar * i) + (sizeStar / 2) + (spaceHorizontal * i),
            sizeStar / 2);
        var bigRotation = (math.pi) * (originalRotation * (j + 1) / 180);
        var smallRotation = (math.pi) *
            (((originalRotation * j) + (originalRotation / 2))) /
            180;
        var secondPoint = Offset(
            ((firstPoint.dx - circleCenter.dx) * math.cos(bigRotation)) -
                ((firstPoint.dy - circleCenter.dy) * math.sin(bigRotation)) +
                circleCenter.dx,
            ((firstPoint.dx - circleCenter.dx) * math.sin(bigRotation)) +
                ((firstPoint.dy - circleCenter.dy) * math.cos(bigRotation)) +
                circleCenter.dy);

        var thirdPoint = Offset(
            ((tempPoint.dx - circleCenter.dx) * math.cos(smallRotation)) -
                ((tempPoint.dy - circleCenter.dy) * math.sin(smallRotation)) +
                circleCenter.dx,
            ((tempPoint.dx - circleCenter.dx) * math.sin(smallRotation)) +
                ((tempPoint.dy - circleCenter.dy) * math.cos(smallRotation)) +
                circleCenter.dy);
        if (((starRating - i) > 0) && ((starRating - i) < 1)) {
          points.add(thirdPoint);
          points.add(secondPoint);
        }
        path.lineTo(thirdPoint.dx, thirdPoint.dy);
        path.lineTo(secondPoint.dx, secondPoint.dy);
      }
      canvas.drawPath(path, paint);
      //draw white background
      if (((starRating - i) > 0) && ((starRating - i) < 1)) {
        //
        var newPath = Path();
        newPath.moveTo(points[2].dx, 0);
        newPath.lineTo(points[0].dx, points[0].dy);
        newPath.lineTo(points[1].dx, points[1].dy);
        newPath.lineTo(points[2].dx, points[2].dy);
        newPath.close();
        //
        newPath.moveTo(points[2].dx, points[2].dy);
        newPath.lineTo(points[3].dx, points[3].dy);
        newPath.lineTo(points[4].dx, points[4].dy);
        newPath.lineTo(points[4].dx, sizeStar.toDouble());
        newPath.lineTo(points[2].dx, sizeStar.toDouble());
        newPath.close();
        //
        newPath.moveTo(points[4].dx, points[4].dy);
        newPath.lineTo(points[4].dx, sizeStar.toDouble());
        newPath.lineTo(points[6].dx, sizeStar.toDouble());
        newPath.lineTo(points[6].dx, points[6].dy);
        newPath.lineTo(points[5].dx, points[5].dy);
        newPath.close();
        //
        newPath.moveTo(points[6].dx, points[6].dy);
        newPath.lineTo(points[7].dx, points[7].dy);
        newPath.lineTo(points[8].dx, points[8].dy);
        newPath.lineTo(points[8].dx, sizeStar.toDouble());
        newPath.lineTo(points[6].dx, sizeStar.toDouble());
        newPath.close();
        //
        newPath.moveTo(points[8].dx, points[8].dy);
        newPath.lineTo(points[8].dx, 0);
        newPath.lineTo(points[0].dx, points[0].dy);
        newPath.lineTo(points[9].dx, points[9].dy);
        newPath.close();
        canvas.drawPath(newPath, paintWhite);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

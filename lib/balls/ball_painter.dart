import 'package:flutter/material.dart';
import 'dart:math';

class Ball {
  double x;
  double y;
  double dx;
  double dy;
  double radius;
  Color color;
  double opacity;

  Ball()
      : x = Random().nextDouble() * 300,
        y = Random().nextDouble() * 600,
        dx = Random().nextDouble() * 2 - 1,
        dy = Random().nextDouble() * 2 - 1,
        radius = Random().nextDouble() * 20 + 10,
        color = Color.fromRGBO(Random().nextInt(256), Random().nextInt(256),
            Random().nextInt(256), 1.0),
        opacity = Random().nextDouble() * 0.5 + 0.5;

  void update() {
    x += dx;
    y += dy;

    if (x < 0 || x > 300) {
      dx *= -1;
    }
    if (y < 0 || y > 600) {
      dy *= -1;
    }
  }
}

class BallsPainter extends CustomPainter {
  final List<Ball> balls;

  BallsPainter(this.balls);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    for (var ball in balls) {
      paint.color = ball.color.withOpacity(ball.opacity);
      canvas.drawCircle(Offset(ball.x, ball.y), ball.radius, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

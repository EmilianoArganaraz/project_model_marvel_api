import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../config/resources/color_palette.dart';
import '../../config/routes/routing.gr.dart';

class SplashScreen extends HookWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AnimationController transition =
        useAnimationController(duration: const Duration(milliseconds: 800));

    final AnimationController screen =
        useAnimationController(duration: const Duration(milliseconds: 2000));

    final Animation<Offset> animation = Tween<Offset>(
      begin: const Offset(5, 0),
      end: const Offset(0, 0),
    ).animate(transition);

    transition.forward();
    screen.forward().whenComplete(() => ExtendedNavigator.root
        .pushAndRemoveUntil(
            Routes.comicPage, (Route<dynamic> route) => false));

    return Scaffold(
        backgroundColor: ColorPalette.primaryColor,
        body: SafeArea(
            child: Stack(
          children: <Widget>[
            Positioned(
              top: -200,
              left: -100,
              child: buildCircle(),
            ),
            Positioned(
              top: -160,
              right: -100,
              child: buildCircle(),
            ),
            Positioned(
              top: 250,
              left: 20,
              child: buildContainerCustomForm(animation),
            ),
            Positioned(
              bottom: -200,
              right: -250,
              child: buildCircle(),
            ),
            Positioned(
              bottom: -280,
              right: -100,
              child: buildCircle(),
            ),
          ],
        )));
  }

  Widget buildCircle() {
    return Transform.rotate(
      angle: -pi,
      child: Container(
        height: 360.0,
        width: 360.0,
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(200.0),
        ),
      ),
    );
  }

  Widget buildContainerCustomForm(Animation<Offset> animation) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        SizedBox(
          height: 360.0,
          width: 360.0,
          child: CustomPaint(
            painter: _CustomCircle(),
          ),
        ),
        Positioned(
          top: 110,
          child: SlideTransition(
            position: animation,
            child: const Icon(
              Icons.library_books,
              size: 60,
              color: ColorPalette.red,
            ),
          ),
        )
      ],
    );
  }
}

class _CustomCircle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white10
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    final Path path = Path();
    path.moveTo(size.width * 0.7, 0);
    path.quadraticBezierTo(0, 0, size.width * 0.1, size.height * 0.6);
    path.quadraticBezierTo(100, 350, size.width - 10, size.height * 0.7);
    path.quadraticBezierTo(330, 0, size.width - 110, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

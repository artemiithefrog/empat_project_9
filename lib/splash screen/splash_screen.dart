import 'package:flutter/material.dart';
import 'splash_screen_viewmodel.dart';
import '../balls/ball_painter.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  final SplashScreenViewModel viewModel = SplashScreenViewModel();
  late List<Ball> _balls;

  @override
  void initState() {
    super.initState();
    viewModel.initAnimation(this);

    _balls = List.generate(20, (_) => Ball());

    viewModel.animationController.addListener(() {
      setState(() {
        for (var ball in _balls) {
          ball.update();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomPaint(
            painter: BallsPainter(_balls),
            child: Container(),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeTransition(
                  opacity: viewModel.animation,
                  child: const Icon(
                    Icons.person,
                    size: 150,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    viewModel.navigateToImageCarousel(context);
                  },
                  child: const Text('Get Started'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }
}

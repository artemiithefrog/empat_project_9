import 'package:flutter/material.dart';
import '../image/image_carousel_screen.dart';

class SplashScreenViewModel {
  late AnimationController _animationController;
  late Animation<double> animation;

  void initAnimation(TickerProvider tickerProvider) {
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: tickerProvider,
    )..repeat();

    animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
  }

  AnimationController get animationController => _animationController;

  void navigateToImageCarousel(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImageCarouselScreen(),
      ),
    );
  }

  void dispose() {
    _animationController.dispose();
  }
}

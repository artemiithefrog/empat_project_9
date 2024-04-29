import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageCarouselViewModel {
  int _currentImageIndex = 0;
  List<String> imageUrls = [
    'https://via.placeholder.com/400x300.png?text=Image+1',
    'https://via.placeholder.com/400x300.png?text=Image+2',
    'https://via.placeholder.com/400x300.png?text=Image+3',
    'https://via.placeholder.com/400x300.png?text=Image+4',
  ];

  void onPageChanged(int index, CarouselPageChangedReason reason) {
    _currentImageIndex = index;
  }

  List<Widget> buildIndicators(BuildContext context) {
    return imageUrls.asMap().entries.map((entry) {
      return GestureDetector(
        onTap: () => _currentImageIndex = entry.key,
        child: Container(
          width: 10.0,
          height: 10.0,
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentImageIndex == entry.key ? Colors.blue : Colors.grey,
          ),
        ),
      );
    }).toList();
  }
}

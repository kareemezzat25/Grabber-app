import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:grabber_app/models/data.dart';

class SlidersMove extends StatelessWidget {
  const SlidersMove({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: DataApp.sliders.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
        return Image.asset(
          DataApp.sliders[itemIndex],
        );
      },
      options: CarouselOptions(
          autoPlay: true,
          autoPlayInterval: Duration(milliseconds: 800),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          scrollDirection: Axis.horizontal,
          viewportFraction: 0.8,
          aspectRatio: 16 / 9,
          enlargeCenterPage: true),
    );
  }
}

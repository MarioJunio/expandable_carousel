import 'package:expandable_carousel/app/presentation/pages/carousel_page.dart';
import 'package:expandable_carousel/shared/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Expandable Carousel",
      home: const CarouselPage(),
      theme: ThemeData(
        primaryColor: Colors.grey,
        textTheme: TextTheme(
          headlineSmall: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
          titleMedium: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black54,
          ),
          bodyMedium: TextStyle(
            fontSize: 18,
            color: AppColors.whiteSnow,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ),
  );
}

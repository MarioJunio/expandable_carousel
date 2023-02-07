import 'package:expandable_carousel/app/presentation/widgets/carousel/carousel_widget.dart';
import 'package:expandable_carousel/shared/colors.dart';
import 'package:flutter/material.dart';

class CarouselPage extends StatefulWidget {
  const CarouselPage({super.key});

  @override
  State<CarouselPage> createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Stack(
          children: [
            _buildTopBar(),
            CarouselWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.search,
              size: 30,
              color: AppColors.whiteSnow,
            ),
            Text(
              "Valentine's Day Photos",
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: AppColors.whiteSnow,
                  ),
            ),
            Icon(
              Icons.location_pin,
              size: 30,
              color: AppColors.whiteSnow,
            ),
          ],
        ),
      );
}

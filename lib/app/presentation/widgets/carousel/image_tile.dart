import 'package:expandable_carousel/shared/colors.dart';
import 'package:flutter/material.dart';

class ImageTile extends StatelessWidget {
  const ImageTile({
    super.key,
    required this.image,
    required this.imageWidth,
    required this.imageHeight,
    required this.title,
    required this.address,
  });

  final String image;
  final double imageWidth, imageHeight;

  final String title;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Stack(
        children: [
          _buildImage(context),
          _buildTitle(context),
          _buildAddress(context),
        ],
      ),
    );
  }

  _buildImage(context) => Image.asset(
        image,
        width: imageWidth,
        height: imageHeight,
        fit: BoxFit.cover,
      );

  _buildTitle(context) => Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            title.toUpperCase(),
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColors.whiteSnow,
                ),
          ),
        ),
      );

  _buildAddress(context) => Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: [
              Icon(
                Icons.location_pin,
                size: 30,
                color: AppColors.whiteSnow,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  address,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
      );
}

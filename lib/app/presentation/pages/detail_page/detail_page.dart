
import 'package:expandable_carousel/shared/colors.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    super.key,
    required this.title,
    required this.image,
    required this.address,
    required this.legend,
    required this.favorite,
  });

  final String title;
  final String image;
  final String address;
  final String legend;
  final bool favorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildImage(context),
          buildDescription(context),
          buildListComments(),
        ],
      ),
    );
  }

  Widget buildImage(context) => SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.35,
        child: Stack(
          children: [
            Image.asset(
              image,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.35,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildImageTitle(context),
                _buildImageAddress(context),
              ],
            ),
          ],
        ),
      );

  Widget buildDescription(context) => Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Text(
                legend,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.black87, fontWeight: FontWeight.w500),
              ),
            ),
            Icon(
              Icons.star,
              size: 30,
              color: favorite ? Colors.amber : Colors.amberAccent,
            ),
          ],
        ),
      );

  Widget buildListComments() => Expanded(
        child: ListView(),
      );

  _buildImageTitle(context) => Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            title.toUpperCase(),
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColors.whiteSnow,
                ),
          ),
        ),
      );

  _buildImageAddress(context) => Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
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

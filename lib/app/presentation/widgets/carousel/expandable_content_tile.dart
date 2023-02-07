import 'package:expandable_carousel/shared/colors.dart';
import 'package:flutter/material.dart';

class ExpandableContentTile extends StatelessWidget {
  const ExpandableContentTile({
    super.key,
    required this.legend,
    required this.isFavorite,
    required this.date,
  });

  final String legend;
  final String date;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteSnow,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
            child: Text(
              legend,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.black87, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 2),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  date,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.black45, fontWeight: FontWeight.w500),
                ),
                Icon(
                  Icons.star,
                  size: 30,
                  color: isFavorite ? Colors.amber : Colors.grey,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

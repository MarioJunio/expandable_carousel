import 'package:expandable_carousel/app/presentation/pages/detail_page/detail_page.dart';
import 'package:expandable_carousel/app/presentation/widgets/carousel/expandable_content_tile.dart';
import 'package:expandable_carousel/app/presentation/widgets/carousel/image_tile.dart';
import 'package:flutter/material.dart';

class CarouselTile extends StatefulWidget {
  const CarouselTile({
    super.key,
    required this.title,
    required this.address,
    required this.image,
    required this.legend,
    required this.date,
    required this.isFavorite,
    required this.pageController,
    required this.width,
    required this.height,
    required this.expandedWidth,
    required this.expandedHeight,
    required this.paddingRate,
  });

  final String image;
  final String title;
  final String address;
  final String legend;
  final String date;
  final bool isFavorite;
  final double width, height;
  final double expandedWidth, expandedHeight;
  final double paddingRate;

  final PageController pageController;

  @override
  State<CarouselTile> createState() => _CarouselTileState();
}

class _CarouselTileState extends State<CarouselTile> {
  Duration expandableDuration = const Duration(milliseconds: 300);
  bool expanded = false;

  @override
  void initState() {
    super.initState();

    widget.pageController.addListener(() {
      if (expanded) {
        setState(() {
          expanded = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Stack(
        alignment: Alignment.center,
        children: [
          _buildBoxDescription(context),
          _buildImageContent(context),
        ],
      ),
    );
  }

  Widget _buildBoxDescription(context) => AnimatedPositioned(
        duration: expandableDuration,
        bottom: expanded ? 50 : 109,
        width: expanded ? widget.expandedWidth : widget.width,
        height: expanded ? widget.expandedHeight : widget.height,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: EdgeInsets.symmetric(vertical: widget.paddingRate),
          child: ExpandableContentTile(
            date: widget.date,
            isFavorite: widget.isFavorite,
            legend: widget.legend,
          ),
        ),
      );

  Widget _buildImageContent(context) => AnimatedPositioned(
        width: widget.width,
        height: widget.height,
        duration: const Duration(milliseconds: 100),
        top: expanded ? 90 : 107,
        child: GestureDetector(
          onPanUpdate: onPanUpdate,
          onTap: onTapTile,
          child: AnimatedContainer(
            padding: EdgeInsets.symmetric(vertical: widget.paddingRate),
            duration: expandableDuration,
            child: ImageTile(
              address: widget.address,
              image: widget.image,
              imageWidth: widget.width,
              imageHeight: widget.height,
              title: widget.title,
            ),
          ),
        ),
      );

  void onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dy < 0) {
      setState(() {
        expanded = true;
      });
    } else if (details.delta.dy > 0) {
      setState(() {
        expanded = false;
      });
    }
  }

  void onTapTile() {
    if (expanded) {
      Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return FadeTransition(
              opacity: CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOut,
              ),
              child: DetailPage(
                title: widget.title,
                image: widget.image,
                legend: widget.legend,
                address: widget.address,
                favorite: widget.isFavorite,
              ),
            );
          },
        ),
      );

      return;
    }

    setState(() {
      expanded = !expanded;
    });
  }
}

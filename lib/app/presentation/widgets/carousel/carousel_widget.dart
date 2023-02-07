import 'package:expandable_carousel/app/presentation/widgets/carousel/carousel_tile.dart';
import 'package:flutter/material.dart';

class CarouselWidget extends StatefulWidget {
  CarouselWidget({super.key});

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  final double rateHeight = 64;

  final data = [
    {
      'id': 1,
      'image': 'assets/imgs/1.jpeg',
      'title': 'Monte Carlo',
      'address': 'Tanzânia',
      'legend':
          'Lorem ipsum dolor sit amet. Rem commodi sunt sed maxime explicabo ut voluptas deserunt ut nihil voluptatem. Qui ipsa dolorem est nobis omnis ab accusantium numquam qui facilis eaque qui facilis beatae.',
      'date': '01/02/21',
      'favorite': false,
    },
    {
      'id': 2,
      'image': 'assets/imgs/2.jpeg',
      'title': 'Superior Lake',
      'address': 'Canada',
      'legend':
          'Lorem ipsum dolor sit amet. 33 perferendis sequi 33 praesentium labore et optio labore. Sit quia quam est aliquid tenetur a veritatis possimus et molestias minima qui omnis tenetur?',
      'date': '03/04/22',
      'favorite': true,
    },
    {
      'id': 3,
      'image': 'assets/imgs/3.jpg',
      'title': 'Hitua',
      'address': 'China',
      'legend':
          'Lorem ipsum dolor sit amet. Ea quaerat possimus quo ratione facilis cum sint modi. Sit illo quod et eaque accusantium cum dolores laboriosam non delectus deserunt et molestiae sapiente?',
      'date': '04/01/23',
      'favorite': false,
    },
    {
      'id': 4,
      'image': 'assets/imgs/4.jpeg',
      'title': 'Landsnope',
      'address': 'Finalnd',
      'legend':
          'Lorem ipsum dolor sit amet. Et saepe earum qui quibusdam aliquam est architecto sint 33 corrupti ratione ea maiores error et fuga atque et veritatis molestiae. Qui vitae quia qui quia voluptatem ut atque commodi.',
      'date': '05/10/23',
      'favorite': true,
    },
  ];

  final PageController _pageController = PageController(viewportFraction: 0.85);

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      itemCount: data.length,
      onPageChanged: (value) {
        setState(() {
          currentPage = value;
        });
      },
      itemBuilder: (context, index) {
        final Map<String, dynamic> picture = data[index];

        final double paddingRate = (index - currentPage).abs() * rateHeight;

        final double width = MediaQuery.of(context).size.width * 0.75;
        final double height = MediaQuery.of(context).size.height * 0.6;

        final double expandedWidth = MediaQuery.of(context).size.width * 0.8;
        final double expandedHeight = MediaQuery.of(context).size.height * 0.64;

        return CarouselTile(
          image: picture['image'],
          title: picture['title'],
          address: picture['address'],
          date: picture['date'],
          isFavorite: picture['favorite'],
          legend: picture['legend'],
          pageController: _pageController,
          width: width,
          height: height,
          expandedWidth: expandedWidth,
          expandedHeight: expandedHeight,
          paddingRate: paddingRate,
        );
      },
    );
  }
}

// size = 9
// atual = 3

// prev: abs(2 - atual) = 1
// prev2: abs(1 - atual) = 2
// prev3: abs(0 - atual) = 3

// next: abs(4 - atual) = 1
// next2: abs(5 - atual) = 2
// next3: abs(6 - atual) = 3


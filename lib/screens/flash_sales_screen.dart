import 'package:carousel_slider/carousel_slider.dart';
import 'package:daybrec/widgets/app_drawer.dart';
import 'package:daybrec/widgets/custom_app_bar.dart';
import 'package:daybrec/widgets/prdouct_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../models/carousel_category.dart';
import '../providers/product_provider.dart';
import '../widgets/hero_carousel_card.dart';

class FlashSalesScreen extends StatelessWidget {
  const FlashSalesScreen({super.key});

  static const routeName = './flashSales';

  @override
  Widget build(BuildContext context) {
    final list = Provider.of<ProductList>(context).items;
    return Scaffold(
      drawer: const AppDrawer(),
        appBar: const CustomAppBar(),
        body: SingleChildScrollView(
            child: Column(children: [
          CarouselSlider(
            options: CarouselOptions(
            //animateToClosest: true,
              autoPlay: true,
              aspectRatio: 1.5,
              viewportFraction: 0.9,
              enableInfiniteScroll: false,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              enlargeCenterPage: true,
            ),
            items: Category.categories
                .map((category) => HeroCarouselCard(category: category))
                .toList(),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            width: double.infinity,
            child: const Text('New Arrivals',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                mainAxisSize: MainAxisSize.min,
                children: list
                    .map((e) => ChangeNotifierProvider.value(
                        value: e, child: ProductCard()))
                    .toList()),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            width: double.infinity,
            child: const Text('Bites',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                mainAxisSize: MainAxisSize.min,
                children: list
                    .map((e) => ChangeNotifierProvider.value(
                        value: e, child: ProductCard()))
                    .toList()),
          ),
        ])));
  }
}

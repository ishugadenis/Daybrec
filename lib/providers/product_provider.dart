import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  String id;
  String productName;
  String imageUrl;
  double price;

  Product(
      {required this.id, required this.productName, required this.imageUrl, required this.price});
}

class ProductList with ChangeNotifier {
  final List<Product> _items = [
    Product(
        id: 'p1',
        imageUrl: 'assets/carousels/boots.jpg',
        price: 23.00,
        productName: 'Airforce'),
    Product(
        id: 'p2',
        imageUrl: 'assets/carousels/airforce.jpg',
        price: 23.00,
        productName: 'Airforce'),
    Product(
        id: 'p3',
        imageUrl: 'assets/carousels/boots.jpg',
        price: 23.00,
        productName: 'Airforce'),
  ];

  List<Product> get items {
    return [..._items];
  }
}

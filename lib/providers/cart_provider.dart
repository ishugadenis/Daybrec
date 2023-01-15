import 'package:daybrec/providers/product_provider.dart';
import 'package:flutter/widgets.dart';

class CartItem with ChangeNotifier {
  final String id;
  final String productName;
  final int quantity;
  final String imageUrl;
  final double price;

  CartItem({
    required this.id,
    required this.productName,
    required this.quantity,
    required this.imageUrl,
    required this.price,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};
  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get productAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total = cartItem.price * cartItem.quantity;
    });
    return total;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(
      String productId, double price, String imageUrl, String productName) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingCartItem) => CartItem(
                id: existingCartItem.id,
                imageUrl: existingCartItem.imageUrl,
                productName: existingCartItem.productName,
                price: existingCartItem.price,
                quantity: existingCartItem.quantity + 1,
              ));
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
              id: DateTime.now().toString(),
              imageUrl: imageUrl,
              productName: productName,
              quantity: 1,
              price: price));
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.update(
        productId,
        (existingCartItem) => CartItem(
              id: existingCartItem.id,
              imageUrl: existingCartItem.imageUrl,
              price: existingCartItem.price,
              productName: existingCartItem.productName,
              quantity: 0,
            ));
    _items.remove(productId);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (!_items.containsKey(productId)) {
      return;
    }
    if (_items[productId]!.quantity > 1) {
      _items.update(
          productId,
          (existingCartItem) => CartItem(
                id: existingCartItem.id,
                imageUrl: existingCartItem.imageUrl,
                price: existingCartItem.price,
                productName: existingCartItem.productName,
                quantity: existingCartItem.quantity - 1,
              ));
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }

}
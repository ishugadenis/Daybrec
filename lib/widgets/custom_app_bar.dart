import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/cart_screen.dart';
import '../providers/cart_provider.dart';
import 'badge.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      title: const Text('Rav Supps'),
      actions: [
        Consumer<Cart>(
          builder: (_, cart, ch) => Badge(
            color:Colors.white,
            value: cart.itemCount.toString(),
            child: ch!,
          ),
          child: IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushReplacementNamed(context, CartScreen.routeName);
            },
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}

import 'package:daybrec/screens/flash_sales_screen.dart';
import 'package:flutter/material.dart';

import '../screens/cart_screen.dart';
import '../screens/trends_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: Column(children: [
        AppBar(
          backgroundColor: Colors.black,
          title: const Text('Hello Friend'),
          automaticallyImplyLeading: false,
        ),
        InkWell(
          onTap: () {
            Navigator.of(context)
                .pushReplacementNamed(FlashSalesScreen.routeName);
          },
          child: const ListTile(
            leading: Icon(Icons.flash_on_sharp, color: Colors.white),
            title: Text('Flash sales', style: TextStyle(color: Colors.white)),
          ),
        ),
        const Divider(
          color: Colors.white,
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).pushReplacementNamed(TrendsScreen.routeName);
          },
          child: const ListTile(
            leading: Icon(Icons.home, color: Colors.white),
            title: Text('Home', style: TextStyle(color: Colors.white)),
          ),
        ),
        const Divider(
          color: Colors.white,
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).pushReplacementNamed(CartScreen.routeName);
          },
          child: const ListTile(
            leading: Icon(Icons.shopping_bag_outlined, color: Colors.white),
            title: Text('My Cart', style: TextStyle(color: Colors.white)),
          ),
        ),
        const Divider(
          color: Colors.white,
        ),
      ]),
    );
  }
}

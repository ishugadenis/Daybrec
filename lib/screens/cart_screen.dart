import 'package:daybrec/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';
import '../widgets/cart_item_holder.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  static const routeName = './cartScreen';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('My Cart'),
      ),
      body: Column(
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: cart.items.length,
              itemBuilder: (context, i) => CartItemHolder(
                    cart.items.values.toList()[i].productName,
                    cart.items.values.toList()[i].price,
                    cart.items.keys.toList()[i],
                    cart.items.values.toList()[i].id,
                    cart.items.values.toList()[i].quantity,
                    cart.items.values.toList()[i].imageUrl,
                  )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              height: MediaQuery.of(context).size.height * 0.1,
              child: Row(children: [
                const Text(
                  "Total amount",
                ),
                const Spacer(),
                Text('Ksh ${cart.totalAmount}'),
                TextButton(
                    onPressed: () {
                      // Provider.of<Orders>(context, listen:false).addOrder( cart.items.values.toList(), cart.totalAmount);
                      // cart.clear();
                    },
                    child: const Text(
                      'ORDER NOW',
                      style: TextStyle(color: Colors.amberAccent),
                    ))
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:daybrec/providers/product_provider.dart';
import 'package:daybrec/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({Key? key}) : super(key: key);
  static const routeName = './catalog';

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as dynamic;
    final x = routeArgs['prodId'];
    final prod =
        Provider.of<ProductList>(context).items.firstWhere((e) => e.id == x);
    final cart = Provider.of<Cart>(context);
    return Scaffold(
        appBar: const CustomAppBar(),
        body: Container(
          alignment: AlignmentDirectional.topCenter,
          height: MediaQuery.of(context).size.height * 0.6,
          padding: const EdgeInsets.all(10),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(
                    prod.imageUrl,
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                  )),
              Positioned(
                bottom: -80,
                right: 20,
                left: 20,
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[200],
                  ),
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            onPressed: () {
                              print('ggg');
                              cart.addItem(prod.id, prod.price, prod.imageUrl,
                                  prod.productName);
                            },
                            icon: const FaIcon(FontAwesomeIcons.cartShopping),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                'ORDER NOW',
                                style: TextStyle(color: Colors.pink),
                              ))
                        ],
                      ),
                      Text(
                        prod.productName,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            decoration: TextDecoration.none,
                            color: Colors.black),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Ksh ${prod.price}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            decoration: TextDecoration.none,
                            color: Colors.black),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

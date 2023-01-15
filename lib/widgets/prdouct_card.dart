import 'package:daybrec/screens/catalog_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product_provider.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prod = Provider.of<Product>(context);
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(CatalogScreen.routeName, arguments: {
          'prodId': prod.id
        });
      },
      child: Card(
        borderOnForeground: true,
        child: Container(
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 20),
          width: MediaQuery.of(context).size.width * 0.32,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Image.asset(
              prod.imageUrl,
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            Text(
              prod.productName,
              style: const TextStyle(
                fontSize: 17,
              ),
            ),
            Text(
              'Ksh ${prod.price.toString()}',
              style: const TextStyle(fontSize: 18, color: Colors.orange),
            )
          ]),
        ),
      ),
    );
  }
}

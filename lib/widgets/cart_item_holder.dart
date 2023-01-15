import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';

class CartItemHolder extends StatefulWidget {
  CartItemHolder(this.itemName, this.amount, this.id, this.productId,
      this.quantity, this.imageUrl,
      {super.key});

  final String itemName;
  double amount;
  final String id;
  final String productId;
  int quantity;
  final String imageUrl;

  @override
  State<CartItemHolder> createState() => _CartItemHolderState();
}

class _CartItemHolderState extends State<CartItemHolder> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 5),
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
      height: MediaQuery.of(context).size.height * 0.18,
      child: Column(
        children: [
          Expanded(
            child: Row(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Image.asset(
                    width: MediaQuery.of(context).size.width * 0.25,
                    widget.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Item: ${widget.itemName}'),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  cart.removeSingleItem(widget.id);
                                });
                              },
                              icon: const Icon(
                                Icons.remove,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text('${widget.quantity}'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  cart.addItem(widget.id, widget.amount,
                                      widget.imageUrl, widget.itemName);
                                });
                              },
                              icon: const Icon(Icons.add)),
                        )
                      ],
                    ),
                    Text('Price: ${widget.quantity * widget.amount}')
                  ],
                ),
              ),
              IconButton(
                  onPressed: () {
                    cart.removeItem(widget.id);
                  },
                  icon: const Icon(Icons.delete))
            ]),
          ),
          const Divider(
            thickness: 1,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}

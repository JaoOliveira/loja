import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/cart_item.dart';
import 'package:shop/models/order_list.dart';

import '../models/cart.dart';

class cartPage extends StatelessWidget {
  const cartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart Cart = Provider.of(context);
    final items = Cart.items.values.toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Carrinho"),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(width: 10),
                  Chip(
                    backgroundColor: Theme.of(context).primaryColor,
                    label: Text(
                      "R\$${Cart.totalAmount.toStringAsFixed(2)}",
                      style: TextStyle(color: Theme.of(context).canvasColor),
                    ),
                  ),
                  Spacer(),
                  TextButton(
                      onPressed: () {
                        Provider.of<OrderList>(
                          context,
                          listen: false,
                        ).addOrder(Cart);
                        Cart.clear();
                      },
                      child: Text(
                        'COMPRAR',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ))
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (ctx, i) => CartItemWidget(items[i]),
            ),
          )
        ],
      ),
    );
  }
}

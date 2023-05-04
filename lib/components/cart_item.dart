import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/cart_item.dart';

class CartItemWidget extends StatelessWidget {
  final cartItem CartItem;

  const CartItemWidget(this.CartItem, {super.key});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(CartItem.id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Theme.of(context).colorScheme.error,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
      ),
      onDismissed: (_) {
        Provider.of<cart>(
          context,
          listen: false,
        ).removeItem(CartItem.productId);
      },
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: FittedBox(
                  child: Text("${CartItem.price}"),
                ),
              ),
            ),
            title: Text(CartItem.name),
            subtitle: Text('R\$ ${CartItem.price * CartItem.quantity}'),
            trailing: Text("${CartItem.quantity}x"),
          ),
        ),
      ),
    );
  }
}

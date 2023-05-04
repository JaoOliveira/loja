import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/order.dart';

class OrderList with ChangeNotifier {
  List<Order> _items = [];

  List<Order> get items {
    return [..._items];
  }

  int get itemsCount {
    return items.length;
  }

  void addOrder(cart Cart) {
    _items.insert(
      0,
      Order(
        Id: Random().nextDouble().toString(),
        total: Cart.totalAmount,
        products: Cart.items.values.toList(),
        date: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}

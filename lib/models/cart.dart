import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';

import 'cart_item.dart';

class cart with ChangeNotifier {
  Map<String, cartItem> _items = {};

  Map<String, cartItem> get items {
    return {..._items};
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }

  int itemsCount() {
    return _items.length;
  }

  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItems(Product product) {
    if (_items.containsKey(product.id)) {
      _items.update(
        product.id,
        (existing) => cartItem(
            id: existing.id,
            price: existing.price,
            productId: existing.productId,
            name: existing.name,
            quantity: existing.quantity + 1),
      );
    } else {
      _items.putIfAbsent(
        product.id,
        () => cartItem(
            id: Random().nextDouble().toString(),
            price: product.price,
            productId: product.id,
            name: product.name,
            quantity: 1),
      );
    }
    notifyListeners();
  }
}

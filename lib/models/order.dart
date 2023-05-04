import 'package:shop/models/cart_item.dart';

class Order {
  final String Id;
  final double total;
  final List<cartItem> products;
  final DateTime date;

  Order({
    required this.Id,
    required this.total,
    required this.products,
    required this.date,
  });
}

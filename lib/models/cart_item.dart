class cartItem {
  final String id;
  final String productId;
  final String name;
  final int quantity;
  final double price;

  cartItem({
    required this.id,
    required this.price,
    required this.productId,
    required this.name,
    required this.quantity,
  });
}

class CartEntities {
  final String uuid;
  final String name;
  final String imageUrl;
  final String description;
  final int quantity;
  final num price;

  CartEntities({
    required this.uuid,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.quantity,
    required this.price,
  });
}

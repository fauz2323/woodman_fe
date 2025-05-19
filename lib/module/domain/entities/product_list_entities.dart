class ProductListEntities {
  final String uuid;
  final String name;
  final String description;
  final int price;
  final int stock;
  final String dimension;
  final int weight;
  final int height;
  final String material;
  final String image;
  final DateTime createdAt;

  ProductListEntities(
      {required this.uuid,
      required this.name,
      required this.description,
      required this.price,
      required this.stock,
      required this.dimension,
      required this.weight,
      required this.height,
      required this.material,
      required this.image,
      required this.createdAt});
}

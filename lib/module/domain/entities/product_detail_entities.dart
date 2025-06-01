class ProductDetailEntities {
  final String uuid;
  final String name;
  final String description;
  final num price;
  final int stock;
  final String dimension;
  final int weight;
  final int height;
  final String material;
  final DateTime createdAt;
  final List<ProductDetailImageEntities> images;

  ProductDetailEntities({
    required this.uuid,
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
    required this.dimension,
    required this.weight,
    required this.height,
    required this.material,
    required this.createdAt,
    required this.images,
  });
}

class ProductDetailImageEntities {
  final String image;

  ProductDetailImageEntities({
    required this.image,
  });
}

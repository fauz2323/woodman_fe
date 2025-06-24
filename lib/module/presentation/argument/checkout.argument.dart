class CheckOutArgument {
  String productName;
  num productPrice;
  List<ListProductArgument>? listProduct;

  CheckOutArgument({
    required this.productName,
    required this.productPrice,
    this.listProduct,
  });
}

class ListProductArgument {
  String name;
  int quantity;

  ListProductArgument({
    required this.name,
    required this.quantity,
  });
}

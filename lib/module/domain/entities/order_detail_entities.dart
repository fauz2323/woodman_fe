class OrderDetailEntities {
  String orderNumber;
  String status;
  int totalPrice;
  String paymentProof;
  List<OrderItemEntities> items;
  String createdAt;

  OrderDetailEntities({
    required this.orderNumber,
    required this.status,
    required this.totalPrice,
    required this.paymentProof,
    required this.items,
    required this.createdAt,
  });
}

class OrderItemEntities {
  String productName;
  int quantity;
  int price;

  OrderItemEntities({
    required this.productName,
    required this.quantity,
    required this.price,
  });
}

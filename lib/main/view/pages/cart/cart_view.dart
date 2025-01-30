import 'package:flutter/material.dart';

import '../../../../model/product_model.dart';

class CartView extends StatelessWidget {
  CartView({super.key});

  final List<ProductModel> products = [
    ProductModel(
      name: 'Single SpringBed',
      dimension: '50x50x50',
      price: 299999.00,
      imageUrl: 'asset/images/sofa.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:woodman_project_fe/di/injection.dart';
import 'package:woodman_project_fe/module/domain/entities/cart_entities.dart';
import 'package:woodman_project_fe/module/presentation/view/cart/cubit/cart_cubit.dart';
import 'package:woodman_project_fe/module/presentation/widged/my_loading_widget.dart';

import '../../../../core/helper/request_helper.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CartCubit>()..loadCart(),
      child: Builder(
        builder: (context) => _build(context),
      ),
    );
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Shopping Cart',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const Center(child: Text('No products in cart')),
            initial: () => const Center(child: CircularProgressIndicator()),
            loaded: (products, subTotal) =>
                _loaded(context, products, subTotal),
            loading: () => const MyLoadingWidget(),
            error: (message) => Center(
              child: Text(
                message,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.red,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _loaded(
      BuildContext context, List<CartEntities> products, num totalPrice) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return _cartCard(
                context,
                product,
              );
            },
          ),
        ),
        // Total Price and Checkout Button
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Subtotal',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Rp ${totalPrice.toStringAsFixed(2)}',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xffFFB200),
                    ),
                  ),
                ],
              ),
              // const SizedBox(height: 16),
              SizedBox(
                width: 170,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle checkout
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: const Color(0xffFFB200),
                  ),
                  child: Text(
                    'Checkout',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _cartCard(BuildContext context, CartEntities product) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Konten utama (gambar dan detail produk)
          Row(
            children: [
              // Product image
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: CachedNetworkImage(
                  imageUrl:
                      "${RequestHelper.getBaseUrl}/storage/${product.imageUrl}",
                  width: 150,
                  height: 160,
                  fit: BoxFit.cover,
                ),
              ),
              // Right side - Product details
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Description:',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        product.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: Text(
                              'Rp ${product.price.toStringAsFixed(2)}',
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: const Color(0xffFFB200),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),

                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     // IconButton(
                          //     //   icon: const Icon(Icons.remove, size: 20),
                          //     //   onPressed: () {},
                          //     // ),
                          //     Text(
                          //       product.quantity.toString(),
                          //       style: GoogleFonts.poppins(
                          //         fontSize: 16,
                          //       ),
                          //     ),
                          //     // IconButton(
                          //     //   icon: const Icon(Icons.add, size: 20),
                          //     //   onPressed: () {},
                          //     // ),
                          //   ],
                          // ),
                        ],
                      ),
                      Text(
                        "Qty : ${product.quantity}",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
                size: 24,
              ),
              onPressed: () async {
                final cartCubit = context.read<CartCubit>();
                await cartCubit.deleteCart(product.uuid);
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:woodman_project_fe/main/view/widged/my_product_card_horizontal_widget.dart';
import 'package:woodman_project_fe/model/product_model.dart';

class ProductView extends StatelessWidget {
  ProductView({super.key});

  final List<ProductModel> products = [
    ProductModel(
      name: 'Single SpringBed',
      dimension: '50x50x50',
      price: 299999.00,
      imageUrl: 'asset/images/sofa.png',
    ),
    ProductModel(
      name: 'Double SpringBed',
      dimension: '100x100x50',
      price: 399999.00,
      imageUrl: 'asset/images/sofabed.png',
    ),
    ProductModel(
      name: 'Single SpringBed',
      dimension: '50x50x50',
      price: 299999.00,
      imageUrl: 'asset/images/sofa.png',
    ),
    ProductModel(
      name: 'Double SpringBed',
      dimension: '100x100x50',
      price: 399999.00,
      imageUrl: 'asset/images/sofabed.png',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16, bottom: 0, right: 16, top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Products',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    size: 32,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return MyProductCardHorizontalWidget(
                    product: products[index],
                    onTap: () {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: _buildFloatingActionButton(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildFloatingActionButton() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffFFB200),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildButton(
            icon: Icons.swap_vert,
            label: 'Short',
            onTap: () {},
            showBorder: true,
          ),
          _buildButton(
            icon: Icons.filter_list,
            label: 'Filter',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    bool showBorder = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          border: showBorder
              ? const Border(right: BorderSide(color: Colors.white, width: 1))
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white, size: 20),
            const SizedBox(width: 8),
            Text(
              label,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

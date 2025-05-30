import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:woodman_project_fe/di/injection.dart';
import 'package:woodman_project_fe/module/domain/entities/product_list_entities.dart';
import 'package:woodman_project_fe/module/presentation/view/product/cubit/product_cubit.dart';
import 'package:woodman_project_fe/module/presentation/widged/my_loading_widget.dart';
import 'package:woodman_project_fe/module/presentation/widged/my_product_card_horizontal_widget.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProductCubit>()..loadProducts(),
      child: Builder(builder: (context) => _build(context)),
    );
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const Center(
              child: Text("Unknown Error has been detected!!!"),
            ),
            loading: () => const MyLoadingWidget(),
            loaded: (product) => _loaded(context, product),
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

  Widget _loaded(BuildContext context, List<ProductListEntities> products) {
    return Padding(
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
    );
  }
}

class _Build extends StatelessWidget {
  final List products;
  const _Build({required this.products});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
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

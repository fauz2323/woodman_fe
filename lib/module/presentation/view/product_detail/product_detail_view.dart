import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:woodman_project_fe/di/injection.dart';
import 'package:woodman_project_fe/module/domain/entities/product_detail_entities.dart';
import 'package:woodman_project_fe/module/presentation/argument/product_detail.argument.dart';
import 'package:woodman_project_fe/module/presentation/view/product_detail/cubit/product_detail_cubit.dart';
import 'package:woodman_project_fe/module/presentation/widged/my_button_widget.dart';
import 'package:woodman_project_fe/module/presentation/widged/my_loading_widget.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ProductDetailArgument;

    return BlocProvider(
      create: (context) => getIt<ProductDetailCubit>()..loadProduct(args.uuid),
      child: Builder(
        builder: (context) => _build(context),
      ),
    );
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product Detail',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocBuilder<ProductDetailCubit, ProductDetailState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => Container(),
            loading: () => const MyLoadingWidget(),
            loaded: (product, status) => _loaded(context, product, status),
            error: (message) => Center(
              child: Text(
                message,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.red,
                ),
              ),
            ),
            unautorize: () => Center(
              child: Text(
                'Unauthorized access',
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
    BuildContext context,
    ProductDetailEntities product,
    bool status,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Carousel Slider untuk gambar product
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 250,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  viewportFraction: 0.8,
                ),
                items: product.images.map((imageUrl) {
                  return Builder(
                    builder: (BuildContext context) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: CachedNetworkImage(
                          imageUrl:
                              "https://woodman.projectme.tech/storage/${imageUrl.image}",
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              // Informasi Product
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: GoogleFonts.poppins(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      'Rp.${product.price.toStringAsFixed(2)}',
                      style: GoogleFonts.poppins(
                        fontSize: 14.0,
                        color: const Color(0xff6B6B6B),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Key Features',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          TextDetailCHild(
                            text: product.description,
                          ),
                          const SizedBox(height: 16.0),
                          const Text(
                            'Product Details',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          TextDetailCHild(
                            text: "Dimesion: ${product.dimension}",
                          ),
                          TextDetailCHild(
                            text: "Height: ${product.height} cm",
                          ),
                          TextDetailCHild(
                            text: "Weight: ${product.weight} gr",
                          ),
                          const SizedBox(height: 16.0),
                          const Text(
                            'Material',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          TextDetailCHild(
                            text: product.material.isNotEmpty
                                ? product.material
                                : 'No material information available',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: MyButtonWidget(
            onTap: () async {
              final cubit = context.read<ProductDetailCubit>();
              final message = await cubit.addCart(product.uuid);
              ScaffoldMessenger.of(context)
                ..removeCurrentSnackBar()
                ..showSnackBar(SnackBar(content: Text(message)));
            },
            text: 'Add to bag',
            radius: 8,
          ),
        ),
      ],
    );
  }
}

class TextDetailCHild extends StatelessWidget {
  const TextDetailCHild({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14.0,
        color: Colors.grey[600],
      ),
      textAlign: TextAlign.justify,
    );
  }
}

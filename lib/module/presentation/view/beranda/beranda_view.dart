import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:woodman_project_fe/core/helper/request_helper.dart';
import 'package:woodman_project_fe/di/injection.dart';
import 'package:woodman_project_fe/module/domain/entities/product_list_entities.dart';
import 'package:woodman_project_fe/module/presentation/argument/product_detail.argument.dart';
import 'package:woodman_project_fe/module/presentation/view/beranda/cubit/beranda_cubit.dart';
import 'package:woodman_project_fe/module/presentation/widged/my_loading_widget.dart';

import '../../widged/my_product_card_widget.dart';

class BerandaView extends StatelessWidget {
  BerandaView({super.key});

  final List<String> imgList = List.filled(4, 'asset/images/product1.png');

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BerandaCubit>(
      create: (context) => getIt<BerandaCubit>()..initial(),
      child: Builder(
        builder: (context) => _build(context),
      ),
    );
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<BerandaCubit, BerandaState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => Container(),
            initial: () => Container(),
            loading: () => const Center(child: MyLoadingWidget()),
            loaded: (product) => SingleChildScrollView(
              child: Column(
                children: [
                  _buildCarouselSlider(),
                  const SizedBox(height: 10),
                  _buildProductSection(context, product),
                ],
              ),
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }

  Widget _buildCarouselSlider() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 250,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        viewportFraction: 1,
      ),
      items: imgList
          .map(
            (item) => Image.asset(
              item,
              fit: BoxFit.fill,
              width: double.infinity,
            ),
          )
          .toList(),
    );
  }

  Widget _buildProductSection(
      BuildContext context, List<ProductListEntities> product) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        children: [
          _buildSectionHeader('Product'),
          _buildProductList(product),
          const SizedBox(height: 10),
          _buildSectionHeader('New Product'),
          _buildProductListNew(product),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildProductList(List<ProductListEntities> product) {
    return SizedBox(
      height: 270,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: product.length > 5 ? 5 : product.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) => MyProductCardWidget(
          onTap: () {
            // Handle product tap
            Navigator.pushNamed(context, '/detail_product',
                arguments: ProductDetailArgument(
                    uuid: product[index].uuid,
                    productName: product[index].name));
          },
          imageUrl:
              "${RequestHelper.getBaseUrl}/storage/${product[index].image}",
          title: product[index].name,
          price: 'Rp. ${NumberFormat('#,##0').format(product[index].price)}',
        ),
      ),
    );
  }

  Widget _buildProductListNew(List<ProductListEntities> product) {
    return SizedBox(
      height: 270,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: product.length > 3 ? 3 : product.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) => MyProductCardWidget(
          onTap: () {
            // Handle product tap
          },
          imageUrl:
              "${RequestHelper.getBaseUrl}/storage/${product[index].image}",
          title: product[index].name,
          price: 'Rp. ${NumberFormat('#,##0').format(product[index].price)}',
        ),
      ),
    );
  }
}

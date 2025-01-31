import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widged/my_product_card_widget.dart';

class BerandaView extends StatelessWidget {
  BerandaView({super.key});

  final List<String> imgList = List.filled(4, 'asset/images/product1.png');

  @override
  Widget build(BuildContext context) {
    return _build(context);
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildCarouselSlider(),
            _buildProductSection(context),
          ],
        ),
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
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          )
          .toList(),
    );
  }

  Widget _buildProductSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        children: [
          _buildSectionHeader('Product'),
          _buildProductList(),
          const SizedBox(height: 10),
          _buildSectionHeader('New Product'),
          _buildProductList(),
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
        TextButton(
          onPressed: () {},
          child: Text(
            'Show all',
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: const Color(0xffFFB200),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProductList() {
    return SizedBox(
      height: 270,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) => const MyProductCardWidget(
          imageUrl: 'asset/images/sofabed.png',
          title: 'Moderen bedsofa',
          price: 'Rp.2.999.000',
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:woodman_project_fe/module/presentation/widged/my_button_widget.dart';

import '../checkout_order/cubit/checkout_order_cubit.dart';

class ReviewOrderView extends StatelessWidget {
  const ReviewOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckoutOrderCubit(),
      child: Builder(
        builder: (context) => _build(context),
      ),
    );
  }

  Widget _build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController addressController = TextEditingController();
    final TextEditingController countryController = TextEditingController();
    final TextEditingController posNumberController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          'Checkout',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: BlocConsumer<CheckoutOrderCubit, CheckoutOrderState>(
        listener: (context, state) {
          // Handle state changes if needed
        },
        builder: (context, state) {
          return state.maybeWhen(
            initial: () => _loaded(
              context,
              nameController,
              phoneController,
              addressController,
              countryController,
              posNumberController,
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            error: (message) => Center(
              child: Text(message),
            ),
            orElse: () => const SizedBox(),
          );
        },
      ),
    );
  }

  Widget _loaded(
    BuildContext context,
    TextEditingController nameController,
    TextEditingController phoneController,
    TextEditingController addressController,
    TextEditingController countryController,
    TextEditingController posNumberController,
  ) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildOrderSummaryHeader('Review Order'),
                      const SizedBox(height: 16),
                      _buildProductRow('Product', 'Modern Chair'),
                      const SizedBox(height: 8),
                      _buildDetailRow('Count', 'x2'),
                      _buildDetailRow('Color', 'White'),
                      _buildDetailRow('Price', 'Rp 1,499,999.00'),
                      const SizedBox(height: 16),
                      _buildTotalRow('Sub Total', 'Rp 2,999,999.00',
                          isBold: true),
                      const SizedBox(height: 16),
                      _buildOrderSummaryHeader('Shipping Address'),
                      const SizedBox(height: 16),
                      _buildDetailRow('Name', 'John Doe'),
                      _buildDetailRow('Phone', '08123456789'),
                      // label: Address
                      Text('Address:',
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      // Value: Address
                      const SizedBox(height: 4),
                      Text(
                        'Jl. Raya Bogor No. 123, RT 01/02, Bogor, Jawa Barat',
                        style: GoogleFonts.poppins(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: MyButtonWidget(
            onTap: () {
              // Handle next button tap
            },
            text: 'Next',
            radius: 8,
          ),
        ),
      ],
    );
  }

  Widget _buildOrderSummaryHeader(String title) {
    return Text(
      title,
      style: GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: const Color(0xffFFB200),
      ),
    );
  }

  Widget _buildProductRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(fontSize: 16),
        ),
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: const Color(0xffFFB200),
          ),
        ),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(fontSize: 16),
          ),
          Text(
            value,
            style: GoogleFonts.poppins(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildTotalRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

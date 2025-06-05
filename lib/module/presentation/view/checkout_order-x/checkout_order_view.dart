import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:woodman_project_fe/module/presentation/widged/my_button_widget.dart';
import 'package:woodman_project_fe/module/presentation/widged/my_divider_widget.dart';
import 'package:woodman_project_fe/module/presentation/widged/my_text_field_widget.dart';
import 'package:woodman_project_fe/module/presentation/view/checkout_order-x/cubit/checkout_order_cubit.dart';

class CheckoutOrderView extends StatelessWidget {
  const CheckoutOrderView({super.key});

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
  ) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildOrderSummaryHeader('Order Summarys'),
            const SizedBox(height: 16),
            _buildProductRow('Product', 'Modern Chair'),
            const SizedBox(height: 8),
            _buildDetailRow('Count', 'x2'),
            _buildDetailRow('Color', 'White'),
            _buildDetailRow('Price', 'Rp 1,499,999.00'),
            const SizedBox(height: 16),
            _buildTotalRow('Sub Total', 'Rp 2,999,999.00'),
            const MyDividerWidget(),
            _buildTotalRow('Delivery Fee', 'Rp 0.00'),
            const MyDividerWidget(),
            const SizedBox(height: 16),
            _buildTotalRow('Order Total', 'Rp 2,999,999.00', isBold: true),
            const MyDividerWidget(),
            const SizedBox(height: 16),
            _buildOrderSummaryHeader('Shipping Address'),
            const SizedBox(height: 8),
            Text(
              'Your Delivery Address',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16),
            const SizedBox(height: 32),
            MyButtonWidget(
              onTap: () {
                // Handle next button tap
              },
              text: 'Next',
              radius: 8,
            ),
          ],
        ),
      ),
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

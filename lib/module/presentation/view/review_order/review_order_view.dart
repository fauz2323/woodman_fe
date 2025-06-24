import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:woodman_project_fe/di/injection.dart';
import 'package:woodman_project_fe/module/domain/entities/address_entities.dart';
import 'package:woodman_project_fe/module/presentation/argument/checkout.argument.dart';
import 'package:woodman_project_fe/module/presentation/view/review_order/cubit/review_order_cubit.dart';
import 'package:woodman_project_fe/module/presentation/widged/my_button_widget.dart';
import 'package:woodman_project_fe/module/presentation/widged/my_loading_widget.dart';

class ReviewOrderView extends StatelessWidget {
  const ReviewOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as CheckOutArgument;

    return BlocProvider(
      create: (context) => getIt<ReviewOrderCubit>()..getAddress(args),
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
      body: BlocConsumer<ReviewOrderCubit, ReviewOrderState>(
        listener: (context, state) {
          state.maybeWhen(
              orElse: () {},
              success: () {
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                        'Order placed successfully!, please upload your payment proof in detail order page'),
                    duration: Duration(seconds: 2),
                    backgroundColor: Colors.green,
                  ),
                );
              });
        },
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const MyLoadingWidget(),
            error: (message) => Center(
              child: Text(message),
            ),
            loaded: (address, data) => _loaded(
              context,
              data,
              address,
            ),
            orElse: () => const SizedBox(),
          );
        },
      ),
    );
  }

  Widget _loaded(
    BuildContext context,
    CheckOutArgument data,
    AddressEntities address,
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
                      const SizedBox(height: 8),
                      _buildDetailRow('Price', 'Rp ${data.productPrice}'),
                      const SizedBox(height: 16),
                      _buildTotalRow('Sub Total', 'Rp ${data.productPrice}',
                          isBold: true),
                      const SizedBox(height: 16),
                      _buildOrderSummaryHeader('Shipping Address'),
                      const SizedBox(height: 16),
                      _buildDetailRow('Name', address.name ?? 'N/A'),
                      _buildDetailRow('Phone', address.phone ?? 'N/A'),
                      // label: Address
                      Text('Address:',
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      // Value: Address
                      const SizedBox(height: 4),
                      Text(
                        address.address ?? 'N/A',
                        style: GoogleFonts.poppins(fontSize: 16),
                      ),
                      const SizedBox(height: 16),
                      _buildOrderSummaryHeader('List Order'),
                      const SizedBox(height: 8),
                      Column(
                        children: data.listProduct!
                            .map((product) => Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("- ${product.name}",
                                        style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500)),
                                    Text("${product.quantity} pcs",
                                        style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ))
                            .toList(),
                      )
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
              context.read<ReviewOrderCubit>().makeOrder();
            },
            text: 'Make Order',
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

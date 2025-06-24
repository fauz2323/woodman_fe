import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:woodman_project_fe/core/helper/size_helper.dart';
import 'package:woodman_project_fe/di/injection.dart';
import 'package:woodman_project_fe/core/theme/colors_theme.dart';
import 'package:woodman_project_fe/module/domain/entities/order_detail_entities.dart';
import 'package:woodman_project_fe/module/presentation/argument/order_detail_argument.dart';
import 'package:woodman_project_fe/module/presentation/view/transaction_detail/cubit/transaction_detail_cubit.dart';
import 'package:woodman_project_fe/module/presentation/widged/my_button_widget.dart';
import 'package:woodman_project_fe/module/presentation/widged/my_loading_widget.dart';

class TransactionDetailView extends StatelessWidget {
  const TransactionDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final argument =
        ModalRoute.of(context)?.settings.arguments as OrderDetailArgument;
    return BlocProvider(
      create: (context) =>
          getIt<TransactionDetailCubit>()..initialLoading(argument.orderId),
      child: Builder(
        builder: (context) => _build(context),
      ),
    );
  }

  Widget _build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: BlocConsumer<TransactionDetailCubit, TransactionDetailState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => Container(),
              loading: () => const MyLoadingWidget(),
              loaded: (data, image) => _loaded(context, data, image),
              error: (message) => Center(
                child: Text(
                  message,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                  ),
                ),
              ),
            );
          },
        ));
  }

  Widget _loaded(BuildContext context, OrderDetailEntities data, File? image) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Order is ${data.status.toUpperCase()}",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: ColorsTheme.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    data.status == 'pending'
                        ? 'Please upload proof of payment'
                        : 'Please wait for the order to be processed',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: ColorsTheme.blackColor.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Image.asset(
                    'asset/images/logo.png',
                    width: SizeHelper.getScreenWidth(context) * 0.6,
                    height: SizeHelper.getScreenWidth(context) * 0.6,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Order ID:',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: ColorsTheme.blackColor,
                    ),
                  ),
                  Text(
                    data.orderNumber,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                      color: ColorsTheme.blackColor.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Order Date:',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: ColorsTheme.blackColor,
                    ),
                  ),
                  Text(
                    data.createdAt,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                      color: ColorsTheme.blackColor.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Total Price:',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: ColorsTheme.blackColor,
                    ),
                  ),
                  Text(
                    "Rp. ${data.totalPrice}",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                      color: ColorsTheme.blackColor.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'List Product:',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: ColorsTheme.blackColor,
                    ),
                  ),
                  ...data.items.map(
                    (e) => Text(
                      "${e.productName} (${e.quantity} Pcs)",
                      style: GoogleFonts.poppins(
                        fontSize: 17,
                        color: ColorsTheme.blackColor.withOpacity(0.7),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  data.status == 'pending'
                      ? Text(
                          'Please upload proof of payment',
                          style: GoogleFonts.poppins(
                            fontSize: 17,
                            color: ColorsTheme.blackColor.withOpacity(0.7),
                          ),
                        )
                      : Container(),
                  data.status == 'pending'
                      ? GestureDetector(
                          onTap: () {
                            context.read<TransactionDetailCubit>().pickImage();
                          },
                          child: Container(
                            width: SizeHelper.getScreenWidth(context) * 0.6,
                            height: SizeHelper.getScreenWidth(context) * 0.6,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: image == null
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.image,
                                        size: 100,
                                      ),
                                      Text(
                                        '(Click to Upload Image)',
                                        style: GoogleFonts.poppins(
                                          fontSize: 17,
                                          color: ColorsTheme.blackColor
                                              .withOpacity(0.7),
                                        ),
                                      ),
                                    ],
                                  )
                                : Image.file(
                                    image,
                                    width: SizeHelper.getScreenWidth(context) *
                                        0.6,
                                    height: SizeHelper.getScreenWidth(context) *
                                        0.6,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
          _buttonBottom(context, data.status == 'pending')
        ],
      ),
    );
  }

  Widget _buttonBottom(BuildContext context, bool status) {
    return status
        ? Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: MyButtonWidget(
                  onTap: () {
                    context.read<TransactionDetailCubit>().uploadImage();
                  },
                  text: 'Upload Proof',
                  radius: 8,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: MyButtonWidget(
                  color: Colors.red,
                  onTap: () {},
                  text: 'Cancel Order',
                  radius: 8,
                ),
              ),
            ],
          )
        : Container();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:woodman_project_fe/di/injection.dart';
import 'package:woodman_project_fe/module/presentation/widged/my_loading_widget.dart';
import 'package:woodman_project_fe/module/presentation/widged/my_order_card_history.dart';

import '../../../domain/entities/list_order_entities.dart';
import 'cubit/order_history_cubit.dart';

class OrderHistoryView extends StatelessWidget {
  const OrderHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<OrderHistoryCubit>()
        ..fetchOrderHistory(), // Replace with actual token
      child: Builder(builder: (context) => _build(context)),
    );
  }

  Widget _build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text(
            'Order History',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: BlocConsumer<OrderHistoryCubit, OrderHistoryState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => Container(),
              loading: () => const MyLoadingWidget(),
              loaded: (orders) => _loaded(context, orders),
              error: (message) => Center(
                child: Text(
                  message,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            );
          },
        ));
  }

  Widget _loaded(BuildContext context, List<ListOrderEntities> orders) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'My Order',
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: ListView(
              children: orders
                  .map(
                    (data) => MyOrderCardHistory(
                      orderNumber: data.uuid,
                      paymentMethod: 'Bank Transfer',
                      status: data.status,
                      dateTime: data.createdAt.toString(),
                      imageUrl:
                          'https://via.placeholder.com/150/F5F5F5/000000?Text=Product1',
                      onTap: () {
                        Navigator.pushNamed(context, '/transaction');
                      },
                    ),
                  )
                  .toList()),
        ),
      ],
    );
  }
}

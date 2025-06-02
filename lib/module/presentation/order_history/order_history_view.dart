import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:woodman_project_fe/module/presentation/widged/my_order_card_history.dart';

class OrderHistoryView extends StatelessWidget {
  const OrderHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          'Edit Address',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
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
              children: const <Widget>[
                MyOrderCardHistory(
                  orderNumber: 'Order#001312',
                  paymentMethod: 'Bank Transfer',
                  status: OrderStatus.delivered,
                  dateTime: '20-Dec-2024 04:00PM',
                  imageUrl:
                      'https://via.placeholder.com/150/F5F5F5/000000?Text=Product1',
                ),
                MyOrderCardHistory(
                  orderNumber: 'Order#001313',
                  paymentMethod: 'Credit Card',
                  status: OrderStatus.failed,
                  dateTime: '19-Dec-2024 11:00AM',
                  imageUrl:
                      'https://via.placeholder.com/150/E0E0E0/000000?Text=Product2',
                ),
                MyOrderCardHistory(
                  orderNumber: 'Order#001314',
                  paymentMethod: 'E-Wallet',
                  status: OrderStatus.delivered,
                  dateTime: '18-Dec-2024 02:30PM',
                  imageUrl:
                      'https://via.placeholder.com/150/D3D3D3/000000?Text=Product3',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

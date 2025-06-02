import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:woodman_project_fe/core/theme/colors_theme.dart'; // Sesuaikan path
import 'package:woodman_project_fe/module/presentation/widged/my_button_widget.dart'; // Sesuaikan path

enum TransactionStatus {
  success,
  waiting,
}

class TransactionView extends StatelessWidget {
  const TransactionView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String titleText;
    String descriptionText;
    Color iconColor;
    IconData iconData;
    Color buttonColor;

    TransactionStatus status;
    status = TransactionStatus.success;

    if (status == TransactionStatus.success) {
      titleText = 'Transaction Success';
      descriptionText =
          'Transaction successfully, we will send your goods immediately we are very grateful!';
      iconColor = const Color(0xFFFFC107);
      iconData = Icons.check_circle_rounded;
      buttonColor = ColorsTheme.primaryColor;
    } else {
      // TransactionStatus.waiting
      titleText = 'Waiting for Payment';
      descriptionText =
          'Your order is awaiting payment confirmation. Please complete your payment.';
      iconColor = Colors.orange;
      iconData = Icons.hourglass_empty_rounded;
      buttonColor = ColorsTheme.primaryColor;
    }

    String orderId = '15555252';
    String totalPayment = 'Rp. 2.900.000';
    var paymentTime = '20:05:99';
    var paymentDate = '20-05-2025';
    String paymentMethod = 'Bank Transfer';
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          titleText,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.5,
        foregroundColor: Colors.black87,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 2.0,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        titleText,
                        style: GoogleFonts.poppins(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          color: iconColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        descriptionText,
                        style: GoogleFonts.poppins(
                          fontSize: 14.0,
                          color: Colors.grey[600],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24.0),
                      // Ikon status
                      Icon(
                        iconData,
                        size: 100.0,
                        color: iconColor,
                      ),
                      const SizedBox(height: 24.0),
                      _buildInfoRow('Order ID', orderId),
                      const SizedBox(height: 16.0),
                      _buildInfoRow('Total Payment', totalPayment),
                      const SizedBox(height: 16.0),
                      // Ini baris yang menyebabkan overflow
                      _buildInfoRow(
                          'Payment Times', '$paymentDate $paymentTime'),
                      const SizedBox(height: 16.0),
                      _buildInfoRow('Payment Method', paymentMethod),
                    ],
                  ),
                ),
              ),
            ),
            if (status == TransactionStatus.waiting)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Column(
                  children: [
                    MyButtonWidget(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('Upload bukti pembayaran...',
                                  style: GoogleFonts.poppins())),
                        );
                      },
                      text: 'Upload Payment Proof',
                      radius: 8,
                      color: buttonColor,
                    ),
                    const SizedBox(height: 10.0),
                    MyButtonWidget(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('Batalkan transaksi...',
                                  style: GoogleFonts.poppins())),
                        );
                      },
                      text: 'Cancel Transaction',
                      radius: 8,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Label tetap normal
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),

        Flexible(
          child: Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 16.0,
              color: Colors.black54,
            ),
            textAlign: TextAlign.end,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}

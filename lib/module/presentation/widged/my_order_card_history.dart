import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyOrderCardHistory extends StatelessWidget {
  final String orderNumber;
  final String paymentMethod;
  final String status;
  final String dateTime;
  final String imageUrl;
  final VoidCallback? onTap;

  const MyOrderCardHistory({
    super.key,
    required this.orderNumber,
    required this.paymentMethod,
    required this.status,
    required this.dateTime,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    String statusText = '-';
    Color statusColor = Colors.black;
    Color dateColor = Colors.black;

    switch (status) {
      case 'pending':
        statusText = 'Pending';
        statusColor = Colors.green[700]!;
        dateColor = Colors.black54;
        break;
      case 'failed':
        statusText = 'Failed';
        statusColor = Colors.red[700]!;
        dateColor = Colors.red[700]!;
        break;

      case 'waiting':
        statusText = 'waiting';
        statusColor = Colors.yellow;
        dateColor = Colors.black54;
        break;
      case 'success':
        statusText = 'Success';
        statusColor = Colors.green[700]!;
        dateColor = Colors.black54;
        break;
      case 'canceled':
        statusText = 'Canceled';
        statusColor = Colors.red[700]!;
        dateColor = Colors.red[700]!;
        break;
    }

    return GestureDetector(
      onTap: () {
        onTap!();
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildInfoRow('Number', orderNumber),
                    const SizedBox(height: 8.0),
                    _buildInfoRow('Payment Method', paymentMethod),
                    const SizedBox(height: 16.0),
                    // Menggunakan Row dengan Expanded untuk mengatasi overflow pada teks status dan tanggal
                    Row(
                      children: <Widget>[
                        Text(
                          statusText,
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: statusColor,
                          ),
                        ),
                        const SizedBox(
                            width:
                                4.0), // Spasi kecil antara status dan tanggal
                        Expanded(
                          child: Text(
                            dateTime,
                            style: TextStyle(
                              fontSize: 13.0,
                              color: dateColor,
                              fontWeight: status == 'failed'
                                  ? FontWeight.w500
                                  : FontWeight.normal,
                            ),
                            overflow: TextOverflow
                                .ellipsis, // Menggunakan ellipsis jika teks terlalu panjang
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16.0),
              SizedBox(
                width: 70.0,
                height: 70.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[200],
                        child:
                            Icon(Icons.broken_image, color: Colors.grey[400]),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 13.0,
            color: Colors.black54,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 2.0),
        Text(
          value,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: GoogleFonts.poppins(
            fontSize: 15.0,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}

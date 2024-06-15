import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TransactionDetailsPage extends StatelessWidget {
  final QueryDocumentSnapshot<Map<String, dynamic>> data;

  const TransactionDetailsPage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Order ID: ${data.id}'),
            Text('Total Payment: \$${data['payment']}'),
            Text('Date: \$${data['date']}'),
            Text('Address: \$${data['address']}'),
            
            Text('Quantity: \$${data['quantity']}'),
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}

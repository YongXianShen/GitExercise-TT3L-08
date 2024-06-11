import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RiderFullDetails extends StatelessWidget {
  final String riderId;

  RiderFullDetails({required this.riderId});

  Future<Map<String, dynamic>> _getRiderDetails() async {
    var doc = await FirebaseFirestore.instance.collection('riders').doc(riderId).get();
    return doc.data() as Map<String, dynamic>;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rider Details'),
        backgroundColor: Colors.blueAccent,
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _getRiderDetails(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final rider = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                _buildDetailItem('Name', rider['name']),
                _buildDetailItem('Age', rider['age']),
                _buildDetailItem('Gender', rider['gender']),
                _buildDetailItem('Booking Time', rider['bookingtime']),
                _buildDetailItem('Pickup Point', rider['pickup']),
                _buildDetailItem('Note', rider['note']),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.blueAccent.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: ListTile(
          title: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(value),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: RiderFullDetails(riderId: 'exampleRiderId'), // replace with actual riderId
  ));
}

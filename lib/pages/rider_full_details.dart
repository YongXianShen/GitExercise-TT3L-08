import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

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
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _getRiderDetails(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final rider = snapshot.data!;
          final phone = rider['phone'];

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    "Rider's Details",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
                _buildDetailItem('Name', rider['name']),
                _buildDetailItem('Age', rider['age']),
                _buildDetailItem('Gender', rider['gender']),
                _buildDetailItem('Booking Time', rider['bookingtime']),
                _buildDetailItem('Phone Number', rider['phone']),
                _buildDetailItem('Pickup Point', rider['pickup']),
                _buildDetailItem('Note', rider['note']),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  icon: Image.asset(
                    'assets/images/icon_whatsapp.png',
                    height: 24.0,
                    width: 24.0,
                  ),
                  label: Text("Contact via WhatsApp"),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.green, backgroundColor: Colors.white,
                  ),
                  onPressed: () async {
                    final whatsappUrl = Uri.parse("https://wa.me/+6$phone");
                    if (await canLaunchUrl(whatsappUrl)) {
                      await launchUrl(whatsappUrl);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Could not launch WhatsApp")),
                      );
                    }
                  },
                ),
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
    home: RiderFullDetails(riderId: 'RiderId'),
  ));
}

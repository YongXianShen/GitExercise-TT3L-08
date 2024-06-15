import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

class DriverFullDetails extends StatelessWidget {
  final String driverId;

  DriverFullDetails({required this.driverId});

  Future<Map<String, dynamic>> _getDriverDetails() async {
    var doc = await FirebaseFirestore.instance.collection('drivers').doc(driverId).get();
    return doc.data() as Map<String, dynamic>;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _getDriverDetails(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final driver = snapshot.data!;
          final phone = driver['phone'];

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    "Driver's Details",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
                _buildDetailItem('Name', driver['name']),
                _buildDetailItem('Age', driver['age']),
                _buildDetailItem('Gender', driver['gender']),
                _buildDetailItem('Phone Number', phone),
                _buildDetailItem('Preferred Pickup Point', driver['pickup']),
                _buildDetailItem('Car Model', driver['carModel']),
                _buildDetailItem('Car Color', driver['carColor']),
                _buildDetailItem('Car Number Plate', driver['carNumberPlate']),
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        onPressed: () {
          // Add your onPressed code here!
        },
        child: Icon(Icons.directions_car, color: Colors.white),
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
    home: DriverFullDetails(driverId: 'DriverId'),
  ));
}

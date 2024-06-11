import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'rider_details.dart';

class DriverListPage extends StatefulWidget {
  @override
  _DriverListPageState createState() => _DriverListPageState();
}

class _DriverListPageState extends State<DriverListPage> {
  final _formKey = GlobalKey<FormState>();
  Map<String, dynamic> _details = {
    'name': '',
    'age': '',
    'gender': '',
    'bookingtime': '',
    'pickup': '',
    'note': '',
    'driverId': '',
    'requested': false,
    'userId': ''
  };

  void _handleSubmit(BuildContext context, String driverId) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User not logged in')),
      );
      return;
    }

    _details['userId'] = user.uid;
    _details['driverId'] = driverId;  // Add driverId to the rider details
    _details['requested'] = true; // Set requested to true

    var snapshot = await FirebaseFirestore.instance
        .collection('riders')
        .where('userId', isEqualTo: user.uid)
        .get();

    if (snapshot.docs.isNotEmpty) {
      var doc = snapshot.docs.first;
      await FirebaseFirestore.instance.collection('riders').doc(doc.id).update(_details);
    } else {
      await FirebaseFirestore.instance.collection('riders').add(_details);
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Request sent to driver ${driverId}')),
    );

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RiderDetails()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Drivers List',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('drivers').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                final drivers = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: drivers.length,
                  itemBuilder: (context, index) {
                    final driver = drivers[index].data() as Map<String, dynamic>;

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: Colors.white,
                        shadowColor: Colors.blueAccent,
                        elevation: 8.0, // Elevation for shadow on all sides
                        child: ListTile(
                          title: Text(driver['name'], style: TextStyle(color: Colors.black)),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Age: ${driver['age']}', style: TextStyle(color: Colors.black)),
                              Text('Gender: ${driver['gender']}', style: TextStyle(color: Colors.black)),
                              Text('Preferred Pickup Point: ${driver['pickup']}', style: TextStyle(color: Colors.black)),
                            ],
                          ),
                          trailing: TextButton(
                            onPressed: () => _handleSubmit(context, drivers[index].id),
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.blueAccent,
                            ),
                            child: Text('Request'),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: DriverListPage(),
  ));
}

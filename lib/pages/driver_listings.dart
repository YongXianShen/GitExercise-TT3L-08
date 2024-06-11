import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mmusuperapp/pages/rider_details.dart';

class DriverListPage extends StatelessWidget {
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
                              Text('Model: ${driver['model']}', style: TextStyle(color: Colors.black)),
                              Text('Color: ${driver['color']}', style: TextStyle(color: Colors.black)),
                              Text('Plate: ${driver['plate']}', style: TextStyle(color: Colors.black)),
                              Text('Pickup: ${driver['pickup']}', style: TextStyle(color: Colors.black)),
                            ],
                          ),
                          trailing: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RiderDetails(),
                                ),
                              );
                            },
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

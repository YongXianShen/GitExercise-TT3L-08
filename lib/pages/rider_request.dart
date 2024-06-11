import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RidersRequest extends StatelessWidget {
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
              'Riders Request',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('riders').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                final riders = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: riders.length,
                  itemBuilder: (context, index) {
                    final rider = riders[index].data() as Map<String, dynamic>;

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: Colors.white,
                        shadowColor: Colors.lightBlueAccent,
                        elevation: 8.0, // Add elevation for shadow on all sides
                        child: ListTile(
                          title: Text(rider['name']),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Age: ${rider['age']}'),
                              Text('Gender: ${rider['gender']}'),
                            ],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextButton(
                                onPressed: () {
                                  // Implement accept functionality here
                                  print('Accepted ${rider['name']}');
                                },
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.green,
                                ),
                                child: Text('Accept'),
                              ),
                              SizedBox(width: 8),
                              TextButton(
                                onPressed: () {
                                  // Implement reject functionality here
                                  print('Rejected ${rider['name']}');
                                },
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.red,
                                ),
                                child: Text('Reject'),
                              ),
                            ],
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
    home: RidersRequest(),
  ));
}

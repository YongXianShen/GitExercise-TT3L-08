import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'rider_full_details.dart';

class RidersRequest extends StatelessWidget {
  void _acceptRider(BuildContext context, String riderId, Map<String, dynamic> rider) async {
    await FirebaseFirestore.instance.collection('riders').doc(riderId).update({
      'requested': true,
      'accepted': true, // Add an 'accepted' field
    });

    String driverId = rider['driverId'];
    await FirebaseFirestore.instance.collection('drivers').doc(driverId).update({
      'riders': FieldValue.arrayUnion([{
        'riderId': riderId,
        'name': rider['name'],
        'age': rider['age'],
        'gender': rider['gender'],
        'pickup': rider['pickup'],
        'note': rider['note'],
      }]),
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Accepted ${rider['name']}')),
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => RiderFullDetails(riderId: riderId)),
    );
  }

  void _rejectRider(BuildContext context, String riderId) async {
    await FirebaseFirestore.instance.collection('riders').doc(riderId).delete();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Rejected rider')),
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
    stream: FirebaseFirestore.instance.collection('riders').where('requested', isEqualTo: false).snapshots(),
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
        elevation: 8.0,
        child: ListTile(
          title: Text(rider['name']),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Age: ${rider['age']}', style: TextStyle(color: Colors.black)),
              Text('Gender: ${rider['gender']}', style: TextStyle(color: Colors.black)),
              Text('Preferred Pickup Point: ${rider['pickup']}', style: TextStyle(color: Colors.black)),
              Text('Note: ${rider['note']}', style: TextStyle(color: Colors.black)),
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: () => _acceptRider(context, riders[index].id, rider),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green,
                ),
                child: Text('Accept'),
              ),
              SizedBox(width: 8),
              TextButton(
                onPressed: () => _rejectRider(context, riders[index].id),
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


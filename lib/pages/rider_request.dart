import 'package:flutter/material.dart';
import 'package:mmusuperapp/carpool/carpool.dart';

import '../models/rider_request_mock.dart';



class RiderRequestsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rider Requests'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: ListView.builder(
        itemCount: carpoolRequests.length,
        itemBuilder: (context, index) {
          final request = carpoolRequests[index];
          return Card(
            child: ListTile(
              title: Text(request.name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Age: ${request.age}'),
                  Text('Gender: ${request.gender}'),
                  Text('Destination: ${request.destination}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../models/driver_list_mock.dart';

class DriverListPage extends StatelessWidget {
  final List<CarpoolRequest> carpoolRequests;

  DriverListPage({required this.carpoolRequests});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Driver List'),
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
                  Text('Car Model: ${request.carModel}'),
                  Text('Car Color: ${request.carColor}'),
                  Text('Car Number Plate: ${request.carPlate}'),
                  Text('Pickup Point: ${request.pickupPoint}'),
                ],
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Request Sent'),
                      content: Text('Your request has been sent to ${request.name}.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                },
                child: Text('Send Request'),
              ),
            ),
          );
        },
      ),
    );
  }
}

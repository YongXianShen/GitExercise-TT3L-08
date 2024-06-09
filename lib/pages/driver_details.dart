import 'package:flutter/material.dart';
import 'package:mmusuperapp/carpool/carpool.dart';

class DriverDetailsPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _genderController = TextEditingController();
  final _carModelController = TextEditingController();
  final _carColorController = TextEditingController();
  final _carPlateController = TextEditingController();
  final _pickupPointController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insert Your Details'),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _ageController,
                decoration: InputDecoration(labelText: 'Age'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your age';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _genderController,
                decoration: InputDecoration(labelText: 'Gender'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your gender';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _carModelController,
                decoration: InputDecoration(labelText: 'Car Model'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your car model';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _carColorController,
                decoration: InputDecoration(labelText: 'Car Color'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your car color';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _carPlateController,
                decoration: InputDecoration(labelText: 'Car Number Plate'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your car number plate';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _pickupPointController,
                decoration: InputDecoration(labelText: 'Pickup Point'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your pickup point';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CarpoolDetails()),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlueAccent,
                  ),
                  child: Text('Submit',style: TextStyle(color: Colors.white),)

              ),
            ],
          ),
        ),
      ),
    );
  }
}

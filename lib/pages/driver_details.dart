import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../carpool/carpool.dart';

class DriverDetails extends StatefulWidget {
  @override
  _DriverDetailsState createState() => _DriverDetailsState();
}

class _DriverDetailsState extends State<DriverDetails> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> _details = {
    'name': '',
    'age': '',
    'gender': '',
    'phone': '',
    'pickup': '',
  };

  bool _isReadOnly = true;
  String? _documentId;

  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _phoneController = TextEditingController();
  final _pickupController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserDetails();
  }

  Future<void> _loadUserDetails() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      var snapshot = await FirebaseFirestore.instance
          .collection('drivers')
          .where('userId', isEqualTo: user.uid)
          .get();
      if (snapshot.docs.isNotEmpty) {
        var doc = snapshot.docs.first;
        setState(() {
          _documentId = doc.id;
          _details['name'] = doc['name'];
          _details['age'] = doc['age'];
          _details['gender'] = doc['gender'];
          _details['phone'] = doc['phone'];
          _details['pickup'] = doc['pickup'];
          _nameController.text = doc['name'];
          _ageController.text = doc['age'];
          _phoneController.text = doc['phone'];
          _pickupController.text = doc['pickup'];
        });
      }
    }
  }

  void _handleSubmit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        _details['userId'] = user.uid;
        if (_documentId == null) {
          await FirebaseFirestore.instance.collection('drivers').add(_details);
        } else {
          await FirebaseFirestore.instance
              .collection('drivers')
              .doc(_documentId)
              .update(_details);
        }
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CarpoolDetails()),
        );
      }
    }
  }

  void _toggleEditMode() {
    setState(() {
      _isReadOnly = !_isReadOnly;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _phoneController.dispose();
    _pickupController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(_isReadOnly ? Icons.edit : Icons.save),
            onPressed: _toggleEditMode,
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                "Driver's Detail",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.lightBlueAccent.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: TextFormField(
                  controller: _nameController,
                  readOnly: _isReadOnly,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) => _details['name'] = value!,
                  validator: (value) => value!.isEmpty ? 'Enter a name' : null,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.lightBlueAccent.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: TextFormField(
                  controller: _ageController,
                  readOnly: _isReadOnly,
                  decoration: InputDecoration(
                    labelText: 'Age',
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) => _details['age'] = value!,
                  validator: (value) => value!.isEmpty ? 'Enter an age' : null,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.lightBlueAccent.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Gender',
                    border: OutlineInputBorder(),
                  ),
                  value: _details['gender']!.isEmpty ? null : _details['gender'],
                  items: ['Male', 'Female'].map((String gender) {
                    return DropdownMenuItem<String>(
                      value: gender,
                      child: Text(gender),
                    );
                  }).toList(),
                  onChanged: _isReadOnly
                      ? null
                      : (String? newValue) {
                    setState(() {
                      _details['gender'] = newValue!;
                    });
                  },
                  onSaved: (value) => _details['gender'] = value!,
                  validator: (value) => value == null || value.isEmpty
                      ? 'Select a gender'
                      : null,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.lightBlueAccent.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: TextFormField(
                  controller: _phoneController,
                  readOnly: _isReadOnly,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) => _details['phone'] = value!,
                  validator: (value) => value!.isEmpty ? 'Enter a phone number' : null,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.lightBlueAccent.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: TextFormField(
                  controller: _pickupController,
                  readOnly: _isReadOnly,
                  decoration: InputDecoration(
                    labelText: 'Preferred Pickup Point',
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) => _details['pickup'] = value!,
                  validator: (value) => value!.isEmpty ? 'Enter a pickup point' : null,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: _isReadOnly ? null : _handleSubmit,
                child: Text('Submit', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent, // Button color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: DriverDetails(),
  ));
}

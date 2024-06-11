import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
    'model': '',
    'color': '',
    'plate': '',
  };

  void _handleSubmit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      await FirebaseFirestore.instance.collection('drivers').add(_details);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CarpoolDetails()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Driver Details'), backgroundColor: Colors.lightBlueAccent),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Name', border: OutlineInputBorder()),
                onSaved: (value) => _details['name'] = value!,
                validator: (value) => value!.isEmpty ? 'Enter a name' : null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Age', border: OutlineInputBorder()),
                onSaved: (value) => _details['age'] = value!,
                validator: (value) => value!.isEmpty ? 'Enter an age' : null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Gender', border: OutlineInputBorder()),
                value: _details['gender']!.isEmpty ? null : _details['gender'],
                items: ['Male', 'Female'].map((String gender) {
                  return DropdownMenuItem<String>(
                    value: gender,
                    child: Text(gender),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _details['gender'] = newValue!;
                  });
                },
                onSaved: (value) => _details['gender'] = value!,
                validator: (value) => value == null || value.isEmpty ? 'Select a gender' : null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Model', border: OutlineInputBorder()),
                onSaved: (value) => _details['model'] = value!,
                validator: (value) => value!.isEmpty ? 'Enter a model' : null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Color', border: OutlineInputBorder()),
                onSaved: (value) => _details['color'] = value!,
                validator: (value) => value!.isEmpty ? 'Enter a color' : null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Plate', border: OutlineInputBorder()),
                onSaved: (value) => _details['plate'] = value!,
                validator: (value) => value!.isEmpty ? 'Enter a plate number' : null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: _handleSubmit,
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

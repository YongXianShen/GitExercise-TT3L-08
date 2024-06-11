import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mmusuperapp/carpool/rider_page.dart';


class RiderDetails extends StatefulWidget {
  @override
  _RiderDetailsState createState() => _RiderDetailsState();
}

class _RiderDetailsState extends State<RiderDetails> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> _details = {
    'name': '',
    'age': '',
    'gender': '',
    'bookingtime': ''
  };

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        final DateTime combinedDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );

        setState(() {
          _details['bookingtime'] = combinedDateTime.toString();
        });
      }
    }
  }

  void _handleSubmit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      await FirebaseFirestore.instance.collection('riders').add(_details);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RiderPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rider Details'), backgroundColor: Colors.blueAccent),
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
              child: GestureDetector(
                onTap: () => _selectDateTime(context),
                child: AbsorbPointer(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Select Date & Time',
                      border: OutlineInputBorder(),
                    ),
                    controller: TextEditingController(
                      text: _details['bookingtime'],
                    ),
                    validator: (value) => value!.isEmpty ? 'Select a date and time' : null,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: _handleSubmit,
                child: Text('Submit',style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

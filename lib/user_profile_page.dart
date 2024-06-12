import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _database = FirebaseDatabase.instance.ref();

  final _formKey = GlobalKey<FormState>();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  String _profileImageUrl = 'lib/food/images/avatar1.jpg';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DatabaseReference userRef = _database.child('users/${user.uid}');
      DataSnapshot userDataSnapshot = await userRef.get();
      Map userData = userDataSnapshot.value as Map;
      setState(() {
        _nameController.text = userData['name']  ;
        _emailController.text = userData['email'] ;
        _phoneController.text = userData['phone'] ;
        _addressController.text = userData['address'] ;
        _profileImageUrl = userData['profileImageUrl'] ?? 'lib/food/images/avatar1.jpg';
      });
    }
  }

  Future<void> _saveUserData() async {
    if (_formKey.currentState!.validate()) {
      User? user = _auth.currentUser;
      if (user != null) {
        DatabaseReference userRef = _database.child('users/${user.uid}');
        await userRef.update({
          'name': _nameController.text,
          'email': _emailController.text,
          'phone': _phoneController.text,
          'address': _addressController.text,
          'profileImageUrl': _profileImageUrl,
        });
      }
    }
  }

  void _showImageSelectionDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select Profile Picture'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                _buildImageOption('lib/food/images/avatar2.jpg'),
                _buildImageOption('lib/food/images/avatar3.jpg'),
                _buildImageOption('lib/food/images/avatar4.jpg'),
                _buildImageOption('lib/food/images/avatar5.jpg'),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildImageOption(String imagePath) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _profileImageUrl = imagePath;
        });
        _saveUserData(); // Save the selected image URL to the database
        Navigator.of(context).pop(); // Close the dialog
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(imagePath, width: 100, height: 100),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(_profileImageUrl),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: IconButton(
                        icon: Icon(Icons.camera_alt),
                        onPressed: _showImageSelectionDialog,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: 'Address',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
              ),
              Spacer(),
              Center(
                child: ElevatedButton(
                  onPressed: _saveUserData,
                  child: Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

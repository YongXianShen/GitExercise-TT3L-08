import 'package:flutter/material.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({super.key});
 
  
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'route',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('User Details'),
            leading : IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed:() {
              if (Navigator.canPop(context)) {
              Navigator.pop(context);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("NO back navigation available"),)
                );                
              }
            }
          ),
        ),
      )
    );
  }
}

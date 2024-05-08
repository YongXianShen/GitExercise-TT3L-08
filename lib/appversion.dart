import 'package:flutter/material.dart';


class AppVersion extends StatelessWidget {
  const AppVersion({super.key});
 
  
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'route',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Apps Versions'),
            leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              if (Navigator.canPop(context)) {
              Navigator.pop(context);
            } else {
              ScaffoldMessenger.of(context);
              }
            }
          ),
          
        ),
        body:  const Center(
         child: Text('V1.1.0'),
        )
      )
    );
  }
}

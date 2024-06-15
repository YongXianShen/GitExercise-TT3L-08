import 'package:flutter/material.dart' ;
import 'package:mmusuperapp/food/components/my_drawer.dart';
import 'package:mmusuperapp/home.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),  
      appBar: AppBar(
        title: const Text(
          'MMU SUPER APP',
          style:TextStyle(
            color:Colors.black,
            fontSize:24,
            fontWeight:FontWeight.bold,
          ),
        ),
        toolbarHeight: 120,
        backgroundColor: Theme.of(context).colorScheme.surface,
        centerTitle:true,
        
      ),
      body: const FeaturesCards(),
      
    );
  }
}
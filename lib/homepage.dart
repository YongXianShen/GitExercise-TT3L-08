import 'package:flutter/material.dart' ;
import 'package:mmusuperapp/home.dart';
import 'package:mmusuperapp/settings.dart';
 

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MMU SUPER APPS',
          style:TextStyle(
            color:Colors.black,
            fontSize:24,
            fontWeight:FontWeight.bold
          )
        ),
        backgroundColor: Colors.red,
        elevation:0.0,
        centerTitle:true,
      ),
      body: const NavigationExample(),
    );
  }
}    

class NavigationExample extends StatefulWidget{
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

Widget build(BuildContext context) {
    return const MaterialApp(home: NavigationExample());
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPageIndex,
        children: const [
          FeaturesCards(),
          CommutePage(),
          SettingsPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPageIndex,
        onTap: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Homepage',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}


class CommutePage extends StatelessWidget {
  const CommutePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Chat Page'),
    );
  }
}
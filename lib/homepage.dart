import 'package:flutter/material.dart' ;
import 'package:mmusuperapp/chat.dart';
import 'package:mmusuperapp/home.dart';
import 'package:mmusuperapp/settings.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MMU SUPER APP',
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
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 81, 173),
              ),
              child: Icon(
                Icons.person,
                color: Colors.black,
                size: 64,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title:  const Text('Profile Picture'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.face),
              title:  const Text('Service'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.save_alt_rounded),
              title:  const Text('Saved Posts'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.chat),
              title:  const Text('Chat'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title:  const Text('Settings'),
              onTap: () {},
            ),
          ],
        )
      ),
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
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Chat()),);
          },
          child: const Icon(Icons.chat),
          ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      
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
import 'package:flutter/material.dart';

class HostelFinderDetails extends StatelessWidget {
  const HostelFinderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Roommate Finder',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to Roommate Finder!',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            const Text(
              'Find peaceful roommates.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print('Button pressed! (Add your desired action here)');
              },
              child: const Text('Find Roommates'),
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        
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

      )
    );
  }
}

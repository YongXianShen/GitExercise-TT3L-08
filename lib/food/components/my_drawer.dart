import 'package:flutter/material.dart';
import 'package:mmusuperapp/authentication/login_screen.dart';
import 'package:mmusuperapp/food/components/my_drawer_tile.dart';
import 'package:mmusuperapp/food/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key, required onProfileTap, required onSignOut});


  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          //app logo
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child:Icon(
              Icons.lock_open_rounded,
              size: 80, color: Theme.of(context).colorScheme.inversePrimary,
            ), 
          ),

          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),

          //home list tile
          MyDrawerTile(
            text: "H O M E", 
            icons: Icons.home, 
            onTap: () => Navigator.pop(context),
          ),

          //settings list tile
          MyDrawerTile(
            text: "S E T T I N G S", 
            icons: Icons.settings, 
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                  ),
                );
              },
            ),

          const Spacer(),

          //logout list
          MyDrawerTile(
            text: "L O G O U T", 
            icons: Icons.logout, 
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                  ),
                );
            },
          ),

          const SizedBox(height: 25,)
        ],
      ),
    );
  }
}
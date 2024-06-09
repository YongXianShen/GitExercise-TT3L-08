import 'package:flutter/material.dart';
import 'package:mmusuperapp/authentication/login_screen.dart';
import 'package:mmusuperapp/food/components/my_drawer_tile.dart';
import 'package:mmusuperapp/food/pages/dartmode_page.dart';
import 'package:mmusuperapp/food/widget/bigtext.dart';
import 'package:mmusuperapp/food/widget/smalltext.dart';
import 'package:mmusuperapp/profile_pictures/profile_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});


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

          MyDrawerTile(
            text: "P R O F I L E", 
            icons: Icons.person, 
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => const ProfilePic(),
                  ),
                );
              },
            ),
          

          //settings list tile
          MyDrawerTile(
            text: "D A R K M O D E", 
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
      BigText(text: "v1.1.5"),

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
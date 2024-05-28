import 'package:flutter/material.dart';
import 'package:mmusuperapp/drawer_listtile.dart';

class MyDrawer extends StatelessWidget {
  final void Function()? onProfileTap;
  final void Function()? onSignOut;
  const MyDrawer({
    super.key,
    required this.onProfileTap,
    required this.onSignOut,
    });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.indigo[900],
      child: Column(
        children: (
          const DrawerHeader(
            child: Icon(
              Icons.person
              color: Colors.white,
              size: 100,
            ),
          ),

          MyListTile(
            icon: Icons.home,
            text: 'Home'
            onTap: () => Navigator.pop(context),
          ),

          MyListTile(
            icon: Icons.person,
            text: 'Profile',
            onTap: onProfileTap,
          ),

          MyListTile(
            icon: Icons.logout, 
            text: 'Logout', 
            onTap: onSignOut,
          ),
        ),
      ),
    );
  }
}
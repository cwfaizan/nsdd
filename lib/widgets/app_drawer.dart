import 'package:flutter/material.dart';

import '../utils/routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: ListView(
        children: [
          DrawerHeader(
            child: Column(
              children: [
                CircleAvatar(
                  child: Icon(Icons.person),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Profile'),
            onTap: () => Navigator.restorablePushReplacementNamed(
              context,
              RouteGenerator.profile,
            ),
          ),
          const Divider(),
          ListTile(
            leading: Icon(
              Icons.school,
              // size: Theme.of(context).iconTheme.size,
              // color: Theme.of(context).iconTheme.color,
            ),
            title: const Text('Qualification'),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {},
          ),
          const Divider(),
        ],
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nsdd/pages/login_page.dart';
import 'package:nsdd/utils/helper.dart';

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
                  radius: 50.r,
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: "http://via.placeholder.com/150x150",
                      fit: BoxFit.fill,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
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
            leading: const Icon(
              Icons.school,
              // size: Theme.of(context).iconTheme.size,
              // color: Theme.of(context).iconTheme.color,
            ),
            title: const Text('Qualification'),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('Change Password'),
            onTap: () =>
                Navigator.pushNamed(context, RouteGenerator.changePassword),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              Helper.deleteUser();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const LoginPage(),
                ),
                (route) => false,
              );
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}

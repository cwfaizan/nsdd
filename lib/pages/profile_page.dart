import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/constants.dart';
import '../utils/file_path.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: SvgPicture.asset(
              FilePath.profileTopBg(context),
              height: 334.h,
              width: double.infinity,
            ),
          ),
          Positioned(
            top: 30.h,
            left: 0,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {},
            ),
          ),
          Positioned(
            top: 80.h,
            left: (ScreenUtil().screenWidth / 2) - 70.r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 70.r,
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
                kPageItemSpacing2,
                Text(
                  'short name',
                  style: Theme.of(context).textTheme.headline3,
                ),
                Text(
                  'Student',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ),
          Positioned(
            top: 160.h,
            left: 220.w,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                shape: const CircleBorder(),
              ),
              child: const Icon(
                Icons.edit,
                color: kWhiteColor,
              ),
              onPressed: () {},
            ),
          ),
          Positioned(
            bottom: 10.h,
            right: 0,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                shape: const CircleBorder(),
              ),
              child: const Icon(
                Icons.edit,
                color: kWhiteColor,
              ),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 300.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: const Icon(Icons.pin),
                    title: Text('32104-12345-3'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: Text('full name'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.email),
                    title: Text('email address'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.phone),
                    title: Text('0321-1234567'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.phone),
                    title: Text('Other contact no'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.pin),
                    title: Text('32104-12345-3'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.wc),
                    title: Text('gender'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.date_range),
                    title: Text('Date of Birth'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: Text('Enter father/guardian name'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.phone),
                    title: Text('Father/guardian contact no'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.work),
                    title: Text('father/guardian occupation'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.location_on),
                    title: Text('postal address'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.location_on),
                    title: Text('permanent address'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.location_city),
                    title: Text('domicile province'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.location_city),
                    title: Text('domicile district'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.transfer_within_a_station),
                    title: Text('Minority'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.wheelchair_pickup),
                    title: Text('Disablity'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.add_location_alt),
                    title: Text('other nationality'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

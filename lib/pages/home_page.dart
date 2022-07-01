import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nsdd/models/program.dart';
import 'package:nsdd/utils/constants.dart';
import 'package:nsdd/widgets/program_card.dart';

import '../utils/file_path.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final programs = [
    Program(
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/3/3c/Kj-logo.png',
      title: 'Kamyab Jawan Program',
    ),
    Program(
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/en/1/17/NUTECH_logo.png',
      title: 'NUtech',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          )
        ],
      ),
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          children: [],
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: REdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.only(
            topLeft: kRadiusCircular,
            topRight: kRadiusCircular,
          ),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi FAIZAN',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  Text(
                    'Welcome back',
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ],
              ),
            ),
            kPageItemSpacing,
            Text(
              'Programs',
              style: Theme.of(context).textTheme.headline3,
            ),
            kPageItemSpacing,
            SizedBox(
              height: 223.h,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: programs.length,
                itemBuilder: (context, index) => ProgramCard(
                  program: programs[index],
                ),
              ),
            ),
            kPageItemSpacing,
            Text(
              'Courses',
              style: Theme.of(context).textTheme.headline3,
            ),
            kPageItemSpacing,
          ],
        ),
      ),
    );
  }
}

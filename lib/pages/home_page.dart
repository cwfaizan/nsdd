import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nsdd/utils/constants.dart';
import 'package:nsdd/widgets/app_drawer.dart';
import 'package:nsdd/widgets/course_card.dart';
import 'package:nsdd/widgets/program_card.dart';

import '../utils/file_path.dart';
import '../providers/dummy_data.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const AppDrawer(),
      body: Column(
        children: [
          SizedBox(
            height: 200.h,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: SvgPicture.asset(
                    FilePath.homeTopBg(context),
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  top: 30.h,
                  left: 12.w,
                  right: 12.w,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () =>
                                _scaffoldKey.currentState!.openDrawer(),
                            icon: Icon(
                              Icons.menu,
                              size: 30.w,
                              color: kWhiteColor,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Hi FAIZAN',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .copyWith(color: kWhiteColor),
                              ),
                              Text(
                                'Welcome back',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: kWhiteColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 6.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Offered Programs',
                            style: TextStyle(
                              color: kWhiteColor,
                            ),
                          ),
                          Text(
                            '02',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kWhiteColor,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Offered Courses',
                            style: TextStyle(
                              color: kWhiteColor,
                            ),
                          ),
                          Text(
                            '15',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kWhiteColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Text(
            'Programs',
            style: Theme.of(context).textTheme.headline3,
          ),
          kPageItemSpacing,
          Expanded(
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
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: courses.length,
              itemBuilder: (context, index) => CourseCard(
                course: courses[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

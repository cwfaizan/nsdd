import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nsdd/utils/constants.dart';

import '../utils/file_path.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          children: [],
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: SvgPicture.asset(
              FilePath.homeTopBg(context),
              // height: 321.h,
              // width: 375.w,
            ),
          ),
          Positioned(
            top: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
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
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                            color: kWhiteColor,
                          ),
                    ),
                    Text(
                      'Welcome back',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

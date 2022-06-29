import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nsdd/models/program.dart';
import 'package:nsdd/utils/constants.dart';
import 'package:nsdd/widgets/program_card.dart';

import '../utils/file_path.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final programs = [
    Program(
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/3/3c/Kj-logo.png',
      title: 'Kamyab Jawan Program',
    ),
    Program(
      imageUrl:
          'https://scontent.fisb16-1.fna.fbcdn.net/v/t1.18169-9/29541372_624658237874180_6757614764119362142_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=i1o55wV2pysAX-8ZJeN&_nc_ht=scontent.fisb16-1.fna&oh=00_AT_CqpqXZWPOV32UJ8Wakzoma4GSP6RgkRuOvNf6gEhSBA&oe=62E1934F',
      title: 'NUtech',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [],
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: ScreenUtil().screenWidth,
            height: 219.h,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  child: SvgPicture.asset(
                    FilePath.homeTopBg(context),
                    width: ScreenUtil().screenWidth,
                  ),
                ),
                Positioned(
                  top: 40.h,
                  child: SizedBox(
                    width: ScreenUtil().screenWidth,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 5.w,
                        right: 17.w,
                      ),
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
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .copyWith(
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
                          ),
                        ],
                      ),
                    ),
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
          SizedBox(
            height: 223.h,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 2,
              itemBuilder: (context, index) => ProgramCard(
                program: programs[index],
              ),
            ),
          ),
          Text(
            'Courses',
            style: Theme.of(context).textTheme.headline3,
          ),
        ],
      ),
    );
  }
}

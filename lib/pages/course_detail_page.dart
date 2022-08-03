import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nsdd/models/course.dart';

class CourseDetailPage extends StatelessWidget {
  final Course course;
  const CourseDetailPage({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Color(0xffD9D9D9),
          child: Column(
            children: [
              // header image
              Container(
                width: MediaQuery.of(context).size.width,
                height: 240.h,
                child: SvgPicture.asset(
                  "assets/svgs/applied_course.svg",
                  fit: BoxFit.cover,
                ),
              ),

              // course heading
              Container(
                margin: EdgeInsets.only(top: 12.h, bottom: 12.h),
                width: double.maxFinite,
                child: Text(
                  "Mobile Application Development",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff000000),
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              // list of courses
              ListView.builder(
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) => Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 4.h, horizontal: 28.w),
                  width: double.maxFinite,
                  child: getListCourse(title: "Duration", value: "6 - Months"),
                ),
              ),
              //Course Modules
              SizedBox(height: 5.h),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "Course Modules",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff000000),
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              // list of the course modules
              ListView.builder(
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
                    margin:
                        EdgeInsets.only(bottom: 24.h, left: 28.w, right: 28.w),
                    child:
                        courseModulesList(title: "Basic Concepts of Database"),
                  );
                },
              ),
// bottom bar
              Spacer(),
              Container(
                margin: EdgeInsets.only(bottom: 22.h, left: 28.w, right: 28.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Price",
                        ),
                        Wrap(
                          children: [
                            Text(
                              "3000",
                              style: TextStyle(
                                color: Color(0xff8B010B),
                              ),
                            ),
                            Text(
                              "/month",
                              style: TextStyle(
                                color: Color(0xff787681),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Container(
                      width: 110.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: Color(0xff8B010B),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "Apply now",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Text courseModulesList({required String title}) {
    return Text(
      title,
      style: TextStyle(
        color: Color(0xff444444),
        fontWeight: FontWeight.w700,
        fontSize: 12.sp,
      ),
    );
  }

  Row getListCourse({required String title, required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Color(0xff787681),
            fontWeight: FontWeight.w400,
            fontSize: 12.sp,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: Color(0xff444444),
            fontWeight: FontWeight.w700,
            fontSize: 12.sp,
          ),
        ),
      ],
    );
  }
}

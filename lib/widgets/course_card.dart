import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nsdd/models/course.dart';

import '../utils/constants.dart';

class CourseCard extends StatelessWidget {
  final Course course;
  const CourseCard({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      // semanticContainer: true,
      clipBehavior: Clip.hardEdge,
      shape: kRoundedRectangleBorderShape,
      // borderOnForeground: true,
      elevation: 4,
      // shadowColor:Colors.green,
      margin: REdgeInsets.all(5),
      child: Row(
        children: [
          Image.network(
            course.imageUrl,
            height: 120.h,
            width: 120.w,
            fit: BoxFit.fill,
          ),
          Expanded(
            child: Padding(
              padding: REdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    course.title,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Charges'),
                      if (course.charges == 0) const Text('Free'),
                      if (course.charges != 0)
                        Text('${course.charges}/${course.chargesUnit}'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Duration'),
                      Text('${course.duration}-${course.durationUnit}'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Classes'),
                      Text(course.classDays),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Class Timing'),
                      Text(course.classTiming),
                    ],
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

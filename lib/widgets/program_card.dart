import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nsdd/models/program.dart';

import '../utils/constants.dart';

class ProgramCard extends StatelessWidget {
  final Program program;
  const ProgramCard({Key? key, required this.program}) : super(key: key);

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
      child: Stack(
        children: [
          Image.network(
            program.imageUrl,
            fit: BoxFit.fill,
            height: 166.h,
            width: 166.w,
          ),
          Positioned(
            top: 10.w,
            left: 10.w,
            child: ClipRRect(
              borderRadius: kBorderRadiusAllHalf,
              child: Container(
                color: Theme.of(context).colorScheme.surface,
                child: Center(
                  child: Padding(
                    padding: REdgeInsets.all(5.0),
                    child: Text(
                      'New',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.black54,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 9.h),
                  child: Text(
                    program.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kWhiteColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

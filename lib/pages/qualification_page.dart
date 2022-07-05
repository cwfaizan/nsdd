import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nsdd/utils/routes.dart';

import '../providers/dummy_data.dart';
import '../utils/file_path.dart';
import '../widgets/qualification_card.dart';

class QualificationPage extends StatelessWidget {
  const QualificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back,
            size: 30.w,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        title: Text(
          'Qualification',
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context)
                .pushNamed(RouteGenerator.editQualification),
            icon: Icon(
              Icons.add,
              size: 30.w,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SvgPicture.asset(
              FilePath.bottomRightCornerBg(context),
              height: 188.h,
              fit: BoxFit.fill,
            ),
          ),
          qualifications.isEmpty
              ? Center(
                  child: Text(
                    'No Qualification Added Yet',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                )
              : ListView.builder(
                  itemCount: qualifications.length,
                  itemBuilder: (context, index) => QualificationCard(
                    qualification: qualifications[index],
                  ),
                ),
        ],
      ),
    );
  }
}

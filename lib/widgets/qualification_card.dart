import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/qualification.dart';
import '../utils/constants.dart';

class QualificationCard extends StatelessWidget {
  final Qualification qualification;
  const QualificationCard({Key? key, required this.qualification})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: kContentPadding,
        child: Column(
          children: [
            Text(
              qualification.degreeTitle,
              style: kTextStyleBold,
            ),
            Text(
              qualification.university.name,
              style: kTextStyleBold,
            ),
            kPageItemSpacing2,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Passing Year'),
                Text(
                  DateFormat.yMMMM().format(qualification.passingYear),
                  style: kTextStyleBold,
                ),
              ],
            ),
            kPageItemSpacing,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Qualification Level'),
                Text(
                  qualification.qualificationLevel,
                  style: kTextStyleBold,
                ),
              ],
            ),
            kPageItemSpacing,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Marks/CGPA'),
                Text(
                  '${qualification.obtainedMarks}/${qualification.totalMarks}',
                  style: kTextStyleBold,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

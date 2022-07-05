import 'package:flutter/material.dart';

import '../models/qualification.dart';

class QualificationCard extends StatelessWidget {
  final Qualification qualification;
  const QualificationCard({Key? key, required this.qualification})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(qualification.degreeTitle),
          Text(qualification.university.name),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Marks'),
              Text(
                  '${qualification.obtainedMarks}/${qualification.totalMarks}'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Passing Year'),
              Text('${qualification.passingYear.toString()}'),
            ],
          ),
        ],
      ),
    );
  }
}

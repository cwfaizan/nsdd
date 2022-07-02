import 'package:nsdd/models/course.dart';

import '../models/program.dart';

final programs = [
  Program(
    id: 1,
    imageUrl: 'https://upload.wikimedia.org/wikipedia/en/1/17/NUTECH_logo.png',
    title: 'NUtech',
  ),
  Program(
    id: 2,
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/3/3c/Kj-logo.png',
    title: 'Kamyab Jawan Program',
  ),
];

final courses = [
  Course(
    title: 'Mobile App Development',
    imageUrl: 'https://therightsw.com/wp-content/uploads/2022/05/creative8.png',
    charges: 0,
    chargesUnit: 'NA',
    duration: 6,
    durationUnit: 'months',
    classDays: 'Mon-Fri',
    classTiming: '9AM-1PM',
    batchNo: 2,
    programId: 2,
  ),
  Course(
    title: 'Computer Graphics - Motion',
    imageUrl:
        'https://beonair.com/wp-content/uploads/2022/03/Using-Animation-Motion-Graphics-in-Your-Marketing-1.jpg',
    charges: 3500,
    chargesUnit: 'month',
    duration: 6,
    durationUnit: 'months',
    classDays: 'Mon-Fri',
    classTiming: '9AM-1PM',
    batchNo: 3,
    programId: 1,
  ),
];

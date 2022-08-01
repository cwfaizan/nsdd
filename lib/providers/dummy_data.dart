import 'package:flutter/material.dart';
import 'package:nsdd/models/course.dart';
import 'package:nsdd/models/qualification.dart';
import 'package:nsdd/models/qualification_level.dart';
import 'package:nsdd/models/university.dart';

import '../models/city.dart';
import '../models/program.dart';
import '../models/province.dart';

// home page
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
    imageUrl: 'http://via.placeholder.com/120x120',
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

// profile page
final genderDropdownItems = [
  const DropdownMenuItem(value: 'Male', child: Text('Male')),
  const DropdownMenuItem(value: 'Female', child: Text('Female')),
  const DropdownMenuItem(value: 'Other', child: Text('Other')),
];

final fatherOccupationDropdownItems = [
  const DropdownMenuItem(
    value: 'Govt Servant/Retired',
    child: Text('Govt Servant/Retired'),
  ),
  const DropdownMenuItem(
    value: 'Pak Army Servant/Retired',
    child: Text('Pak Army Servant/Retired'),
  ),
  const DropdownMenuItem(
    value: 'Pak Air Force Servant/Retired',
    child: Text('Pak Air Force Servant/Retired'),
  ),
  const DropdownMenuItem(
    value: 'Pak Navy Servant/Retired',
    child: Text('Pak Navy Servant/Retired'),
  ),
  const DropdownMenuItem(
    value: 'Businessman',
    child: Text('Businessman'),
  ),
  const DropdownMenuItem(
    value: 'Other',
    child: Text('Other'),
  ),
];

final provinceDropdownItems = [
  DropdownMenuItem(
    value: Province(id: 1, name: 'Islamabad', countryId: 1),
    child: const Text('Islamabad'),
  ),
];

final cityDropdownItems = [
  DropdownMenuItem(
    value: City(id: 1, name: 'Islamabad', provinceId: 1),
    child: const Text('Islamabad'),
  ),
];

// qualification page
final qualificationLevelDropdownItems = [
  DropdownMenuItem(
    value: QualificationLevel(id: 1, name: '10-th'),
    child: const Text('10-th'),
  ),
];

final universityDropdownItems = [
  DropdownMenuItem(
    value: University(id: 1, name: 'NUTECH, ISB'),
    child: const Text('NUTECH'),
  ),
];

final List<Qualification> qualifications = [
  Qualification(
    qualificationLevel: '18-years',
    degreeTitle: 'MC CS',
    obtainedMarks: 3.5,
    totalMarks: 4.0,
    passingYear: DateTime.now(),
    university: University(id: 1, name: 'NUTECH, ISB'),
  ),
  Qualification(
    qualificationLevel: '16-years',
    degreeTitle: 'BS CS',
    obtainedMarks: 3.6,
    totalMarks: 4.0,
    passingYear: DateTime.now(),
    university: University(id: 1, name: 'NUTECH, ISB'),
  ),
  Qualification(
    qualificationLevel: '12-years',
    degreeTitle: 'ICS',
    obtainedMarks: 750,
    totalMarks: 1100,
    passingYear: DateTime.now(),
    university: University(id: 1, name: 'NUTECH, ISB'),
  ),
];

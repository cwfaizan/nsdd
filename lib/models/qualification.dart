import 'package:nsdd/models/university.dart';

class Qualification {
  final String qualificationLevel;
  final String degreeTitle;
  final double obtainedMarks;
  final double totalMarks;
  final DateTime passingYear;
  final University university;

  Qualification({
    required this.qualificationLevel,
    required this.degreeTitle,
    required this.obtainedMarks,
    required this.totalMarks,
    required this.passingYear,
    required this.university,
  });
}

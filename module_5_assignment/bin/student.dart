import 'others.dart';
import 'parson.dart';

class Student extends Person {
  // student class attributes
  int _studentId;
  String _grade;
  List<int> courseScores = [];

  // this is Student constructor
  Student(String name, int age, String address, this._studentId, this._grade)
      : super(name, age, address, StudentRole());

  int get getStudentId {
    return _studentId;
  }

  String get getGrade {
    return _grade;
  }

  // Override the displayRole() method
  @override
  void displayRole() {
    print('Student Information: ');
    super.displayRole();
  }

  // calculate course average score
  double calculateAverage() {
    int sum = courseScores.reduce((value, element) => value + element);
    double average = sum / courseScores.length;
    return average;
  }
}

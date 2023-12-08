import 'others.dart';
import 'parson.dart';

class Teacher extends Person {
  int teacherId;
  List<String> coursesTaught = [];

  // this is teacher constructor
  Teacher(
      String name, int age, String address, this.teacherId, this.coursesTaught)
      : super(name, age, address, TeacherRole());

  // Override the displayRole() method
  @override
  void displayRole() {
    print('Teacher Information: ');
    super.displayRole();
  }

  // method created for courses taught
  void displayCoursesTaught() {
    print('Courses Taught: $coursesTaught');
  }
}

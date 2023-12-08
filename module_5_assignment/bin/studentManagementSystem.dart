// new class for studentManagementSystem
import 'student.dart';
import 'teacher.dart';

class StudentManagementSystem {
  static void main() {
    // instance of student and teacher class
    var student = Student('John Doe', 20, '123 Main Street', 1234, 'A+');
    var teacher = Teacher(
        'Mrs. Smith', 35, '456 Oak St', 14, ['Math', 'English', 'Bangla']);

    // attribute set
    student.courseScores = [90, 85, 82];

    // role of each person using displayRole method
    student.displayRole();
    print('Name: ${student.getName}');
    print('Age: ${student.getAge}');
    print('Address: ${student.getAddress}');
    print('Student id: ${student.getStudentId}');
    print('Student Grade: ${student.getGrade}');
    print('Average: ${student.calculateAverage()}');
    print('\n');

    teacher.displayRole();
    print('Name: ${teacher.getName}');
    print('Age: ${teacher.getAge}');
    print('Address: ${teacher.getAddress}');
    print('Teacher Id: ${teacher.teacherId}');
    teacher.displayCoursesTaught();
  }
}

void main() {
  StudentManagementSystem.main();
}

abstract class Role {
  void displayRole();
}

class Person implements Role {
  String name;
  int age;
  String address;
  Role role;
  Person(this.name, this.age, this.address, this.role,);

  @override
  void displayRole() {
    role.displayRole();
  }
}
class Student extends Person {
  int studentID;
  List<double>? courseScores;

  Student(String name, int age, String address, this.studentID,
      ) : super(name, age, address, StudentRole());

  @override
  void displayRole() {
    print('Role: Student');
    super.displayRole();
  }

  myFun() {
    return courseScores!.reduce((a, b) => a + b) / courseScores!.length;
  }
}

class Teacher extends Person {
  int teacherID;
  List<String>? coursesTaught;

  Teacher(String name, int age, String address, this.teacherID)
      : super(name, age, address, TeacherRole());

  @override
  void displayRole() {
    print('Role: Teacher');
    super.displayRole();
  }

  void displayCoursesTaught() {
    if (coursesTaught == null || coursesTaught!.isEmpty) {
      print('No courses taught yet.');
    } else {
      print('Courses Taught:');
      for (var course in coursesTaught!) {
        print('- $course');
      }
    }
  }
}

class StudentManagementSystem {
  static void main() {
    var student = Student('John Doe', 20, '123 Main St', 12345,);
    student.courseScores = [90, 85, 82,];

    var teacher = Teacher('Mrs. Smith', 35, '456 Oak St', 12345);
    teacher.coursesTaught = ['Math', 'English', 'Bangla'];

    student.displayRole();
    print('Name: ${student.name}');
    print('Age: ${student.age}');
    print('Address: ${student.address}');
    print('Average Score: ${student.myFun().toStringAsFixed(1)}');
    print('\n');

    teacher.displayRole();
    print('Name: ${teacher.name}');
    print('Age: ${teacher.age}');
    print('Address: ${teacher.address}');
    teacher.displayCoursesTaught();
  }
}

class StudentRole implements Role {
  @override
  void displayRole() {}
}

class TeacherRole implements Role {
  @override
  void displayRole() {}
}


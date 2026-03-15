import 'dart:math';

import 'package:untitled1/untitled1.dart' as untitled1;
import 'dart:io';

List<String> students = [
  "Ivan",
  "Maria",
  "Alexey",
  "Olga",
  "Dmitry",
  "Anna"
];

List<String> subjects = [
  "Mathematics",
  "Physics",
  "Computer Science",
  "English"
];

Map<String, Map<String, int>> grades = {
  "Ivan": {
    "Mathematics": 5,
    "Physics": 4,
    "Computer Science": 5,
    "English": 3
  },
  "Maria": {
    "Mathematics": 4,
    "Physics": 5,
    "Computer Science": 5,
    "English": 4
  },
  "Alexey": {
    "Mathematics": 3,
    "Physics": 4,
    "Computer Science": 4,
    "English": 3
  },
  "Olga": {
    "Mathematics": 5,
    "Physics": 5,
    "Computer Science": 4,
    "English": 5
  },
  "Dmitry": {
    "Mathematics": 2,
    "Physics": 3,
    "Computer Science": 4,
    "English": 3
  },
  "Anna": {
    "Mathematics": 4,
    "Physics": 4,
    "Computer Science": 5,
    "English": 4
  }
};

void main(List<String> arguments) {
  while(true){
    switch (get_choice()) {
      case 1:
        student_list();

      case 2:
        subject_list();
        break;

      case 3:
        students_grades();
        break;

      case 4:
        average_by_subject();
        break;

      case 5:
        average_by_student();
        break;

      case 6:
        best_student();
        break;

      case 7:
        worst_subject();
        break;

      case 8:
        group_average();
        break;

      case 9:
        subjects_info();
        break;

      case 10:
        students_without_two();
        break;

      case 11:
        students_all_above_four();
        break;

      case 12:
        return;

      default:
        print("Incorrect choice. Try again");
    }
  }
}

  int get_choice() {
    print("\nChoose option: ");
    print("1 - student list");
    print("2 - subject list");
    print("3 - students grades");
    print("4 - average grade by subject");
    print("5 - average grade by student");
    print("6 - best student");
    print("7 - subject with lowest average");
    print("8 - group average grade");
    print("9 - subjects list and count");
    print("10 - students without grade 2");
    print("11 - students with all grades >= 4");
    print("12 - Exit");
    print("Your choice: ");

    int choice = int.parse(stdin.readLineSync()!);
    return choice;
  }

  void student_list() {
    for(int i = 0; i < students.length; i++) {
      print("${i + 1}: ${students[i]}");
    }
  }

  void subject_list() {
    for(int i = 0; i < subjects.length; i++) {
      print("${i + 1}: ${subjects[i]}");
    }
  }

  void students_grades() {
    for (var entry in grades.entries) {
      print("${entry.key}:");

      for (var grade in entry.value.entries) {
        print("  ${grade.key}: ${grade.value}");
      }
    }
  }

  void average_by_subject() {
    for (int i = 0; i < subjects.length; i++) {
      String subject = subjects[i];
      int sum = 0;

      for (int j = 0; j < students.length; j++) {
        String student = students[j];
        sum += grades[student]![subject]!;
      }

      double avg = sum / students.length;
      print("$subject average: $avg");
    }
  }

  void average_by_student() {
    for (int i = 0; i < students.length; i++) {
      String student = students[i];
      int sum = 0;

      for (int j = 0; j < subjects.length; j++) {
        String subject = subjects[j];
        sum += grades[student]![subject]!;
      }

      double avg = sum / subjects.length;
      print("$student average: $avg");
    }
  }

  void best_student() {
    String bestStudent = "";
    double bestAvg = 0;

    for (int i = 0; i < students.length; i++) {
      String student = students[i];
      int sum = 0;

      for (int j = 0; j < subjects.length; j++) {
        String subject = subjects[j];
        sum += grades[student]![subject]!;
      }

      double avg = sum / subjects.length;

      if (avg > bestAvg) {
        bestAvg = avg;
        bestStudent = student;
      }

    }

    print("Best student: $bestStudent");
  }

  void worst_subject() {
    String worst = "";
    double worstAvg = 10;

    for (int i = 0; i < subjects.length; i++) {
      String subject = subjects[i];
      int sum = 0;

      for (int j = 0; j < students.length; j++) {
        String student = students[j];
        sum += grades[student]![subject]!;
      }

      double avg = sum / students.length;

      if (avg < worstAvg) {
        worstAvg = avg;
        worst = subject;
      }
    }

    print("Worst subject: $worst");
  }

  void group_average() {
    int sum = 0;
    int counter = 0;

    for (int i = 0; i < students.length; i++) {
      String student = students[i];

      for (int j = 0; j < subjects.length; j++) {
        String subject = subjects[j];
        sum += grades[student]![subject]!;
        counter++;
      }
    }

    double avg = sum / counter;
    print("Group average: $avg");
  }

  void subjects_info() {
    for (int i = 0; i < subjects.length; i++) {
      print(subjects[i]);
    }

    print("Total subjects: ${subjects.length}");
  }

  void students_without_two() {
    for (int i = 0; i < students.length; i++) {
      String student = students[i];
      bool hasTwo = false;

      for (int j = 0; j < subjects.length; j++) {
        String subject = subjects[j];

        if (grades[student]![subject] == 2) {
          hasTwo = true;
        }
      }

      if (!hasTwo) {
        print(student);
      }

    }
  }

  void students_all_above_four() {
    for (int i = 0; i < students.length; i++) {
      String student = students[i];
      bool good = true;

      for (int j = 0; j < subjects.length; j++) {
        String subject = subjects[j];

        if (grades[student]![subject]! < 4) {
          good = false;
        }
      }

      if (good) {
        print(student);
      }

    }

}






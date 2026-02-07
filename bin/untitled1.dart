import 'dart:math';

import 'package:untitled1/untitled1.dart' as untitled1;
import 'dart:io';

double plus(double a, double b) {
  return (a + b);
}

double minus(double a, double b) {
  return (a - b);
}

double multiplication(double a, double b) {
  return (a * b);
}

double division(double a, double b) {
  return (a / b);
}

int intDivision(double a, double b) {
  return (a~/b);
}

double sonata(double a, double b) {
  return(a % b);
}

num toPow(double a, double b) {
  return pow(a, b);
}

bool isBothPositive(double a, double b) {
  return (a >= 0) && (b >= 0);
}

bool isOnePositive(double a, double b) {
  return (a >= 0) || (b >= 0);
}

bool reverseAnswer(double a, double b) {
  return !(isOnePositive(a, b));
}

int getMathChoice() {
  print("\nChoose operation: ");
  print("1 - sum");
  print("2 - minus");
  print("3 - division");
  print("4 - multiplication");
  print("5 - Int division");
  print("6 - Sonata");
  print("7 - pow");
  print("Your choice: ");

  int input = int.parse(stdin.readLineSync()!);

  return input;
}

int getComparsionChoice() {
  print("\nChoose operation:");
  print("1 - ==");
  print("2 - !=");
  print("3 - >");
  print("4 - <");
  print("5 - >=");
  print("6 - <=");
  print("7 - is both positive");
  print("8 - is one positive");
  print("9 - reverse is both positive");
  print("10 - Exit");
  print("Your choice: ");

  int input = int.parse(stdin.readLineSync()!);

  return input;
}

void comparsionOperations() {
  print("Enter first num: ");
  double a = double.parse(stdin.readLineSync()!);

  print("Enter second num: ");
  double b = double.parse(stdin.readLineSync()!);

  switch(getComparsionChoice()){
    case 1:
      print(a == b);
      break;

    case 2:
      print(a != b);
      break;
      
    case 3:
      print(a > b);
      break;

    case 4:
      print(a < b);
      break;

    case 5:
      print(a >= b);
      break;

    case 6:
      print(a <= b);
      break;

    case 7:
      print(isBothPositive(a, b));
      break;

    case 8:
      print(isOnePositive(a, b));
      break;

    case 9:
      print(reverseAnswer(a, b));
      break;

    case 10:
      print("Exiting...");
      break;

    default:
      print("Incorrect choice, try again");
      comparsionOperations();
      break;
  }
}

void mathOperations() {
  print("Enter first num");
  double a = double.parse(stdin.readLineSync()!);

  print("Enter second num");
  double b = double.parse(stdin.readLineSync()!);

  switch (getMathChoice()) {
    case 1:
      print(plus(a, b));
      break;

    case 2:
      print(minus(a, b));
      break;

    case 3:
      print(division(a, b));
      break;

    case 4:
      print(multiplication(a, b));
      break;

    case 5:
      print(intDivision(a, b));
      break;

    case 6:
      print(sonata(a, b));
      break;

    case 7:
      print(toPow(a, b));
      break;
  }
}

void main(List<String> arguments) {
  while(true){
    print("Enter type of operation: ");
    print("1 - Math operations");
    print("2 - Comparsion operations");
    print("3 - Exit");
    print("Your choice: ");

    int choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        mathOperations();
        break;

      case 2:
        comparsionOperations();
        break;

      case 3:
        print("Exiting...");
        return;
    }
  }
}

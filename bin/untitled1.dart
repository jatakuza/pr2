import 'dart:math';

import 'package:untitled1/untitled1.dart' as untitled1;
import 'dart:io';

void main(List<String> arguments) {
  while (true) {
    switch (getChoice()) {
      case 1:
        print("Enter three numbers:");
        int a = int.parse(stdin.readLineSync()!);
        int b = int.parse(stdin.readLineSync()!);
        int c = int.parse(stdin.readLineSync()!);

        print("Max: ${maxOfThree(a, b, c)}");
        break;

      case 2:
        List<int> list = readIntList();
        print("Sum = ${sumList(list)}");
        break;

      case 3:
        List<int> list = readIntList();
        print("Product = ${productList(list)}");
        break;

      case 4:
        List list = readStringList();
        print("Without duplicates: ${removeDuplicates(list)}");
        break;

      case 5:
        print("Enter number:");
        int n = int.parse(stdin.readLineSync()!);
        print("Factorial: ${factorial(n)}");
        break;

      case 6:
        List list = readStringList();
        print("Enter element:");
        var element = stdin.readLineSync()!;
        print("Exists: ${containsElement(list, element)}");
        break;

      case 7:
        List list = readStringList();
        print("Elements with odd index:");
        printOddIndexElements(list);
        break;

      case 8:
        List list = readStringList();
        print("Reversed: ${reverseList(list)}");
        break;

      case 9:
        List<int> list = readIntList();
        print("Average = ${average(list)}");
        break;

      case 10:
        List list = readStringList();
        print("Enter element:");
        var element = stdin.readLineSync()!;
        print("Occurrences: ${countOccurrences(list, element)}");
        break;

      case 11:
        print("Exit");
        return;
    }
  }
}

int getChoice() {
  print("\nChoose option:");
  print("1 - find maximum of three numbers");
  print("2 - sum of list elements");
  print("3 - product of list elements");
  print("4 - remove duplicate elements from list");
  print("5 - calculate factorial of a number");
  print("6 - check if element exists in list or set");
  print("7 - print list elements with odd index");
  print("8 - reverse list");
  print("9 - calculate average of list elements");
  print("10 - count occurrences of an element in list");
  print("11 - Exit");
  print("Your choice: ");

  return int.parse(stdin.readLineSync()!);
}

List<int> readIntList() {
  print("Enter numbers: ");
  return stdin.readLineSync()!.split(' ').map(int.parse).toList();
}

List<String> readStringList() {
  print("Enter elements: ");
  return stdin.readLineSync()!.split(' ');
}

int maxOfThree(int a, int b, int c) {
  return max(a, max(b, c));
}

int sumList(List<int> list) {
  int sum = 0;

  for (int i = 0; i < list.length; i++) {
    sum += list[i];
  }

  return sum;
}

int productList(List<int> list) {
  int product = 1;

  for (int i = 0; i < list.length; i++) {
    product *= list[i];
  }

  return product;
}

Set removeDuplicates(List list) {
  return list.toSet();
}

int factorial(int n) {
  int result = 1;

  for (int i = 1; i <= n; i++) {
    result = result * i;
  }

  return result;
}

bool containsElement(Iterable collection, element) {
  if (collection.contains(element)) {
    return true;
  }else {
    return false;
  }
}

void printOddIndexElements(List list) {
  for (int i = 1; i < list.length; i += 2) {
    print(list[i]);
  }
}

List reverseList(List list) {
  var revList = list.reversed.toList();

  return revList;
}

double average(List<num> list) {
  num sum = 0;

  for (int i = 0; i < list.length; i++) {
    sum = sum + list[i];
  }

  return sum / list.length;
}

int countOccurrences(List list, element) {
  int counter = 0;
  for (var item in list) {
    if (item == element){
      counter++;
    }
  }

  return counter;
}








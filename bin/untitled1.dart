import 'dart:io';
import 'dart:math';
import 'package:characters/characters.dart';

enum Mood {
  happy("\u{1F60A}", "Happy", 8),
  sad("\u{1F622}", "Sad", 3),
  sleepy("\u{1F62A}", "Sleepy", 2),
  excited("\u{1F929}", "Excited", 9),
  angry("\u{1F620}", "Angry", 6);

  final String emoji;
  final String description;
  final int energy;

  const Mood(this.emoji, this.description, this.energy);
}

void main() {
  stdout.write("Enter your name: ");
  String name = stdin.readLineSync()!;

  var random = Random();
  Mood mood = Mood.values[random.nextInt(Mood.values.length)];

  print("Hello, $name! Your mood is: ${mood.emoji} ${mood.description} (energy: ${mood.energy}/10)");

  int codePoint = mood.emoji.runes.first;
  print("Emoji Unicode: U+${codePoint.toRadixString(16).toUpperCase()}");

  stdout.write("Do you want to analyze complex emojis? (y/n): ");
  String answer = stdin.readLineSync()!;

  if (answer == "y") {
    stdout.write("Enter a string with emojis: ");
    String input = stdin.readLineSync()!;

    int codeUnits = input.length;
    int codePoints = input.runes.length;
    int realCharacters = input.characters.length;

    print("\nString analysis:");
    print("16-bit code units (String.length): $codeUnits");
    print("Code points (runes): $codePoints");
    print("Real characters (characters): $realCharacters");

    print("\nUnicode of each character:");

    for (var char in input.characters) {
      List<String> codes = char.runes
          .map((r) => "U+${r.toRadixString(16).toUpperCase()}")
          .toList();

      print("$char -> ${codes.join(" ")}");
    }
  }
}
import 'dart:io';
import 'dart:math';

///////////////////
class Mug {
  double volume;

  Mug(this.volume);

  void drink(double amount) {
    if (amount <= volume) {
      volume -= amount;
      print("Drunk: $amount. Remaining: $volume");
    } else {
      print("Not enough liquid");
    }
  }
}

class Human {
  String name;

  Human(this.name);

  void drinkFrom(Mug mug, double amount) {
    print("$name is drinking...");
    mug.drink(amount);
  }
}

///////////////////////
class Storage {
  List<String> items = [];

  void addItem(String item) {
    items.add(item);
  }

  String? removeItem() {
    if (items.isEmpty) {
      return null;
    }

    return items.removeLast();
  }
}

class Wardrobe {
  List<Storage> storages;

  Wardrobe(this.storages);

  void putItem(String item) {
    storages.first.addItem(item);
    print("Put $item in the wardrobe");
  }

  void takeItem() {
    var item = storages.first.removeItem();
    print(item ?? "Nothing here");
  }
}

//////////////////////////
class Plate {
  double weight;

  Plate(this.weight);
}

class Barbell {
  double maxLoad;
  List<Plate> left = [];
  List<Plate> right = [];

  Barbell(this.maxLoad);

  double get totalWeight {
    return left.fold(0.0, (s, p) {
      return s + p.weight;
    }) +
        right.fold(0.0, (s, p) {
          return s + p.weight;
        });
  }

  void addLeft(Plate plate) {
    if ((totalWeight + plate.weight) <= maxLoad) {
      left.add(plate);
    }
  }

  void addRight(Plate plate) {
    if ((totalWeight + plate.weight) <= maxLoad) {
      right.add(plate);
    }
  }
}

//////////////////////
class CurrencyConverter {
  static double convert(double amount, double rate) {
    return amount * rate;
  }
}

///////////////////////
class Garage<T> {
  List<T> items = [];

  void add(T item) {
    items.add(item);
  }

  void show() {
    print(items);
  }
}

///////////////////////
class MyNumber {
  double value;

  MyNumber(this.value);

  MyNumber operator +(MyNumber other) {
    return MyNumber(value + other.value);
  }

  MyNumber operator -(MyNumber other) {
    return MyNumber(value - other.value);
  }

  MyNumber operator *(MyNumber other) {
    return MyNumber(value * other.value);
  }

  MyNumber operator /(MyNumber other) {
    return MyNumber(value / other.value);
  }

  @override
  String toString() {
    return value.toString();
  }
}

/////////////////////
enum CarState {
  stop,
  drive,
  turn
}

class Car {
  CarState state = CarState.stop;

  void setState(CarState s) {
    state = s;
    print("State: $state");
  }
}

/////////////////////
abstract class Shape {
  double area();
}

class Rectangle extends Shape {
  double w, h;
  Rectangle(this.w, this.h);

  @override
  double area() {
    return w * h;
  }
}

class Triangle extends Shape {
  double b, h;
  Triangle(this.b, this.h);

  @override
  double area() {
    return 0.5 * b * h;
  }
}

class Circle extends Shape {
  double r;
  Circle(this.r);

  @override
  double area() {
    return pi * r * r;
  }
}

//////////////////////////
class NumberConverter {
  static String convert(int number, int base) {
    return number.toRadixString(base);
  }
}

////////////////////////////
class ShapeManager {
  List<Shape> shapes = [];

  void add(Shape s) {
    shapes.add(s);
  }

  Shape? maxArea() {
    if (shapes.isEmpty) {
      return null;
    }

    shapes.sort((a, b) {
      return b.area().compareTo(a.area());
    });

    return shapes.first;
  }
}

///////////////////////////////
abstract class TableItem {}

class Spoon extends TableItem {}
class Fork extends TableItem {}

class Table {
  List<TableItem> items = [];

  void add(TableItem item) {
    items.add(item);
  }

  void remove() {
    if (items.isNotEmpty) {
      items.removeLast();
    }
  }
}

/////////////////////////////////
void main() {
  while (true) {
    print("\n1 - Mug");
    print("2 - Wardrobe");
    print("3 - Barbell");
    print("4 - Currency");
    print("5 - Garage");
    print("6 - Operators");
    print("7 - Car");
    print("8 - Shapes");
    print("9 - Systems (Base conversion)");
    print("10 - Max Area");
    print("11 - Table");
    print("0 - Exit");
    print("Your choice: ");

    var input = stdin.readLineSync();

    switch (input) {
      case "1":
        var mug = Mug(1.0);
        var human = Human("Someone");
        human.drinkFrom(mug, 0.3);
        break;

      case "2":
        var wardrobe = Wardrobe([Storage()]);
        wardrobe.putItem("Something");
        wardrobe.takeItem();
        break;

      case "3":
        var bar = Barbell(100);
        bar.addLeft(Plate(10));
        bar.addRight(Plate(10));

        print("Total Weight: ${bar.totalWeight}");
        break;

      case "4":
        print("Converted amount: ${CurrencyConverter.convert(100, 0.9)}");
        break;

      case "5":
        var garage = Garage<String>();
        garage.add("Some car");
        garage.show();
        break;

      case "6":
        var a = MyNumber(10);
        var b = MyNumber(5);

        print("Addition result: ${a + b}");
        break;

      case "7":
        var car = Car();
        car.setState(CarState.drive);
        break;

      case "8":
        var c = Circle(2);
        print("Circle area: ${c.area()}");
        break;

      case "9":
        print("Hexadecimal result: ${NumberConverter.convert(255, 16)}");
        break;

      case "10":
        var manager = ShapeManager();
        manager.add(Circle(2));
        manager.add(Rectangle(2, 3));

        print("Max area found: ${manager.maxArea()?.area()}");
        break;

      case "11":
        var table = Table();
        table.add(Spoon());
        table.add(Fork());

        print("Items on table: ${table.items.length}");
        break;

      case "0":
        print("Exiting...");
        return;

      default:
        print("Invalid choice, try again");
    }
  }
}
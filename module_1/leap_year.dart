import 'dart:io';

void main() {
  print("Enter a year:");
  int year = int.parse(stdin.readLineSync());

  if (year % 400 == 0) {
    print(" Leap Year");
  } else {
    if (year % 100 == 0) {
      print("Not a Leap Year");
    } else {
      if (year % 4 == 0) {
        print("Leap Year");
      } else {
        print("Not a Leap Year");
      }
    }
  }
}

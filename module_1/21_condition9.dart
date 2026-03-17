import 'dart:io';

void main()
{

  print("Enter First Number :");
  var a=int.parse(stdin.readLineSync().toString());

  print("Enter Second Number :");
  var b=int.parse(stdin.readLineSync().toString());

  print("addition = 1");
  print("Subtraction = 2");
  print("Multiplication = 3");
  print("Deviation = 4");
  print("Enter your choice");
  int choice = int.parse(stdin.readLineSync().toString());
switch(choice){
  case 1:print(a+b);
  case 2:print(a-b);
  case 3:print(a*b);
  case 4:print(a/b);
  default:print("Invalid choice");
}
}
import 'dart:io';

void main()
{
  print("Enter First Number :");
  var a=int.parse(stdin.readLineSync().toString());

  print("Enter Second Number :");
  var b=int.parse(stdin.readLineSync().toString());

  print(a+b);
  print(a-b);
  print(a*b);
  print(a/b);
}
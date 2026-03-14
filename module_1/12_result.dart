import 'dart:io';

void main()
{
  print("Subject 1:");
  var a = int.parse(stdin.readLineSync().toString());

  print("Subject 2:");
  var b = int.parse(stdin.readLineSync().toString());

  print("Subject 3:");
  var c = int.parse(stdin.readLineSync().toString());

  print("Subject 4:");
  var d = int.parse(stdin.readLineSync().toString());

  print("Subject 5:");
  var e = int.parse(stdin.readLineSync().toString());

  var r = (a+b+c+d+e)/5;
  print(r);
}
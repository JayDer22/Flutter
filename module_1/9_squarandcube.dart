import 'dart:io';

void main()
{
  print("Enter Number for square :");
  var a=int.parse(stdin.readLineSync().toString());
  var s=a*a;
  print("Enter Number for cube :");
  var b=int.parse(stdin.readLineSync().toString());
  var c=b*b*b;

  print(s);
  print(c);
}


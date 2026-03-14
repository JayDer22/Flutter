import 'dart:io';

void main()
{
  print("Enter P :");
  var p = int.parse(stdin.readLineSync().toString());

  print("Enter R :");
  var r = int.parse(stdin.readLineSync().toString());

  print("Enter N :");
  var n = int.parse(stdin.readLineSync().toString());

  var i = (p*r*n)/100;

  print(i);

}
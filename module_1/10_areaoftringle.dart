import 'dart:io';

void main()
{
  var T = 0.5;

  print("Enter a :");
  var a = int.parse(stdin.readLineSync().toString());

  print("Enter b :");
  var b = int.parse(stdin.readLineSync().toString());
  var ans = T*a*b;
  print(ans);
}
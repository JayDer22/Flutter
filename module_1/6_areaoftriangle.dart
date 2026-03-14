import 'dart:io';

void main()
{
  var PI = 3.14;

  print("Enter Your Radius");
  var r = int.parse(stdin.readLineSync().toString());
   var ans = PI*r*r;
   print(ans);
}
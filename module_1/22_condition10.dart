import 'dart:io';

void main()
{
  //tringle 0.5*base*height
  //length*wigth
  //PI*r*r

  print("Tringle 1");
  print("Rectangle 2");
  print("Circle 3");
  print("Enter choice :");
  var choice = int.parse(stdin.readLineSync().toString());
  switch(choice)
      {
    case 1:
      print("Enter Base :");
      var b = int.parse(stdin.readLineSync().toString());
      print("Enter Height");
      var h =int.parse(stdin.readLineSync().toString());

      var t = 0.5*b*h;
      print(t);
      break;
    case 2:
      print("Enter Length");
      var l = int.parse(stdin.readLineSync().toString());
      print("Enter Width");
      var w = int.parse(stdin.readLineSync().toString());

      var r = l * w;
      print(r);
      break;
    case 3:
      var PI=3.14;
      print("Enter r");
      var r = int.parse(stdin.readLineSync().toString());

      var c=PI*r*r;
      print(c);
  }
}
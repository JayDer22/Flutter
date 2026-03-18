import 'dart:io';

void main()
{

  print("Enter Year");
  int year = int.parse(stdin.readLineSync().toString());
  if(year % 4 == 0)
    {
      print("leep year");
    }
  else
    {
      print("not a leep year");
    }
}
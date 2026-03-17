import 'dart:io';

void  main()
{
  int num;
  print("Enter number");
  num = int.parse(stdin.readLineSync().toString());

  switch(num)
  {
    case 1:print("English");
    case 2:print("Hindi");
    case 3:print("Gujarati");
    default:print("wrong number");
  }
}
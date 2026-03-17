import 'dart:io';

void  main()
{
  int num;
  print("Enter number :");
  num = int.parse(stdin.readLineSync().toString());

  switch(num)
  {
    case 1:print("Monday");
    case 2:print("Tuesday");
    case 3:print("Wednesday");
    case 4:print("Thursday");
    case 5:print("Friday");
    case 6:print("Saturday");
    case 7:print("Sunday");
    default:print("wrong num");
  }
}
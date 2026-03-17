import 'dart:io';

void main()
{
  int age;
  print("Enter your age");
  age = int.parse(stdin.readLineSync().toString());
  if(age>=18)
    {
      print("Eligible for vote");
    }
  else
    {
      print("Not Eligible for vote");
    }
}


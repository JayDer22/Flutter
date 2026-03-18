import 'dart:io';

void main()
{

  print("Enter Number");
  int num = int.parse(stdin.readLineSync().toString());
  if(num % 2 == 0)
  {
    print("Number is not prime");
  }
  else
  {
    print("Number is prime");
  }
}
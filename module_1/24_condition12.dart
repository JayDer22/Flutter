import 'dart:io';

void main()
{

  print("Enter Number");
  int num = int.parse(stdin.readLineSync().toString());
  if(num % 2 == 0)
  {
    print("Number is even");
  }
  else
  {
    print("Number is odd");
  }
}
import 'dart:io';

void main()
{
  int res = 0;

  print("Enter a num :");
  var num = int.parse(stdin.readLineSync().toString());

  while(num>0)
  {
    int digit = num%10;
    res=res*10+digit;
    num=num ~/ 10;
  }
  print("revers digits: $res");
}
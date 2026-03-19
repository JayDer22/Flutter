import 'dart:io';

void main()
{
  int count = 0;
  print("Enter any number");
  var num = int.parse(stdin.readLineSync().toString());

  for(int i=1;i<=num;i++)
  {
    if(num%i==0)
    {
      count++;
    }
  }
  if(count>2)
    {
      print("Not prime");
    }
  else
    {
      print("Prime");
    }
}
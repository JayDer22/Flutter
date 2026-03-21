import 'dart:io';

void main()
{
  int res = 1;

  print("Enter a num :");
  var num = int.parse(stdin.readLineSync().toString());
for(int i = num;i >= 1;i--)
  {
    res=res*i;

  }
  print("revers digits: $res");
}
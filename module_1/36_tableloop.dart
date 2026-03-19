import 'dart:io';


void main()
{
  print("Enter a number :");
  var n = int.parse(stdin.readLineSync().toString());
  for(int i=1;i<=10;i++)
    {
       var ans=n*i;
      print("$n * $i = $ans");
    }
}
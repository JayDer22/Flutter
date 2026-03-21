import 'dart:io';
void main()
{
   int fdigit = 0;
   int ldigit = 0;

   print("Enter any number :");
   int num = int.parse(stdin.readLineSync().toString());
   ldigit = num % 10;
   while(num>0)
  {
    if(num>9)
    {
      num = num ~/ 10;
    }
    else
      {
        fdigit = num;
        num=num ~/ 10;
      }
  }
  int ans = fdigit+ldigit;
   print("first and last digit sum : $ans");
}
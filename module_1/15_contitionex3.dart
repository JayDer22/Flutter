import 'dart:io';

void main()
{
  int marks;
  print("Enter your marks :");
  marks = int.parse(stdin.readLineSync().toString());

  if(marks>=70)
    {
      print("Grade A");
    }
  else if(marks>=60)
    {
      print("Grade B");
    }
  else if(marks>=50)
    {
      print("Grade C");
    }
  else if(marks>=40)
    {
      print("Grade D");
    }
  else
    {
      print("Fail");

    }
}
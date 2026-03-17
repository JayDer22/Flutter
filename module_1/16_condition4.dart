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
   if(marks>=60)
  {
    print("Grade B");
  }
   if(marks>=50)
  {
    print("Grade C");
  }
   if(marks>=40)
  {
    print("Grade D");
  }
  else
  {
    print("Fail");

  }
}
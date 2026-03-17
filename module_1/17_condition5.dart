import 'dart:io';

void main()
{
  String uname = "jay";
  String pass = "1234";

  print("Enter Username :");
  var un = stdin.readLineSync().toString();
  print("Enter Password");
  var ps = stdin.readLineSync().toString();

  if(un==uname)
    {
    print("Username is correct");
    }
  if (ps==pass)
    {
      print("Password is correct");
    }

}
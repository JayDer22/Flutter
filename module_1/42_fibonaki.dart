import 'dart:io';

void main() {
  var n = 10;
  var a = 0;
  var b = 1;
print(a);
  print(b);
  for (int i = 2; i < n; i++) {
    int c = a + b;
    print(c);
    a=b;
    b=c;

  }
}
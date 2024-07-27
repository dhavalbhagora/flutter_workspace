import 'dart:io';
void main() {
  print("enter the first value");
  int a = int.parse(stdin.readLineSync().toString());

  print("enter the second value");
  int b = int.parse(stdin.readLineSync().toString());

  print("enter the third value");
  int c = int.parse(stdin.readLineSync().toString());

  // Using ternary operator to find the maximum of three numbers
  int max = (a > b) ? ((a > c) ? a : c) : ((b > c) ? b : c);

  print('The maximum number among $a, $b, and $c is: $max');
}
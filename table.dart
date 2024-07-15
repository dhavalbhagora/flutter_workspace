import 'dart:io';

void main() {
  print("Enter the number to print its multiplication table: ");
  int number = int.parse(stdin.readLineSync().toString());

  
  for (int i = 1; i <= 10; i++) {
    print("$number x $i = ${number * i}");
  }
}
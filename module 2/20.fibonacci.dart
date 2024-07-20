import 'dart:io';

void main() {
  stdout.write("Enter the number of terms in Fibonacci series: ");
  int n = int.parse(stdin.readLineSync().toString());

  print("Fibonacci Series:");
  int first = 0, second = 1, next;

  for (int i = 0; i < n; i++) {
    if (i <= 1) {
      next = i;
    } else {
      next = first + second;
      first = second;
      second = next;
    }
    print(next);
  }
}
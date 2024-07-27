import 'dart:io';

void main() {
  print("enter your number");
  int num = int.parse(stdin.readLineSync().toString());
  int fact=1;
 for(int i=num;i>=1;i--){
    fact= fact*i;

 }
 print(fact);
}
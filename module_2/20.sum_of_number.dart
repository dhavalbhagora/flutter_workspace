import 'dart:io';

void main(){

  print("enter a number for sum = ");
  int num = int.parse(stdin.readLineSync().toString());

  int sum = 0;

  while(num>0){
    sum +=num%10;
    num = num~/10;

  }

  print("sum of number is $sum");
} 
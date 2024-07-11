import 'dart:io';

void main(){
  print("enter the frist number = ");
  var num1 = int.parse(stdin.readLineSync().toString());

  print("enter the second number = ");
  var num2 = int.parse(stdin.readLineSync().toString());

  print("before the swap \nnum1 = $num1 \n num2 = $num2");

  num1 = num1+num2;
  num2 = num1-num2;
  num1 = num1-num2;

  print("after the swap \nnum1 = $num1 \n num2 = $num2");
}
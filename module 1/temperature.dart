import 'dart:io';

void main(){
  print("enter the temperature= ");
  var temp = int.parse(stdin.readLineSync().toString());

  var fan = ((temp*9)/5)+32;

  print("Fahrenheit = $fan");
}
import 'dart:io';

void main(){
  print("enter the value = ");
  var a = int.parse(stdin.readLineSync().toString());

  var square = a*a;

  print("square of value = $square");

}
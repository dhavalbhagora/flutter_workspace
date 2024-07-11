import 'dart:io';

void  main(){
  print("enter the lenght of triangle in cm = ");
  var a = int.parse(stdin.readLineSync().toString());

  var cube = a*a*a;

  print("value of cube = $cube");

}
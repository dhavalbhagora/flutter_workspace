import 'dart:io';

void  main(){
  print("enter the hight of triangle in cm = ");
  var a = int.parse(stdin.readLineSync().toString());

  print("enter the base of triangle in cm = ");
  var b = int.parse(stdin.readLineSync().toString());

  var t= (a*b/2);

  print("area of triangle is = $t cm");

}
import 'dart:io';

void  main(){
  print("enter the radius of circle in cm = ");
  var a = int.parse(stdin.readLineSync().toString());

  var r= 3.14*a*a;

  print("area of circle is = $r cm");

}
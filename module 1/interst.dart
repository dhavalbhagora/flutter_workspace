import 'dart:io';

void main(){
  print("enter the amount= ");
  var a = int.parse(stdin.readLineSync().toString());

  print("enter the intrest rate= ");
  var b = double.parse(stdin.readLineSync().toString());

  print("enter the time in years= ");
  var c = int.parse(stdin.readLineSync().toString());

  var i = (a*b*c)/100;


  print("intrest of $c years is = $i");

}

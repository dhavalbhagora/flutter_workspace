import 'dart:io';

void main(){
  print("enter your first value");
 var a = int.parse(stdin.readLineSync().toString());
  print("enter your second value");
 var b=  int.parse(stdin.readLineSync().toString());

 var c = a+b;
 print("addition is = $c");

  var d = a-b;
  print("substraction is = $d");

  var e = a~/b;

  print("divison = $e");

  var f = a*b;

  print("multiplication = $f");
}
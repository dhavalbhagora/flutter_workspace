import 'dart:io';

void main(){

  print("enter the the 1 sub mark= ");
  var m1 = int.parse(stdin.readLineSync().toString());

  print("enter the the 2 sub mark= ");
  var m2 = int.parse(stdin.readLineSync().toString());

  print("enter the the 3 sub mark= ");
  var m3 = int.parse(stdin.readLineSync().toString());

  print("enter the the 4 sub mark= ");
  var m4 = int.parse(stdin.readLineSync().toString());

  print("enter the the 5 sub mark= ");
  var m5 = int.parse(stdin.readLineSync().toString());
  print("enter the the  total  mark= ");
  var totalmark = int.parse(stdin.readLineSync().toString());

  var total=m1+m2+m3+m4+m5;

  var per= (total/totalmark)*100;

  print("total marks = $total");

  print("percentage = $per");
}

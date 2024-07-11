import 'dart:io';
void main(){

  print("enter your full name");
  var name = stdin.readLineSync();

  print("enter your birthdate");
  var bdate = stdin.readLineSync();

  print("enter your age");
  var age = stdin.readLineSync();

  print("enter your address");
  var address = stdin.readLineSync();

  print("Name = $name");
  print("Birthdate = $bdate");
  print("Age = $age");
  print("Address = $address");
  
}
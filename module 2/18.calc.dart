import 'dart:io';

void main(){
  print("enter the first value = ");
  int num1 = int.parse(stdin.readLineSync().toString());



  print("Enter 1 for addition");
  print("Enter 2 for subtraction");
  print("Enter 3 for multiplication");
  print("Enter 4 for Division");

  print("enter your choice");
  int ch = int.parse(stdin.readLineSync().toString());

  print("enter the second value = ");
  int num2 = int.parse(stdin.readLineSync().toString());

  switch(ch){
    case 1 :
      var c = num1+num2;
      print("addition is $c");
      break;

    case 2 :
      var c = num1-num2;
      print("subtraction is $c");
      break;

    case 3 :
      var c = num1*num2;
      print("multiplication is $c");
      break;
    case 4 :
      var c = num1/num2;
      print("Division is $c");
      break;
  }

}

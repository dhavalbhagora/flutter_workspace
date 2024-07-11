import 'dart:io';

void main(){
  print("enter the number =  ");
  var num = int.parse(stdin.readLineSync().toString());

  if(num>0){
    print("Number is positive ");

  }
  else if(num == 0){
    print("number is 0");
  }
  else{
    print("number is negative");
  }
}
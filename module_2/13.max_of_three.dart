import 'dart:io';

void main(){
print("enter the first value");
int num1 = int.parse(stdin.readLineSync().toString());

print("enter the second value");
int num2 = int.parse(stdin.readLineSync().toString());

print("enter the third value");
int num3 = int.parse(stdin.readLineSync().toString());

if(num1>num2) {
  if (num1 > num3) {
      print("$num1 is maximum of three");
  }
  else {
    print("$num3 is maximum of three");
  }
}
else
  {
    if(num2>num3){
      print("$num2 is maximum of three");

    }
    else
      {
        print("$num3 is maximum of three");
      }
  }
}
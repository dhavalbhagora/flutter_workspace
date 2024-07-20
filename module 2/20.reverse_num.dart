import 'dart:io';

void main(){
  print("Enter a number = ");
  int num = int.parse(stdin.readLineSync().toString());
  int rev= 0;
  int rem;
  while(num != 0){
    rem = num%10;
    rev = rev*10+rem;
    num= num~/10;
  }

  print(rev);
}
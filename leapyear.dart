import 'dart:io';

void main(){
  print("enter the year");
  int year = int.parse(stdin.readLineSync().toString());

  if (year % 4 == 0) {
    if (year % 100 == 0) {
      if (year % 400 == 0) {
        print("year is leapyear");
      } else {
        print("year is not leapyear");      }
    } else {
      print("year is leapyear");
    }
  } else {
    print("year is not  leapyear");
  }
}
import 'dart:io';
void main(){
     int totalmark= 500;

     print("-----enter your marks from 100-----");

    print("enter a 1st subject marks = ");
    int mark1=int.parse(stdin.readLineSync().toString());

    print("enter a 2nd subject marks = ");
    int mark2=int.parse(stdin.readLineSync().toString());

    print("enter a 3rd subject marks = ");
    int mark3=int.parse(stdin.readLineSync().toString());

    print("enter a 4th subject marks = ");
    int mark4=int.parse(stdin.readLineSync().toString());

    print("enter a 5th subject marks = ");
    int mark5=int.parse(stdin.readLineSync().toString());

    int total= mark1 + mark2 + mark3 + mark4 + mark5;

    var per = (total/totalmark)*100;

    print("Your percentage is $per");

    if(per>75){
      print("pass with distinction");
    }
    else if(per>60 && per<=75){
      print("pass with first class");

    }
    else if(per>50 && per<=60){
      print("pass with second class");

    }
    else if(per>35 && per<=50){
      print("pass with pass class");
    }
    else{
      print("you are fail in exam");

    }
}
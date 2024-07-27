import 'dart:io';

void main(){
    print("enter 1 for triangle area = ");
    print("enter 2 for circle area = ");
    print("enter 3 for rectangle area = ");

    int ch = int.parse(stdin.readLineSync().toString());
    switch(ch){

      case 1:
        print("enter the height of triangle in cm = ");
        var a = int.parse(stdin.readLineSync().toString());

        print("enter the base of triangle in cm = ");
        var b = int.parse(stdin.readLineSync().toString());

        var t= (a*b/2);

        print("area of triangle is = $t cm");
        break;
      case 2:
        print("enter the radius of circle in cm = ");
        var a = int.parse(stdin.readLineSync().toString());

        var r= 3.14*a*a;

        print("area of circle is = $r cm");
        break;
      case 3:
        print("enter the height of rectangle in cm = ");
        var a = int.parse(stdin.readLineSync().toString());

        print("enter the base of rectangle in cm = ");
        var b = int.parse(stdin.readLineSync().toString());

        var lb= a*b;

        print("area of rectangle is = $lb cm");

        break;
      default:
        print("----- wrong input -----");

    }
}
import 'dart:io';
void main() {
  int count=1;
  for (int i = 1; i <= 5; i++) {

    for (int j = 1; j <= i; j++) {
      if(j%2==1){
        stdout.write("1 ");
      }
      else
        {
          stdout.write("0 ");
        }
    }
    print('');

  }
}


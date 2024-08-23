void main()
{
  List<int> numbersList = [10,20,30,40,50,60];
  print("****************************************");
  for(int data in numbersList)
  {
    print(data);
  }
  print("****************************************");
numbersList.add(70);

  for(int data in numbersList)
  {
    print(data);
  }
  numbersList.removeAt(2);
  print("****************************************");
  for(int data in numbersList)
  {
    print(data);
  }



}
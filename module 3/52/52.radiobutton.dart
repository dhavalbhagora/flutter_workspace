import 'package:flutter/material.dart';

class radiobutton extends StatefulWidget {
  const radiobutton({super.key});

  @override
  State<radiobutton> createState() => _radiobutton();
}

enum Operation { add, subtract, multiply, divide }

class _radiobutton extends State<radiobutton> {
  double? num1, num2;

  String result = " ";

  Operation selectoperation = Operation.add;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Radio Calculator",
        ),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: new EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Enter First Number',
                    hintText: "First Number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      num1 = double.tryParse(value)!;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Enter Second Number',
                    hintText: "Second Number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      num2 = double.tryParse(value)!;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                RadioListTile<Operation>(
                  title: const Text('Addition(+)'),
                  value: Operation.add,
                  groupValue: selectoperation,
                  onChanged: (Operation? value) {
                    setState(() {
                      selectoperation = value!;
                    });
                  },
                ),
                RadioListTile<Operation>(
                  title: const Text('Subtraction(-)'),
                  value: Operation.subtract,
                  groupValue: selectoperation,
                  onChanged: (Operation? value) {
                    setState(() {
                      selectoperation = value!;
                    });
                  },
                ),
                RadioListTile<Operation>(
                  title: const Text('Multiplication(*)'),
                  value: Operation.multiply,
                  groupValue: selectoperation,
                  onChanged: (Operation? value) {
                    setState(() {
                      selectoperation = value!;
                    });
                  },
                ),
                RadioListTile<Operation>(
                  title: const Text('Division(/)'),
                  value: Operation.divide,
                  groupValue: selectoperation,
                  onChanged: (Operation? value) {
                    setState(() {
                      selectoperation = value!;
                    });
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: calculateResult,
                  child: Text('Calculate'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Answer: $result',
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void calculateResult() {
    if (num1 == null || num2 == null) {
      setState(() {
        result = 'Please enter both numbers';
      });
      return;
    }
    double calcResult;

    switch (selectoperation) {
      case Operation.add:
        calcResult = num1! + num2!;
        break;
      case Operation.subtract:
        calcResult = num1! - num2!;
        break;
      case Operation.multiply:
        calcResult = num1! * num2!;
        break;
      case Operation.divide:
        if (num2 == 0) {
          setState(() {
            result = 'Cannot divide by zero';
          });
          return;
        }
        calcResult = num1! / num2!;
        break;
    }
    setState(() {
      result = calcResult.toString();
    });
  }
}

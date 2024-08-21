import 'package:flutter/material.dart';

class module_3_1_2 extends StatefulWidget {
  const module_3_1_2({super.key});

  @override
  State<module_3_1_2> createState() => _module_3_1_2State();
}

class _module_3_1_2State extends State<module_3_1_2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Image.network(
                "https://raw.githubusercontent.com/flutter/website/main/examples/layout/lakes/step5/images/lake.jpg",
                height: 300),
            Row(),
          ],
        ),
      ),
    );
  }
}

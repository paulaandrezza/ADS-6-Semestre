import 'package:flutter/material.dart';

class Exercise1 extends StatelessWidget {
  const Exercise1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter is Fun!',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: const CustomBox(),
    );
  }
}

class CustomBox extends StatelessWidget {
  const CustomBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 100, top: 100),
      child: Container(
        width: 100,
        height: 100,
        padding: const EdgeInsets.all(10),
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(color: Colors.red),
        child: const Text('Hi Mom 👋', style: TextStyle(color: Colors.black)),
      ),
    );
  }
}

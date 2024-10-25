import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result Page'),
        backgroundColor: Colors.greenAccent,
        elevation: 0, //nak remove shadow
      ),
      body: Container(
        color: Color(0xFF004D00), // Dark green background for the entire page
        child: Center(
          child: Text(
            'CONGARTULATIONS',
            style: TextStyle(fontSize: 24, color: Colors.black),
        ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result Page'),
        backgroundColor: Colors.greenAccent,
        elevation: 0, // Removes shadow
      ),
      body: Container(
        color: const Color(0xFF004D00), // Dark green background for the entire page
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'CONGRATULATIONS!',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Ensures high contrast on dark background
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'You have successfully completed the quiz.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.white70),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Navigates back to the previous screen
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent, // Button color
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: const Text(
                  'Go Back',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

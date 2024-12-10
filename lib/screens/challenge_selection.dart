import 'package:flutter/material.dart';
import 'dart:developer' as developer; // Use this for logging

class ChallengeSelection extends StatefulWidget {
  const ChallengeSelection({super.key});

  @override
  ChallengeSelectionState createState() => ChallengeSelectionState();
}

class ChallengeSelectionState extends State<ChallengeSelection> {
  final List<String> challenges = [
    'Introduction to OOP',
    'Predefined Class',
    'User-defined Class',
    'Array of Objects',
    'Method Pass by Value & Reference',
    'Inheritance & Polymorphism',
    'Exception Handling',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose a Challenge'),
        backgroundColor: Colors.green.shade800,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            developer.log("Back button pressed", name: 'ChallengeSelection');
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          color: Colors.green.shade900, // Dark green background color
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Select a challenge to start:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: challenges.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade300, // Button background color
                          foregroundColor: Colors.black, // Button text color
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0), // Rounded corners
                          ),
                        ),
                        onPressed: () {
                          developer.log(
                            "${challenges[index]} selected",
                            name: 'ChallengeSelection',
                            time: DateTime.now(),
                          );
                          // Navigate to a specific challenge page or display content
                          Navigator.pushNamed(context, "/challenge", arguments: challenges[index]);
                        },
                        child: Text(
                          challenges[index],
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

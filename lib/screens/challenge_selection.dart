import 'package:flutter/material.dart';
import 'dart:developer' as developer;  // Use this for logging


class ChallengeSelection extends StatefulWidget {
  const ChallengeSelection({super.key});

  @override
  ChallengeSelectionState createState() => ChallengeSelectionState(); // Public now
}

class ChallengeSelectionState extends State<ChallengeSelection> {
  final List<String> challenges = [
    'Introduction to OOP',
    'Predefined class',
    'User -defined Class',
    'Array of Object',
    'Method Pass by Value & Reference',
    'Inheritance & Polymorphism',
    'Exception Handling',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose a Challenge'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            developer.log("Back button pressed", name: 'ChallengeSelection');
            // Add back button functionality here, e.g., Navigator.pop()
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
                          padding: EdgeInsets.symmetric(vertical: 20.0),
                        ),
                        onPressed: () {
                          developer.log("${challenges[index]} selected", name: 'ChallengeSelection');
                        },
                        child: Text(
                          challenges[index],
                          style: TextStyle(fontSize: 18),
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
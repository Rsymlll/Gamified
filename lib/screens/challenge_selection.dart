import 'package:flutter/material.dart';
import 'dart:developer' as developer;  // Use this for logging

void main() {
  runApp(MaterialApp(home: ChallengeSelection()));
}

class ChallengeSelection extends StatefulWidget {
  const ChallengeSelection({super.key});

  @override
  ChallengeSelectionState createState() => ChallengeSelectionState(); // Public now
}

class ChallengeSelectionState extends State<ChallengeSelection> { // No underscore
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              const Text(
                "Challenge: Basics",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Description: Solve the following...",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 40),
              Container(
                width: double.infinity,
                height: 400,
                color: Colors.grey[300], // Background color of the code box
                child: const Center(
                  child: Text(
                    "Write your code here...",
                    style: TextStyle(color: Colors.grey, fontSize: 24),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              GestureDetector(
                onTap: () {
                  developer.log("Submit tapped", name: 'ChallengeSelection');
                },
                child: Container(
                  width: double.infinity,
                  height: 100,
                  color: Colors.green,
                  child: const Center(
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      developer.log("Hint tapped", name: 'ChallengeSelection');
                    },
                    child: Container(
                      width: 160,
                      height: 100,
                      color: Colors.orange,
                      child: const Center(
                        child: Text(
                          "Hint",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      developer.log("Reference tapped", name: 'ChallengeSelection');
                    },
                    child: Container(
                      width: 160,
                      height: 100,
                      color: Colors.blue,
                      child: const Center(
                        child: Text(
                          "Reference",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

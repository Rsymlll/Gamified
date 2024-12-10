import 'package:flutter/material.dart';
import 'challenge_selection.dart';

class Dashboard extends StatefulWidget {
  final String userName; // Accepts username as a parameter

  const Dashboard({super.key, required this.userName});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[700],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome, ${widget.userName}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChallengeSelection(),
                  ),
                );
              },
              style: _buttonStyle(),
              child: const Text('Start Challenge (Java)'),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/progress"); // Placeholder route
              },
              style: _buttonStyle(),
              child: const Text('View Progress'),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/feedback"); // Placeholder route
              },
              style: _buttonStyle(),
              child: const Text('Provide Feedback'),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/notes"); // Placeholder route
              },
              style: _buttonStyle(),
              child: const Text('Java Notes'),
            ),
          ],
        ),
      ),
    );
  }

  ButtonStyle _buttonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: Colors.green[400],
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 15,
      ),
      textStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // Rounded corners
      ),
    );
  }
}

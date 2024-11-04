import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
  const Progress({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF90EE90), // Light green background
        borderRadius: BorderRadius.circular(10), // Rounded corners
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Add padding for better spacing
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
          children: [
            Text(
              'Overall Progress',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18, // Increased font size for better visibility
              ),
            ),
            SizedBox(height: 10), // Spacing between title and content
            Text(
              'Challenges Completed: 10',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16, // Consistent font size for content
              ),
            ),
          ],
        ),
      ),
    );
  }
}
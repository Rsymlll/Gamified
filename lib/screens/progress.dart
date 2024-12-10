import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
  final int challengesCompleted;
  final int totalChallenges;

  const Progress({
    super.key,
    this.challengesCompleted = 10, // Default value for demonstration
    this.totalChallenges = 20, // Default total challenges
  });

  @override
  Widget build(BuildContext context) {
    double progress = challengesCompleted / totalChallenges;

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF90EE90), // Light green background
        borderRadius: BorderRadius.circular(10), // Rounded corners
      ),
      padding: const EdgeInsets.all(16.0), // Add padding for better spacing
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Overall Progress',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18, // Increased font size for better visibility
            ),
          ),
          const SizedBox(height: 10), // Spacing between title and content
          Text(
            'Challenges Completed: $challengesCompleted/$totalChallenges',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16, // Consistent font size for content
            ),
          ),
          const SizedBox(height: 10), // Spacing between content and progress bar
          ClipRRect(
            borderRadius: BorderRadius.circular(10), // Rounded corners for progress bar
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.white, // Progress bar background
              color: Colors.green, // Progress bar foreground
              minHeight: 10, // Increase height for better visibility
            ),
          ),
        ],
      ),
    );
  }
}

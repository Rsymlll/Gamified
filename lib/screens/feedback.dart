import 'package:flutter/material.dart';

class FeedbackScreen extends StatelessWidget {
  final TextEditingController feedbackController = TextEditingController();

  FeedbackScreen({super.key}); // Added key parameter

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF003300), // Dark green background color
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Provide Feedback',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: const Color(0xFFE0E0E0), // Light grey background color
                borderRadius: BorderRadius.circular(12), // Rounded corners
              ),
              child: TextField(
                controller: feedbackController,
                maxLines: 10,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter your feedback here...',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (feedbackController.text.isEmpty) {
                  // Show an alert if the feedback is empty
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Error'),
                      content: const Text('Please enter your feedback.'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                } else {
                  // Handle feedback submission logic here
                  // For example, save to a database or send to a server

                  // Clear the text field and show a confirmation
                  feedbackController.clear();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Feedback submitted successfully!')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4CAF50), // Green button color
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Rounded corners for the button
                ),
              ),
              child: const Text(
                'Submit Feedback',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

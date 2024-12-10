import 'package:flutter/material.dart';

class Question extends StatefulWidget {
  const Question({super.key});

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  final List<String> options = ['True', 'False'];
  final String question =
      'Object-Oriented Programming (OOP) is more natural because software objects can represent real-world objects.';
  bool isAnswered = false;
  int correctAnswer = 1; // Correct answer index
  int selectedAnswer = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Question Page'),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.green[100],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "C1 Level 1",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 28),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.green[50],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      question,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 18),
                  Column(
                    children: List.generate(options.length, (index) {
                      return GestureDetector(
                        onTap: !isAnswered
                            ? () {
                                setState(() {
                                  selectedAnswer = index;
                                  isAnswered = true;
                                });
                              }
                            : null,
                        child: Container(
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: isAnswered
                                ? (index == correctAnswer
                                    ? Colors.green
                                    : index == selectedAnswer
                                        ? Colors.red
                                        : Colors.white)
                                : Colors.white,
                            border: Border.all(color: Colors.black38),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                options[index],
                                style: const TextStyle(fontSize: 16),
                              ),
                              if (isAnswered && index == correctAnswer)
                                const Icon(Icons.check, color: Colors.white),
                              if (isAnswered && index == selectedAnswer && index != correctAnswer)
                                const Icon(Icons.close, color: Colors.white),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: const EdgeInsets.all(16),
                child: ElevatedButton(
                  onPressed: isAnswered
                      ? () {
                          Navigator.pushNamed(context, "/result");
                        }
                      : null,
                  child: const Text('Finish'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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

  // State to track if the question has been answered
  bool isAnswer = false;

  // Correct answer index
  int answer = 1; // Assuming 'False' is the correct answer
  int selectedAnswer = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Question Page'),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.green[100]),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Text("C1 Level 1"),
                  const SizedBox(height: 28),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.green[50],
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Text(
                      question,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 18),

                  // Generate list of answer options
                  Column(
                    children: List.generate(options.length, (index) {
                      // If the question hasn't been answered
                      if (!isAnswer) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              isAnswer = true;
                              selectedAnswer = index;
                            });

                            
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black38,
                              ),
                              borderRadius: const BorderRadius.all(Radius.circular(12)),
                            ),
                            child: Text(
                              options[index],
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),
                        );
                      }

                      // If the question has been answered
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: index == answer && selectedAnswer == answer
                              ? Colors.green
                              : Colors.red,
                          border: Border.all(
                            color: Colors.black38,
                          ),
                          borderRadius: const BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Text(
                          options[index],
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 14),
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
                  onPressed: () {
                    // Navigate to the ResultPage when the button is pressed
                    Navigator.pushNamed(
                      context,
                     "/result"
                    );
                  },
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
import 'package:flutter/material.dart';

class Question extends StatefulWidget {
  const Question({super.key});

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  final List options = ['True', 'False'];

  final String question =
      'Object-Oriented Programming (OOP) is more natural because software objects can represent real-world objects.';

  //state dah jawab atau belum?
  bool isAnswer = false;

  //jawapan sebenar dia
  int answer = 1;
  int selectedAnswer = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      decoration: BoxDecoration(color: Colors.green[100]),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Column(
            children: [
              Text("C1 Level 1"),
              const SizedBox(
                height: 28,
              ),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: const BorderRadius.all(Radius.circular(12))),
                child: Text(
                  question,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 18,
              ),

              //Generate list of answer options
              Column(
                children: List.generate(options.length, (index) {
                  //Belum jawab
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
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black38,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        child: Text(
                          options[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    );
                  }

                  // Dah jawab
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color:
                            index == answer && selectedAnswer == answer ? Colors.green : Colors.red,
                        border: Border.all(
                          color: Colors.black38,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Text(
                      options[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                    ),
                  );
                }),
              )
            ],
          ),
          Row()
        ],
      ),
    )));
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class Question {
  //Class Property/Attribute
  String? id; //optional
  String question;
  int answer;
  int nextNode;
  int level;
  List<Option> options;

  //Constructor
  Question(
      {this.id,
      required this.question,
      required this.answer,
      required this.nextNode,
      required this.level,
      required this.options});

  factory Question.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();

    return Question(
        question: data?['question'],
        answer: data?['answer'],
        nextNode: data?['next_node'],
        level: data?['level'],
        options: List.generate(data?['options'].length,
            (index) => Option(value: data?['options'][index])));
  }

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
        question: json['question'],
        answer: json['answer'],
        nextNode: json['next_node'],
        level: json['level'],
        options: List.generate(json['options'].length,
            (index) => Option(value: json['options'][index])));
  }
}

class Option {
  String value;

  Option({required this.value});

  factory Option.fromJson(String option) {
    return Option(value: option);
  }
}

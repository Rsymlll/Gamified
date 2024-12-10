import 'package:cloud_firestore/cloud_firestore.dart';

class Question {
  String? id; // Optional
  String question;
  int answer;
  int nextNode;
  int level;
  List<Option> options;

  Question({
    this.id,
    required this.question,
    required this.answer,
    required this.nextNode,
    required this.level,
    required this.options,
  });

  // Factory constructor to create a Question object from Firestore
  factory Question.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    if (data == null) {
      throw Exception("Error: Document is null");
    }

    return Question(
      question: data['question'] ?? '', // Default empty string if null
      answer: data['answer'] ?? 0, // Default to 0 if null
      nextNode: data['next_node'] ?? 0, // Default to 0 if null
      level: data['level'] ?? 0, // Default to 0 if null
      options: (data['options'] as List<dynamic>? ?? []).map((opt) => Option.fromJson(opt)).toList(),
    );
  }

  // Factory constructor to create a Question object from JSON
  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      question: json['question'] ?? '',
      answer: json['answer'] ?? 0,
      nextNode: json['next_node'] ?? 0,
      level: json['level'] ?? 0,
      options: (json['options'] as List<dynamic>? ?? []).map((opt) => Option.fromJson(opt)).toList(),
    );
  }
}

class Option {
  String value;

  Option({required this.value});

  // Factory constructor to create Option from a string (when the option is a string)
  factory Option.fromJson(dynamic option) {
    return Option(value: option as String);
  }
}

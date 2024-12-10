import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:example/models/question.dart';

class Chapter {
  String? id;
  String name;
  List<Question> questions;

  Chapter({
    this.id,
    required this.name,
    required this.questions,
  });

  /// Factory constructor to create a `Chapter` object from Firestore data.
  factory Chapter.fromFireStore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();

    return Chapter.fromJson(data ?? {});  // Reusing the fromJson constructor
  }

  /// Factory constructor to create a `Chapter` object from JSON.
  factory Chapter.fromJson(Map<String, dynamic> json) {
    return Chapter(
      id: json['id'] as String?,
      name: json['name'] as String? ?? '',
      questions: (json['questions'] as List<dynamic>?)
              ?.map((item) => Question.fromJson(item))
              .toList() ??
          [],  // Empty list if no questions are found
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionCrud {
  final FirebaseFirestore db;

  QuestionCrud() : db = FirebaseFirestore.instance;

  // Helper method to fetch and map documents
  Future<List<T>> _getDocuments<T>(
      Query query, T Function(Map<String, dynamic>) fromJson) async {
    List<T> list = [];
    try {
      QuerySnapshot snapshot = await query.get();
      list = snapshot.docs
          .map((doc) => fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print("Error fetching documents: $e");
    }
    return list;
  }

  // Get Challenges
  Future<List<Challenge>> getChallenges() async {
    final challengesRef = db.collection("challenges");
    return await _getDocuments<Challenge>(
        challengesRef, (data) => Challenge.fromJson(data));
  }

  // Get Chapters for a specific challenge
  Future<List<Chapter>> getChapters(String challengeId) async {
    final chaptersRef =
        db.collection("challenges").doc(challengeId).collection("chapters");
    return await _getDocuments<Chapter>(
        chaptersRef, (data) => Chapter.fromJson(data));
  }

  // Get Questions for a specific chapter
  Future<List<Question>> getQuestions(
      String challengeId, String chapterId) async {
    final questionsRef = db
        .collection("challenges")
        .doc(challengeId)
        .collection("chapters")
        .doc(chapterId)
        .collection("questions");
    return await _getDocuments<Question>(
        questionsRef, (data) => Question.fromJson(data));
  }
}

// Assuming your model classes have a `fromJson` factory constructor
class Challenge {
  final String id;
  final String name;

  Challenge({required this.id, required this.name});

  factory Challenge.fromJson(Map<String, dynamic> json) {
    return Challenge(
      id: json['id'] as String,
      name: json['name'] as String,
    );
  }
}

class Chapter {
  final String id;
  final String title;

  Chapter({required this.id, required this.title});

  factory Chapter.fromJson(Map<String, dynamic> json) {
    return Chapter(
      id: json['id'] as String,
      title: json['title'] as String,
    );
  }
}

class Question {
  final String id;
  final String text;

  Question({required this.id, required this.text});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'] as String,
      text: json['text'] as String,
    );
  }
}

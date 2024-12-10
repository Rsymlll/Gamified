import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class Insert {
  // Static method to initialize and insert data into Firestore
  static Future<void> initData() async {
    final db = FirebaseFirestore.instance;

    try {
      // Load the JSON data from the assets
      final String jsonString = await rootBundle.loadString('assets/providers/data/question.json');
      final Map<String, dynamic> quizData = json.decode(jsonString);

      // Call the insert function
      await insertQuizData(db, quizData);
      print("Data added successfully!");
    } catch (e) {
      print("Error loading or inserting data: $e");
    }
  }

  // Function to insert data into Firebase Firestore
  static Future<void> insertQuizData(
      FirebaseFirestore db, Map<String, dynamic> quizData) async {
    // Reference to the 'quiz' collection in Firestore
    CollectionReference quizCollection = db.collection('quiz');

    try {
      // Insert the quiz data under the 'Introduction_to_OOP' document
      await quizCollection.doc('Introduction_to_OOP').set(quizData);
      print("Data added successfully!");
    } catch (e) {
      print("Error adding data: $e");
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class Insert {
  // Static method to initialize and insert data into Firestore
  static initData() async {
    final db = FirebaseFirestore.instance;

    // Load the JSON data from the assets
    final String jsonString = await rootBundle.loadString('assets/providers/data/question.json');
    final Map<String, dynamic> quizData = json.decode(jsonString);

    // Function to insert data into Firebase Firestore
    Future<void> insertQuizData() async {
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

    // Call the function to insert data
    await insertQuizData();
  }
}

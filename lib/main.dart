import 'package:example/screens/challenge_selection.dart';
import 'package:example/screens/dashboard.dart';
import 'package:example/screens/feedback.dart';
import 'package:example/screens/login.dart';
import 'package:example/screens/progress.dart';
import 'package:example/screens/question.dart';
import 'package:example/screens/result.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        //home
        "/": (context) => const Login(),
        "/dashboard": (context) => const Dashboard(),
        "/question": (context) => const Question(),
        "/result": (context) => const Result(),
        "/selection" : (context) => const ChallengeSelection(),
        "/progress" : (context) => const Progress(),
        "/feedback": (context) => const FeedbackScreen()

      },
    );
  }
}
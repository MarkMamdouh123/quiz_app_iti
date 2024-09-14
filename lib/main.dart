import 'package:flutter/material.dart';
import 'package:quiz_app_iti/views/congratulation_page.dart';
import 'package:quiz_app_iti/views/home_page.dart';
import 'package:quiz_app_iti/views/quiz_page.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        QuizPage.routeName: (context) => QuizPage(),
        CongratulationPage.routeName: (context) => CongratulationPage(),
      },
    );
  }
}

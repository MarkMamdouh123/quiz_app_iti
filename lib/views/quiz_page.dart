import 'package:flutter/material.dart';
import 'package:quiz_app_iti/views/congratulation_page.dart';
import 'package:quiz_app_iti/widgets/answer_text_widget.dart';

import '../models/question_and_answers_model.dart';
import '../widgets/custom_elevated_button.dart';

class QuizPage extends StatefulWidget {
  static const routeName = 'quizPage';

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late List<QuestionAndAnswersModel> questionsAndAnswers;
  int totalQuestions = 5;
  int index = 0;
  int result = 0;
  bool isClickable = true;
  String? selectedAnswer;
  String? correctAnswer;
  bool showCorrectAnswer = false;

  @override
  void initState() {
    List<String> correctAnswers = [
      'Bruce Wayne',
      "Gordon",
      "Alfred",
      "Harvey Dent",
      'Joker'
    ];

    questionsAndAnswers = [
      QuestionAndAnswersModel(
        question: "Who is Batman True Identity?",
        correctAnswer: '${correctAnswers[0]}',
        answers: [
          'Harvey Dent',
          'Jason Todd',
          '${correctAnswers[0]}',
          'Clark Kent',
        ],
      ),
      QuestionAndAnswersModel(
        correctAnswer: '${correctAnswers[1]}',
        answers: ['Joker', 'Penguin', 'ClayFace', '${correctAnswers[1]}'],
        question: "Who is Batman Ally from the Following?",
      ),
      QuestionAndAnswersModel(
        correctAnswer: '${correctAnswers[2]}',
        answers: [
          'Vicky Vale',
          '${correctAnswers[2]}',
          'Hill',
          'Riddler',
        ],
        question: "Who is Batman Butler?",
      ),
      QuestionAndAnswersModel(
        correctAnswer: '${correctAnswers[3]}',
        answers: [
          'Oswald CobblePot',
          'Jack',
          'Jason',
          '${correctAnswers[3]}',
        ],
        question: "Who is the true name of Two Face?",
      ),
      QuestionAndAnswersModel(
        correctAnswer: '${correctAnswers[4]}',
        answers: [
          '${correctAnswers[4]}',
          'Alfred',
          'Selina',
          'Penguin',
        ],
        question: "Who is Batman's famous enemy?",
      ),
    ];

    super.initState();
  }

  void handleAnswerSelection(String answer) {
    if (isClickable) {
      setState(() {
        isClickable = false;
        selectedAnswer = answer;
        correctAnswer = questionsAndAnswers[index].correctAnswer;
        showCorrectAnswer = answer != correctAnswer;
        if (answer == correctAnswer) {
          result++;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String name = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
            'QUIZ',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 28, color: Colors.white),
          ),
        ),
        backgroundColor: Color(0xff86948F),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage(
              'assets/images/Ellipse 1.png',
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            margin: EdgeInsets.symmetric(horizontal: 28),
            decoration: BoxDecoration(
              color: Color(0xffB8E893),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Spacer(),
                    Text(
                      '${index + 1} / $totalQuestions',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                Text(
                  questionsAndAnswers[index].question,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 9),
                  child: AnswerTextWidget(
                    text: questionsAndAnswers[index].answers[0],
                    correctAnswer: questionsAndAnswers[index].correctAnswer,
                    isSelected:
                        questionsAndAnswers[index].answers[0] == selectedAnswer,
                    showCorrectAnswer: showCorrectAnswer,
                    isClickable: isClickable,
                    onTap: () => handleAnswerSelection(
                        questionsAndAnswers[index].answers[0]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 9),
                  child: AnswerTextWidget(
                    text: questionsAndAnswers[index].answers[1],
                    correctAnswer: questionsAndAnswers[index].correctAnswer,
                    isSelected:
                        questionsAndAnswers[index].answers[1] == selectedAnswer,
                    showCorrectAnswer: showCorrectAnswer,
                    isClickable: isClickable,
                    onTap: () => handleAnswerSelection(
                        questionsAndAnswers[index].answers[1]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 9),
                  child: AnswerTextWidget(
                    text: questionsAndAnswers[index].answers[2],
                    correctAnswer: questionsAndAnswers[index].correctAnswer,
                    isSelected:
                        questionsAndAnswers[index].answers[2] == selectedAnswer,
                    showCorrectAnswer: showCorrectAnswer,
                    isClickable: isClickable,
                    onTap: () => handleAnswerSelection(
                        questionsAndAnswers[index].answers[2]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 9),
                  child: AnswerTextWidget(
                    text: questionsAndAnswers[index].answers[3],
                    correctAnswer: questionsAndAnswers[index].correctAnswer,
                    isSelected:
                        questionsAndAnswers[index].answers[3] == selectedAnswer,
                    showCorrectAnswer: showCorrectAnswer,
                    isClickable: isClickable,
                    onTap: () => handleAnswerSelection(
                        questionsAndAnswers[index].answers[3]),
                  ),
                ),
                Center(
                  child: CustomElevatedButton(
                    textColor: Colors.white,
                    backgroundColor: Color(0xff86948F),
                    text: 'NEXT',
                    onPressed: () {
                      if (selectedAnswer == null) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text(
                                "You can't proceed",
                                style: TextStyle(fontSize: 27),
                              ),
                              content: const Text(
                                "Please Select an Answer",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("OK"),
                                ),
                              ],
                            );
                          },
                        );
                      } else if (index < totalQuestions - 1) {
                        setState(() {
                          index++;
                          isClickable = true;
                          selectedAnswer = null;
                          showCorrectAnswer = false;
                        });
                      } else {
                        Navigator.pushNamed(
                          context,
                          CongratulationPage.routeName,
                          arguments: {
                            'name': name,
                            "result": result,
                            'totalAnswers': totalQuestions
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

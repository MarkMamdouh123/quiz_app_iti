import 'package:flutter/material.dart';
import 'package:quiz_app_iti/views/home_page.dart';
import 'package:quiz_app_iti/widgets/custom_box.dart';

class CongratulationPage extends StatelessWidget {
  static const routeName = 'congratsPage';

  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    String name = arguments['name'];
    int result = arguments['result'];
    int totalAnswers = arguments['totalAnswers'];
    return Scaffold(
      backgroundColor: Color(0xff86948F),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: CustomBox(
              width: 290,
              height: 40,
              widget: Text(
                '$result/$totalAnswers',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, HomePage.routeName,
                    arguments: name);
              },
              text: 'Hello $name Your Score is',
              headerText: result != 0
                  ? 'CONGRATULATIONS!!!!'
                  : "Sorry You can always try again );",
              buttonText: 'FINISH',
              topPositionOfHeader: -24,
              headerTextFontSize: 18,
              rightPositionOfHeader: 30,
            ),
          ),
        ],
      ),
      //MarkMamdouh
    );
  }
}

import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
              'assets/quiz-logo.png',
              width: 300,
              color: Colors.white,
          ),
          const SizedBox(height: 30),
          const Text(
              "Learn Flutter the fun way!",
              style: TextStyle(
                fontSize: 25,
                color: Colors.white
              ),
          ),
          const SizedBox(height: 30),
          MaterialButton(
              onPressed: startQuiz,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.arrow_circle_right,
                    color: Colors.black,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Start Quizz",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  )
                ],
              )

          )
          
        ],
      ),
    );
  }
}

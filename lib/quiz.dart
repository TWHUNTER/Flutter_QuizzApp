import 'package:flutter/material.dart';
import 'package:semana5_quizz/app_screens/questions.dart';
import 'package:semana5_quizz/app_screens/results.dart';
import 'package:semana5_quizz/app_screens/start.dart';
import 'package:semana5_quizz/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String>selectedAnswers = [];
  
  var activeScreen = 'start';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions';
    });
  }

  @override
  Widget build(BuildContext context) {

    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions') {
      screenWidget = QuestionsScreen(
          onSelectAnswer: chooseAnswer);
    }

    if (activeScreen == 'results') {
      screenWidget =  ResultsScreen(
        chosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
      );
    }

    // final screenWidget = activeScreen == 'start'
    //     ? StartScreen(switchScreen)
    //     : const QuestionsScreen();
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,  //Esto es para quitar el debug rojo arriba
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors:
                [
                  Color(0xFF56CCF2), // Azul claro
                  Color(0xFF2F80ED),
                ],
              )
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}

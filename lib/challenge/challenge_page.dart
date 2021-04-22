import 'package:devquiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:devquiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:flutter/material.dart';

import 'widgets/next_button/next_button_widget.dart';

class ChallengePage extends StatefulWidget {
  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: QuestionIndicatorWidget(),
      body: QuizWidget(title: 'O que o Flutter faz em sua totalidade?'),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NextButton.white(
                label: 'Pular',
                onTap: () {},
              ),
              SizedBox(width: 7),
              NextButton.green(
                label: 'Confirmar',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

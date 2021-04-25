import 'package:devquiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:devquiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:devquiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:devquiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

import 'challenge_controller.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  final int currentQuestion;
  final int totalQuestions;

  const ChallengePage(
      {required this.questions,
      this.currentQuestion = 0,
      required this.totalQuestions});

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();

  @override
  void initState() {
    pageController.addListener(() {
      controller.currentQuestion = pageController.page!.toInt() + 1;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: ValueListenableBuilder<int>(
          valueListenable: controller.currentQuestionNotifier,
          builder: (context, value, _) => QuestionIndicatorWidget(
            context: context,
            currentQuestion: value == 0 ? 1 : value,
            totalQuestions: widget.totalQuestions,
          ),
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: widget.questions.map((e) => QuizWidget(question: e)).toList(),
      ),
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
                onTap: () {
                  pageController.nextPage(
                      duration: Duration(milliseconds: 100),
                      curve: Curves.linear);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

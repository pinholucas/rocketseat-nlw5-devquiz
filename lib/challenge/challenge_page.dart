import 'package:devquiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:devquiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:devquiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:devquiz/helpers/custom_lock_scroll_physics.dart';
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

  ScrollPhysics questionsScrollPhysics = AlwaysScrollableScrollPhysics();

  _onPageChanged(int page) {
    questionsScrollPhysics = widget.questions[page + 1].isAnswered
        ? AlwaysScrollableScrollPhysics()
        : CustomLockScrollPhysics(lockRight: true);

    pageController.animateToPage(page,
        duration: Duration(milliseconds: 100), curve: Curves.linear);

    setState(() {});
  }

  @override
  void initState() {
    pageController.addListener(() {
      controller.currentQuestion = pageController.page!.toInt();
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
            currentQuestion: value + 1,
            totalQuestions: widget.totalQuestions,
          ),
        ),
      ),
      body: PageView(
        onPageChanged: _onPageChanged,
        physics: questionsScrollPhysics,
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
                onTap: () {
                  pageController.nextPage(
                      duration: Duration(milliseconds: 100),
                      curve: Curves.linear);
                },
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

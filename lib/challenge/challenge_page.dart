import 'package:devquiz/feedback/feedback_page.dart';
import 'package:devquiz/home/home_controller.dart';
import 'package:devquiz/home/home_page.dart';
import 'package:devquiz/shared/models/user_data_model.dart';
import 'package:devquiz/shared/widgets/next_button/next_button_widget.dart';
import 'package:devquiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:devquiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:devquiz/helpers/custom_lock_scroll_physics.dart';
import 'package:devquiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'challenge_controller.dart';

class ChallengePage extends StatefulWidget {
  final UserDataModel userData;
  final int quizId;
  final List<QuestionModel> questions;
  final int currentQuestion;
  final int totalQuestions;

  const ChallengePage(
      {required this.userData,
      required this.quizId,
      required this.questions,
      this.currentQuestion = 0,
      required this.totalQuestions});

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  late PageController pageController;

  ScrollPhysics questionsScrollPhysics = AlwaysScrollableScrollPhysics();

  @override
  void initState() {
    controller.currentQuestionIndex = widget.currentQuestion;
    controller.currentQuestionId = widget.questions[widget.currentQuestion].id;

    pageController = PageController(initialPage: widget.currentQuestion);

    pageController.addListener(() {
      controller.currentQuestionIndex = pageController.page!.toInt();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var homeController = Provider.of<HomeController>(context, listen: false);

    _onPageChanged(int page) {
      final isCurrentQuestionAnswered = homeController.user!.quizzesData
          .firstWhere((element) => element.id == widget.quizId)
          .answersData
          .elementAt(page)
          .isAnswered;

      questionsScrollPhysics = (isCurrentQuestionAnswered)
          ? AlwaysScrollableScrollPhysics()
          : CustomLockScrollPhysics(lockRight: true);

      pageController.animateToPage(page,
          duration: Duration(milliseconds: 100), curve: Curves.linear);

      controller.currentQuestionId = homeController.quizzes!
          .firstWhere((element) => element.id == widget.quizId)
          .questions
          .elementAt(page)
          .id;

      controller.selectedAnswerId = 0;

      setState(() {});
    }

    _onSelect(int answerId) {
      controller.selectedAnswerId = answerId;
      setState(() {});
    }

    bool isCurrentQuestionAnswered() {
      var contain = homeController.user!.quizzesData
          .where((element) => element.id == widget.quizId);

      if (contain.isNotEmpty) {
        return homeController.user!.quizzesData
            .firstWhere((element) => element.id == widget.quizId)
            .answersData
            .firstWhere(
                (element) => element.questionId == controller.currentQuestionId)
            .isAnswered;
      }

      homeController.addUserNewQuizData(widget.quizId);

      return false;
    }

    bool isRightAnswer(int questionId) {
      return widget.questions
          .firstWhere((element) => element.id == questionId)
          .answers
          .firstWhere((element) => element.id == controller.selectedAnswerId)
          .isRight;
    }

    handleUserQuestionAnswer() {
      if (controller.selectedAnswerId > 0) {
        final questionId = widget.questions[pageController.page!.toInt()].id;

        final getType =
            isRightAnswer(questionId) ? 'rightAnswer' : 'wrongAnswer';

        homeController.setQuestionAnswered(
            widget.quizId,
            controller.currentQuestionId,
            controller.selectedAnswerId,
            isRightAnswer(questionId));

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => FeedbackPage(
                userData: widget.userData,
                quizId: widget.quizId,
                type: getType,
                questions: widget.questions,
                currentQuestion: widget.currentQuestion),
          ),
        );
      }
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: ValueListenableBuilder<int>(
          valueListenable: controller.currentQuestionIndexNotifier,
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
        children: widget.questions
            .map((e) => QuizWidget(
                userData: widget.userData,
                quizId: widget.quizId,
                question: e,
                onSelect: (value) {
                  _onSelect(value);
                }))
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: !isCurrentQuestionAnswered()
                ? [
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
                      label:
                          isCurrentQuestionAnswered() ? 'Próximo' : 'Confirmar',
                      onTap: handleUserQuestionAnswer,
                      isDisabled:
                          controller.selectedAnswerId == 0 ? true : false,
                    ),
                  ]
                : [
                    ValueListenableBuilder<int>(
                      valueListenable: controller.currentQuestionIndexNotifier,
                      builder: (context, value, _) => NextButton.white(
                        label: (value + 1 == widget.totalQuestions)
                            ? 'Voltar ao início'
                            : 'Próxima',
                        onTap: () {
                          if (value + 1 < widget.totalQuestions) {
                            pageController.nextPage(
                                duration: Duration(milliseconds: 100),
                                curve: Curves.linear);
                          } else {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                            );
                          }
                        },
                      ),
                    ),
                  ],
          ),
        ),
      ),
    );
  }
}

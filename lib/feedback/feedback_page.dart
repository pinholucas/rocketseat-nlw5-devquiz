import 'package:devquiz/challenge/challenge_page.dart';
import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/models/question_model.dart';
import 'package:devquiz/shared/models/user_data_model.dart';
import 'package:devquiz/shared/widgets/next_button/next_button_widget.dart';
import 'package:flutter/material.dart';

class FeedbackPage extends StatefulWidget {
  final UserDataModel userData;
  final int quizId;
  final String type;
  final String message;
  final List<QuestionModel> questions;
  final int currentQuestion;

  FeedbackPage(
      {required this.userData,
      required this.quizId,
      required this.type,
      this.message = "",
      required this.questions,
      required this.currentQuestion})
      : assert(['rightAnswer', 'wrongAnswer'].contains(type));

  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  String _getQuestionRightAnswerMessage() {
    String message = widget.type == 'rightAnswer'
        ? widget.questions[widget.currentQuestion].rightAnswerMessage
        : widget.questions[widget.currentQuestion].wrongAnswerMessage;

    return message;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(widget.type == 'rightAnswer'
                    ? AppImages.check
                    : AppImages.error),
                SizedBox(height: 40),
                Text(widget.type == 'rightAnswer' ? 'Acertou!' : "Errou!",
                    style: AppTextStyles.heading40),
                SizedBox(height: 16),
                Text(_getQuestionRightAnswerMessage(),
                    style: AppTextStyles.body15),
                SizedBox(height: 56),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 95),
                  child: Row(
                    children: [
                      NextButton.purple(
                          label: 'Avançar',
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChallengePage(
                                          userData: widget.userData,
                                          quizId: widget.quizId,
                                          questions: widget.questions,
                                          currentQuestion:
                                              widget.currentQuestion + 1,
                                          totalQuestions:
                                              widget.questions.length,
                                        )));
                          }),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

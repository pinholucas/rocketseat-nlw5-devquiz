import 'package:devquiz/challenge/widgets/answer/answer_widget.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/models/answer_model.dart';
import 'package:devquiz/shared/models/question_model.dart';
import 'package:devquiz/shared/models/user_data_model.dart';
import 'package:flutter/cupertino.dart';

class QuizWidget extends StatefulWidget {
  final UserDataModel userData;
  final int quizId;
  final QuestionModel question;
  final ValueChanged<int> onSelect;

  QuizWidget(
      {required this.userData,
      required this.quizId,
      required this.question,
      required this.onSelect});

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int selectedAnswerId = -1;

  AnswerModel answer(int answerId) =>
      widget.question.answers.firstWhere((element) => element.id == answerId);

  bool isAnswered(int answerID) {
    final questionId = widget.question.id;

    final isAnswered = widget.userData.quizzesData
        .firstWhere((element) => element.id == widget.quizId)
        .answersData
        .firstWhere((element) => element.questionId == questionId)
        .isAnswered;

    return isAnswered;
  }

  int getAnswerChoise(int answerIndex) {
    final questionId = widget.question.id;

    final isAnswered = widget.userData.quizzesData
        .firstWhere((element) => element.id == widget.quizId)
        .answersData
        .firstWhere((element) => element.questionId == questionId)
        .answerChoiceId;

    return isAnswered;
  }

  bool isSelected(int answerIndex) {
    return isAnswered(answerIndex) &&
            getAnswerChoise(answerIndex) == answerIndex
        ? true
        : selectedAnswerId == answerIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 64),
      child: Column(
        children: [
          Text(widget.question.title, style: AppTextStyles.heading20),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Wrap(
              runSpacing: 8,
              children: widget.question.answers
                  .map(
                    (e) => AnswerWidget(
                      answer: answer(e.id),
                      isAnswered: isAnswered(e.id),
                      isSelected: isSelected(e.id),
                      onTap: () {
                        if (!isAnswered(e.id)) {
                          selectedAnswerId = e.id;
                          setState(() {});
                          widget.onSelect(e.id);
                        }
                      },
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:devquiz/challenge/widgets/answer/answer_widget.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/models/answer_model.dart';
import 'package:devquiz/shared/models/question_model.dart';
import 'package:flutter/cupertino.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;

  QuizWidget({required this.question});

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;

  AnswerModel answer(int index) => widget.question.answers[index];

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
              children: [
                for (var i = 0; i < widget.question.answers.length; i++)
                  AnswerWidget(
                    answer: answer(i),
                    isAnswered: widget.question.isAnswered,
                    isSelected: (widget.question.isAnswered &&
                            widget.question.answerChoice == i
                        ? true
                        : indexSelected == i),
                    onTap: () {
                      if (!widget.question.isAnswered) {
                        indexSelected = i;
                        setState(() {});
                      }
                    },
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

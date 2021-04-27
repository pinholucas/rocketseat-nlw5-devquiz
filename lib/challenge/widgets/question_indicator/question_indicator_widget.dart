import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/widgets/horizontal_progress_indicator/horizontal_progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final context;
  final int currentQuestion;
  final int totalQuestions;

  QuestionIndicatorWidget(
      {required this.context,
      required this.currentQuestion,
      required this.totalQuestions});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Wrap(
              runSpacing: 15,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Questão ' + (currentQuestion).toString(),
                        style: AppTextStyles.bodyLightGrey15),
                    Text('de ' + totalQuestions.toString(),
                        style: AppTextStyles.bodyLightGrey15),
                  ],
                ),
                HorizontalProgressIndicator(
                    value: (currentQuestion / totalQuestions))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

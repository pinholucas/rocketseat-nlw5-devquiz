import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:devquiz/shared/models/quiz_model.dart';
import 'package:flutter/material.dart';

class QuizCardListWidget extends StatelessWidget {
  final List<QuizModel> quizzes;

  QuizCardListWidget({required this.quizzes});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: GridView.count(
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          crossAxisCount: 2,
          children: quizzes
              .map((e) => QuizCardWidget(
                    title: e.title,
                    icon: e.icon,
                    completed: e.questionsAnswered,
                    total: e.questions.length,
                  ))
              .toList(),
        ),
      ),
    );
  }
}

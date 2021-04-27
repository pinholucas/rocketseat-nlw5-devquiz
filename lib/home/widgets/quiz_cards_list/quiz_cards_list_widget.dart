import 'package:devquiz/challenge/challenge_page.dart';
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
                    onTap: () {
                      int index = e.questions
                          .indexWhere((element) => element.isAnswered == false);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (contexto) => ChallengePage(
                                    questions: e.questions,
                                    currentQuestion: index,
                                    totalQuestions: e.questions.length,
                                  )));
                    },
                  ))
              .toList(),
        ),
      ),
    );
  }
}

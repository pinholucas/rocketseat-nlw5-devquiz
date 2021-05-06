import 'package:devquiz/challenge/challenge_page.dart';
import 'package:devquiz/home/home_controller.dart';
import 'package:devquiz/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuizCardListWidget extends StatefulWidget {
  QuizCardListWidget();

  @override
  _QuizCardListWidgetState createState() => _QuizCardListWidgetState();
}

class _QuizCardListWidgetState extends State<QuizCardListWidget> {
  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<HomeController>(context);
    var userData = controller.user!;
    var quizzes = controller.quizzes!;

    int getQuizzQuestionsAnswered(int quizzId) {
      final contain =
          userData.quizzesData.where((element) => element.id == quizzId);

      if (contain.isNotEmpty) {
        final answeredQuestions = userData.quizzesData
            .firstWhere((element) => element.id == quizzId)
            .answeredQuestions;

        return answeredQuestions;
      }

      return 0;
    }

    int getQuizzFirstUnansweredQuestionIndex(int quizzId) {
      final quizzesData =
          userData.quizzesData.where((element) => element.id == quizzId);

      if (quizzesData.isNotEmpty) {
        final questionNotAnswered = userData.quizzesData
            .firstWhere((element) => element.id == quizzId)
            .answersData
            .where((element) => !element.isAnswered);

        if (questionNotAnswered.isNotEmpty) {
          final questionId = userData.quizzesData
              .firstWhere((element) => element.id == quizzId)
              .answersData
              .firstWhere((element) => !element.isAnswered)
              .questionId;

          final question = quizzes[0]
              .questions
              .firstWhere((element) => element.id == questionId);

          final questionIndex = quizzes[0].questions.indexOf(question);

          return questionIndex;
        }
      }

      return 0;
    }

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: GridView.count(
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          crossAxisCount: 2,
          children: quizzes
              .map(
                (e) => QuizCardWidget(
                  title: e.title,
                  icon: e.icon,
                  completed: getQuizzQuestionsAnswered(e.id),
                  total: e.questions.length,
                  onTap: () {
                    print(getQuizzFirstUnansweredQuestionIndex(e.id));
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (contexto) => ChallengePage(
                          userData: userData,
                          quizId: e.id,
                          questions: e.questions,
                          currentQuestion:
                              getQuizzFirstUnansweredQuestionIndex(e.id),
                          totalQuestions: e.questions.length,
                        ),
                      ),
                    );
                  },
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

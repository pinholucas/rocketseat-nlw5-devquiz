import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/home/home_controller.dart';
import 'package:devquiz/home/home_page.dart';
import 'package:devquiz/shared/models/quiz_model.dart';
import 'package:devquiz/shared/models/user_data_model.dart';
import 'package:devquiz/shared/widgets/next_button/next_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatefulWidget {
  final int quizId;

  ResultPage({required this.quizId});

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    HomeController controller = Provider.of<HomeController>(context);

    UserDataModel userData = controller.user!;
    List<QuizModel> quizzes = controller.quizzes!;

    String quizTitle =
        quizzes.firstWhere((element) => element.id == widget.quizId).title;

    int rightQuestions = userData.quizzesData
        .firstWhere((element) => element.id == widget.quizId)
        .answersData
        .where((element) => element.isRightAnswer)
        .length;

    int totalQuestions = userData.quizzesData
        .firstWhere((element) => element.id == widget.quizId)
        .answersData
        .length;

    print(rightQuestions);

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppImages.trophy),
                SizedBox(height: 40),
                Text('Parabéns!', style: AppTextStyles.heading40),
                SizedBox(height: 16),
                Text('Você concluiu', style: AppTextStyles.body15),
                Text(quizTitle, style: AppTextStyles.body15Bold),
                Text('com $rightQuestions de $totalQuestions acertos.',
                    style: AppTextStyles.body15),
                SizedBox(height: 56),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 95),
                  child: Wrap(
                    runSpacing: 15,
                    children: [
                      Row(
                        children: [
                          NextButton.purple(
                              label: 'Compartilhar',
                              onTap: () {
                                Share.share(
                                    "Concluí o quiz $quizTitle do DevQuiz com $rightQuestions acertos em $totalQuestions questões.");
                              }),
                        ],
                      ),
                      Row(
                        children: [
                          NextButton.white(
                            label: 'Voltar ao início',
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()),
                              );
                            },
                          ),
                        ],
                      ),
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

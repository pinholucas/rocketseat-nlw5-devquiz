import 'package:devquiz/challenge/widgets/answer/answer_widget.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:flutter/cupertino.dart';

class QuizWidget extends StatelessWidget {
  final String title;

  QuizWidget({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
      child: Column(
        children: [
          Text(title, style: AppTextStyles.heading20),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Wrap(
              runSpacing: 8,
              children: [
                AnswerWidget(
                    title:
                        'Possibilita a criação de aplicativos compilados não nativamente'),
                AnswerWidget(
                    title: 'Kit de desenvolvivmento de interface de usuário',
                    isSelected: true,
                    isRight: true),
                AnswerWidget(title: 'Acho que é uma marca de café do Himalaia'),
                AnswerWidget(
                    title:
                        'Possibilita a criação de desktops que são muito incríveis'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

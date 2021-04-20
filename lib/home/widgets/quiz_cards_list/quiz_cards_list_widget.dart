import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';

class QuizCardListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: GridView.count(
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          crossAxisCount: 2,
          children: [
            QuizCardWidget(
                title: 'Gerenciamento de Estado',
                icon: AppImages.data,
                completed: 3,
                total: 10),
            QuizCardWidget(
                title: 'Construindo Interfaces',
                icon: AppImages.laptop,
                completed: 10,
                total: 10),
            QuizCardWidget(
                title: 'Integração Nativa',
                icon: AppImages.hierarchy,
                completed: 9,
                total: 10),
            QuizCardWidget(
                title: 'Widgets do Flutter',
                icon: AppImages.blocks,
                completed: 5,
                total: 10),
          ],
        ),
      ),
    );
  }
}

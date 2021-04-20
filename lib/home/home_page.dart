import 'package:devquiz/home/widgets/appbar/app_bar_widget.dart';
import 'package:devquiz/home/widgets/quiz_cards_list/quiz_cards_list_widget.dart';
import 'package:devquiz/home/widgets/level_tags_list/level_tags_list_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Column(
          children: [
            LevelTagsListWidget(),
            QuizCardListWidget(),
          ],
        ),
      ),
    );
  }
}

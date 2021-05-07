import 'package:devquiz/home/widgets/level_tag/level_tag_widget.dart';
import 'package:devquiz/shared/models/quiz_model.dart';
import 'package:flutter/material.dart';

class LevelTagsListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          LevelTagWidget(title: 'Fácil', type: Level.easy),
          SizedBox(width: 6),
          LevelTagWidget(title: 'Médio', type: Level.medium),
          SizedBox(width: 6),
          LevelTagWidget(title: 'Difícil', type: Level.hard),
          SizedBox(width: 6),
          LevelTagWidget(title: 'Perito', type: Level.expert),
        ],
      ),
    );
  }
}

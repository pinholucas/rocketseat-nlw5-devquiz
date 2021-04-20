import 'package:devquiz/home/widgets/level_tag/level_tag_widget.dart';
import 'package:flutter/material.dart';

class LevelTagsListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          LevelTagWidget(title: 'Fácil'),
          SizedBox(width: 6),
          LevelTagWidget(title: 'Médio'),
          SizedBox(width: 6),
          LevelTagWidget(title: 'Difícil'),
          SizedBox(width: 6),
          LevelTagWidget(title: 'Perito'),
        ],
      ),
    );
  }
}

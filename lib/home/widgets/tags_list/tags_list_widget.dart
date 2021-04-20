import 'package:devquiz/core/core.dart';
import 'package:devquiz/home/widgets/tag/tag_widget.dart';
import 'package:flutter/material.dart';

class TagsListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Row(
        children: [
          TagWidget(
              title: 'Fácil',
              borderColor: AppColors.levelButtonBorderFacil,
              color: AppColors.levelButtonFacil,
              textColor: AppColors.levelButtonTextFacil),
          SizedBox(width: 10),
          TagWidget(
              title: 'Médio',
              borderColor: AppColors.levelButtonBorderMedio,
              color: AppColors.levelButtonMedio,
              textColor: AppColors.levelButtonTextMedio),
          SizedBox(width: 10),
          TagWidget(
              title: 'Difícil',
              borderColor: AppColors.levelButtonBorderDificil,
              color: AppColors.levelButtonDificil,
              textColor: AppColors.levelButtonTextDificil),
          SizedBox(width: 10),
          TagWidget(
              title: 'Perito',
              borderColor: AppColors.levelButtonBorderPerito,
              color: AppColors.levelButtonPerito,
              textColor: AppColors.levelButtonTextPerito),
        ],
      ),
    );
  }
}

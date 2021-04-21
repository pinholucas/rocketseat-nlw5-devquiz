import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/widgets/horizontal_progress_indicator.dart';
import 'package:flutter/material.dart';

class QuestionIndicatorWidget extends PreferredSize {
  QuestionIndicatorWidget()
      : super(
          preferredSize: Size.fromHeight(80),
          child: SafeArea(
            top: true,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Questão 04', style: AppTextStyles.bodyLightGrey15),
                      Text('de 10', style: AppTextStyles.bodyLightGrey15),
                    ],
                  ),
                  HorizontalProgressIndicator(value: .3)
                ],
              ),
            ),
          ),
        );
}

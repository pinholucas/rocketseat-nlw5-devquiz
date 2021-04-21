import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class AnswerWidget extends StatelessWidget {
  final String title;
  final bool isRight;
  final bool isSelected;

  AnswerWidget({
    required this.title,
    this.isRight = false,
    this.isSelected = false,
  });

  Color get selectedAnswerCardColor =>
      isRight ? AppColors.lightGreen : AppColors.lightRed;
  Color get selectedAnswerCardBorderColor =>
      isRight ? AppColors.green : AppColors.red;

  Color get selectedAnswerText =>
      isRight ? AppColors.bodyDarkGreen : AppColors.bodyDarkRed;

  Color get selectedAnswerCheckboxColor =>
      isRight ? AppColors.darkGreen : AppColors.darkRed;
  Color get selectedAnswerCheckboxBorderColor =>
      isRight ? AppColors.lightGreen : AppColors.lightRed;
  Color get selectedAnswerCheckboxShadowColor => isRight
      ? AppColors.darkGreen.withOpacity(.4)
      : AppColors.darkRed.withOpacity(.4);

  IconData get selectedAnswerIcon => isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isSelected ? selectedAnswerCardColor : AppColors.white,
        border: Border.all(
            color:
                isSelected ? selectedAnswerCardBorderColor : AppColors.border),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(title, style: AppTextStyles.body),
          ),
          Container(
            height: 24,
            width: 24,
            decoration: BoxDecoration(
              color: (isSelected ? selectedAnswerCheckboxColor : null),
              boxShadow: [
                BoxShadow(
                  color: isSelected
                      ? selectedAnswerCheckboxShadowColor
                      : Colors.transparent,
                  spreadRadius: 0,
                  blurRadius: 12,
                  offset: Offset(0, 4),
                )
              ],
              border: Border.all(
                  color: isSelected
                      ? selectedAnswerCheckboxBorderColor
                      : AppColors.border),
              borderRadius: BorderRadius.circular(12),
            ),
            child: (isSelected
                ? Icon(selectedAnswerIcon, size: 16, color: AppColors.white)
                : null),
          ),
        ],
      ),
    );
  }
}

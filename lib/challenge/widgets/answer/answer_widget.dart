import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/shared/models/answer_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerWidget extends StatelessWidget {
  final AnswerModel answer;
  final bool isSelected;
  final bool isAnswered;
  final VoidCallback onTap;

  AnswerWidget({
    required this.answer,
    this.isSelected = false,
    this.isAnswered = false,
    required this.onTap,
  });

  Color get selectedAnswerCardColor => isAnswered
      ? (answer.isRight ? AppColors.lightGreen : AppColors.lightRed)
      : AppColors.white;
  Color get selectedAnswerCardBorderColor => isAnswered
      ? (answer.isRight ? AppColors.green : AppColors.red)
      : AppColors.darkGreen;

  Color get selectedAnswerText => isAnswered
      ? (answer.isRight ? AppColors.bodyDarkGreen : AppColors.bodyDarkRed)
      : AppColors.grey;

  Color get selectedAnswerCheckboxColor => isAnswered
      ? (answer.isRight ? AppColors.darkGreen : AppColors.darkRed)
      : Colors.white;
  Color get selectedAnswerCheckboxBorderColor => isAnswered
      ? (answer.isRight ? AppColors.lightGreen : AppColors.lightRed)
      : AppColors.border;
  Color get selectedAnswerCheckboxShadowColor => isAnswered
      ? (answer.isRight
          ? AppColors.darkGreen.withOpacity(.4)
          : AppColors.darkRed.withOpacity(.4))
      : Colors.transparent;

  Color get selectedAnswerCheckboxIconColor =>
      isAnswered ? AppColors.white : AppColors.darkGreen;

  IconData get selectedAnswerIcon =>
      isAnswered ? (answer.isRight ? Icons.check : Icons.close) : Icons.check;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? selectedAnswerCardColor : AppColors.white,
          border: Border.all(
              color: isSelected
                  ? selectedAnswerCardBorderColor
                  : AppColors.border),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(answer.title,
                  style: GoogleFonts.notoSans(
                    color: isSelected ? selectedAnswerText : AppColors.grey,
                    fontSize: 13,
                  )),
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
                  ? Icon(selectedAnswerIcon,
                      size: 16, color: selectedAnswerCheckboxIconColor)
                  : null),
            ),
          ],
        ),
      ),
    );
  }
}

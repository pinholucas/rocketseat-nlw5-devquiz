import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/widgets/horizontal_progress_indicator.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final String icon;
  final int completed;
  final int total;

  QuizCardWidget(
      {required this.title,
      required this.icon,
      required this.completed,
      required this.total});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/images/' + icon + '.png'),
            Text(title, style: AppTextStyles.heading15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 4,
                  child: Text(completed.toString() + ' de ' + total.toString(),
                      style: AppTextStyles.body),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    height: 4,
                    child: HorizontalProgressIndicator(
                      value: (completed / total),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

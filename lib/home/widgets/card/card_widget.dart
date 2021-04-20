import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  CardWidget(
      {@required this.title,
      @required this.icon,
      @required this.completed,
      @required this.total});

  final title;
  final icon;
  final completed;
  final total;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Container(
            height: 180,
            decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(color: AppColors.border),
                borderRadius: BorderRadius.circular(10)),
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(icon),
                  Text(title, style: AppTextStyles.heading15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(completed.toString() + ' de ' + total.toString(),
                          style: AppTextStyles.body),
                      Container(
                        height: 4,
                        width: 70,
                        child: LinearProgressIndicator(
                          value: (completed / total),
                          valueColor: new AlwaysStoppedAnimation<Color>(
                              AppColors.chartPrimary),
                          backgroundColor: AppColors.chartSecondary,
                        ),
                      )
                    ],
                  )
                ],
              ),
            )));
  }
}

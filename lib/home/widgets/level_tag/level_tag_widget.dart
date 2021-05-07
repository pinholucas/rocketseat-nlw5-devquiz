import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/home/home_controller.dart';
import 'package:devquiz/shared/models/quiz_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LevelTagWidget extends StatelessWidget {
  final String title;
  final Level type;

  LevelTagWidget({required this.title, required this.type});

  final tagColorConfig = {
    Level.easy: {
      "color": AppColors.levelButtonEasy,
      "borderColor": AppColors.levelButtonBorderEasy,
      "textColor": AppColors.levelButtonTextEasy
    },
    Level.medium: {
      "color": AppColors.levelButtonMedium,
      "borderColor": AppColors.levelButtonBorderMedium,
      "textColor": AppColors.levelButtonTextMedium
    },
    Level.hard: {
      "color": AppColors.levelButtonHard,
      "borderColor": AppColors.levelButtonBorderHard,
      "textColor": AppColors.levelButtonTextHard
    },
    Level.expert: {
      "color": AppColors.levelButtonExpert,
      "borderColor": AppColors.levelButtonBorderExpert,
      "textColor": AppColors.levelButtonTextExpert
    },
  };

  Color get color => tagColorConfig[type]!['color']!;

  Color get borderColor => tagColorConfig[type]!['borderColor']!;

  Color get textColor => tagColorConfig[type]!['textColor']!;

  @override
  Widget build(BuildContext context) {
    var homeController = Provider.of<HomeController>(context);

    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          homeController.changeQuizLevel(type);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                  color: homeController.quizzesLevel == type
                      ? HSLColor.fromColor(borderColor)
                          .withLightness(.70)
                          .withSaturation(.85)
                          .toColor()
                      : borderColor),
              color: homeController.quizzesLevel == type
                  ? HSLColor.fromColor(color)
                      .withLightness(.9)
                      .withSaturation(.85)
                      .toColor()
                  : color),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(title,
                  style: GoogleFonts.notoSans(color: textColor, fontSize: 13)),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:devquiz/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextButton extends StatelessWidget {
  final String label;
  final Color borderColor;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onTap;
  final bool isDisabled;

  NextButton(
      {required this.label,
      required this.borderColor,
      required this.backgroundColor,
      required this.textColor,
      required this.onTap,
      required this.isDisabled});

  NextButton.white(
      {required String label,
      required VoidCallback onTap,
      bool isDisabled = false})
      : this.borderColor = AppColors.border,
        this.backgroundColor = AppColors.white,
        this.textColor = AppColors.lightGrey,
        this.onTap = onTap,
        this.label = label,
        this.isDisabled = isDisabled;

  NextButton.green(
      {required String label,
      required VoidCallback onTap,
      bool isDisabled = false})
      : this.borderColor = Colors.transparent,
        this.backgroundColor = AppColors.darkGreen,
        this.textColor = AppColors.white,
        this.onTap = onTap,
        this.label = label,
        this.isDisabled = isDisabled;

  NextButton.purple(
      {required String label,
      required VoidCallback onTap,
      bool isDisabled = false})
      : this.borderColor = Colors.transparent,
        this.backgroundColor = AppColors.purple,
        this.textColor = AppColors.white,
        this.onTap = onTap,
        this.label = label,
        this.isDisabled = isDisabled;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(isDisabled
              ? AppColors.darkGreen.withOpacity(.4)
              : backgroundColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          side: MaterialStateProperty.all(
            BorderSide(color: borderColor),
          ),
        ),
        onPressed: !isDisabled ? onTap : null,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 7),
          child: Text(
            label,
            style: GoogleFonts.notoSans(
                fontWeight: FontWeight.w600, fontSize: 15, color: textColor),
          ),
        ),
      ),
    );
  }
}

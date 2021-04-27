import 'package:devquiz/core/app_colors.dart';
import 'package:flutter/material.dart';

class HorizontalProgressIndicator extends StatelessWidget {
  final double value;

  const HorizontalProgressIndicator({required this.value});

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: value,
      backgroundColor: AppColors.chartSecondary,
      valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
    );
  }
}

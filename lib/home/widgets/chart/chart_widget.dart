import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChartWidget extends StatefulWidget {
  @override
  _ChartWidgetState createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  int _totalQuizzesAnsweredQuestions = 0;
  int _totalQuizzesQuestions = 0;

  void initAnimation() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    _animation = Tween<double>(
      begin: 0.0,
      end: (_totalQuizzesAnsweredQuestions / _totalQuizzesQuestions),
    ).animate(_animationController);

    _animationController.forward();
  }

  @override
  void didChangeDependencies() {
    var homeController = Provider.of<HomeController>(context, listen: false);

    getTotalQuizzesAnsweredQuestions() {
      _totalQuizzesAnsweredQuestions = 0;

      homeController.user!.quizzesData.forEach((element) {
        _totalQuizzesAnsweredQuestions += element.answeredQuestions;
      });
    }

    getTotalQuizzesQuestions() {
      _totalQuizzesQuestions = 0;

      homeController.quizzes!.forEach((element) {
        _totalQuizzesQuestions += element.questions.length;
      });
    }

    getTotalQuizzesAnsweredQuestions();
    getTotalQuizzesQuestions();

    initAnimation();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, _) => Stack(
          children: [
            Center(
              child: Container(
                height: 80,
                width: 80,
                child: CircularProgressIndicator(
                  strokeWidth: 10,
                  value: _animation.value,
                  backgroundColor: AppColors.chartSecondary,
                  valueColor:
                      AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
                ),
              ),
            ),
            Center(
              child: Text((_animation.value * 100).round().toString() + "%",
                  style: AppTextStyles.heading),
            )
          ],
        ),
      ),
    );
  }
}

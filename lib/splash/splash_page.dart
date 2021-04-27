import 'package:devquiz/core/core.dart';
import 'package:devquiz/home/home_controller.dart';
import 'package:devquiz/home/home_page.dart';
import 'package:devquiz/home/home_state.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller
        .checkUserDataFileExistence()
        .then((_) => controller.getUser())
        .then((_) => controller.getQuizzes());

    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.userDataState == HomeState.success &&
        controller.quizzState == HomeState.success) {
      Future.delayed(Duration(seconds: 1)).then(
        (_) => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(
              controller: controller,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppGradients.linear,
        ),
        child: Center(
          child: Image.asset(AppImages.logo),
        ),
      ),
    );
  }
}

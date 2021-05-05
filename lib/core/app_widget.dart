import 'package:devquiz/home/home_controller.dart';
import 'package:devquiz/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeController>.value(value: controller)
      ],
      child: MaterialApp(
        title: "DevQuiz",
        home: SplashPage(),
      ),
    );
  }
}

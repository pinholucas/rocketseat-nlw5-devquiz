import 'package:flutter/foundation.dart';

class ChallengeController {
  final currentQuestionIndexNotifier = ValueNotifier<int>(0);
  int get currentQuestionIndex => currentQuestionIndexNotifier.value;
  set currentQuestionIndex(int value) =>
      currentQuestionIndexNotifier.value = value;

  int currentQuestionId = 0;
  int selectedAnswerId = 0;
}

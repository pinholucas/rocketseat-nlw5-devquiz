import 'package:flutter/foundation.dart';

class ChallengeController {
  final currentQuestionNotifier = ValueNotifier<int>(0);
  int get currentQuestion => currentQuestionNotifier.value;
  set currentQuestion(int value) => currentQuestionNotifier.value = value;
}

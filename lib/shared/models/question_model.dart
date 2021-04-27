import 'dart:convert';

import 'package:devquiz/shared/models/answer_model.dart';

class QuestionModel {
  final String title;
  final bool isAnswered;
  final int answerChoice;
  final String rightAnswerMessage;
  final String wrongAnswerMessage;
  final List<AnswerModel> answers;

  QuestionModel({
    required this.title,
    this.isAnswered = false,
    this.answerChoice = 0,
    required this.rightAnswerMessage,
    required this.wrongAnswerMessage,
    required this.answers,
  }) : assert(answers.length == 4);

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isAnswered': isAnswered,
      'answerChoice': answerChoice,
      'rightAnswerMessage': rightAnswerMessage,
      'wrongAnswerMessage': wrongAnswerMessage,
      'answers': answers.map((x) => x.toMap()).toList(),
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      title: map['title'],
      isAnswered: map['isAnswered'],
      answerChoice: map['answerChoice'],
      rightAnswerMessage: map['rightAnswerMessage'],
      wrongAnswerMessage: map['wrongAnswerMessage'],
      answers: List<AnswerModel>.from(
          map['answers']?.map((x) => AnswerModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) =>
      QuestionModel.fromMap(json.decode(source));
}

import 'dart:convert';

import 'package:devquiz/shared/models/answer_model.dart';

class QuestionModel {
  final int id;
  final String title;
  final String rightAnswerMessage;
  final String wrongAnswerMessage;
  final List<AnswerModel> answers;

  QuestionModel({
    required this.id,
    required this.title,
    required this.rightAnswerMessage,
    required this.wrongAnswerMessage,
    required this.answers,
  }) : assert(answers.length == 4);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'rightAnswerMessage': rightAnswerMessage,
      'wrongAnswerMessage': wrongAnswerMessage,
      'answers': answers.map((x) => x.toMap()).toList(),
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      id: map['id'],
      title: map['title'],
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

import 'dart:convert';

class UserDataAnswerModel {
  final int questionId;
  final bool isAnswered;
  final int answerChoiceId;

  UserDataAnswerModel(
      {required this.questionId,
      required this.isAnswered,
      required this.answerChoiceId});

  Map<String, dynamic> toMap() {
    return {
      'questionId': questionId,
      'isAnswered': isAnswered,
      'answerChoiceId': answerChoiceId,
    };
  }

  factory UserDataAnswerModel.fromMap(Map<String, dynamic> map) {
    return UserDataAnswerModel(
      questionId: map['questionId'],
      isAnswered: map['isAnswered'],
      answerChoiceId: map['answerChoiceId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDataAnswerModel.fromJson(String source) =>
      UserDataAnswerModel.fromMap(json.decode(source));
}

import 'dart:convert';

class UserDataAnswerModel {
  final int questionId;
  bool isAnswered;
  int answerChoiceId;
  bool isRightAnswer;

  UserDataAnswerModel(
      {required this.questionId,
      required this.isAnswered,
      required this.answerChoiceId,
      required this.isRightAnswer});

  Map<String, dynamic> toMap() {
    return {
      'questionId': questionId,
      'isAnswered': isAnswered,
      'answerChoiceId': answerChoiceId,
      'isRightAnswer': isRightAnswer,
    };
  }

  factory UserDataAnswerModel.fromMap(Map<String, dynamic> map) {
    return UserDataAnswerModel(
      questionId: map['questionId'],
      isAnswered: map['isAnswered'],
      answerChoiceId: map['answerChoiceId'],
      isRightAnswer: map['isRightAnswer'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDataAnswerModel.fromJson(String source) =>
      UserDataAnswerModel.fromMap(json.decode(source));
}

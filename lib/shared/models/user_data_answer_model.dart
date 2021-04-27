import 'dart:convert';

class UserDataAnswerModel {
  final int id;
  final bool isAnswered;
  final int answerChoice;

  UserDataAnswerModel(
      {required this.id, required this.isAnswered, required this.answerChoice});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'isAnswered': isAnswered,
      'answerChoice': answerChoice,
    };
  }

  factory UserDataAnswerModel.fromMap(Map<String, dynamic> map) {
    return UserDataAnswerModel(
      id: map['id'],
      isAnswered: map['isAnswered'],
      answerChoice: map['answerChoice'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDataAnswerModel.fromJson(String source) =>
      UserDataAnswerModel.fromMap(json.decode(source));
}

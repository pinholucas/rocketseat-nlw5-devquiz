import 'dart:convert';

import 'package:devquiz/shared/models/user_data_answer_model.dart';

class UserDataQuizzModel {
  final int id;
  final int answeredQuestions;
  final List<UserDataAnswerModel> answersData;

  UserDataQuizzModel(
      {required this.id,
      required this.answeredQuestions,
      required this.answersData});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'answeredQuestions': answeredQuestions,
      'answersData': answersData.map((x) => x.toMap()).toList(),
    };
  }

  factory UserDataQuizzModel.fromMap(Map<String, dynamic> map) {
    return UserDataQuizzModel(
      id: map['id'],
      answeredQuestions: map['answeredQuestions'],
      answersData: List<UserDataAnswerModel>.from(
        map['answersData']?.map((x) => UserDataAnswerModel.fromMap(x)),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDataQuizzModel.fromJson(String source) =>
      UserDataQuizzModel.fromMap(json.decode(source));
}

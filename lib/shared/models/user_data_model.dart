import 'dart:convert';

import 'package:devquiz/shared/models/user_data_question_model.dart';

class UserDataModel {
  final String name;
  final String photoUrl;
  final int score;
  final List<UserDataQuestionModel> questionsData;

  UserDataModel(
      {required this.name,
      required this.photoUrl,
      required this.score,
      required this.questionsData});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'photoUrl': photoUrl,
      'score': score,
      'questions': questionsData.map((x) => x.toMap()).toList(),
    };
  }

  factory UserDataModel.fromMap(Map<String, dynamic> map) {
    return UserDataModel(
      name: map['name'],
      photoUrl: map['photoUrl'],
      score: map['score'],
      questionsData: List<UserDataQuestionModel>.from(
        map['questions']?.map((x) => UserDataQuestionModel.fromMap(x)),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDataModel.fromJson(String source) =>
      UserDataModel.fromMap(json.decode(source));
}

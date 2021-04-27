import 'dart:convert';

import 'package:devquiz/shared/models/user_data_quizz_model.dart';

class UserDataModel {
  final String name;
  final String photoUrl;
  final int score;
  final List<UserDataQuizzModel> quizzesData;

  UserDataModel(
      {required this.name,
      required this.photoUrl,
      required this.score,
      required this.quizzesData});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'photoUrl': photoUrl,
      'score': score,
      'quizzesData': quizzesData.map((x) => x.toMap()).toList(),
    };
  }

  factory UserDataModel.fromMap(Map<String, dynamic> map) {
    return UserDataModel(
      name: map['name'],
      photoUrl: map['photoUrl'],
      score: map['score'],
      quizzesData: List<UserDataQuizzModel>.from(
        map['quizzesData']?.map((x) => UserDataQuizzModel.fromMap(x)),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDataModel.fromJson(String source) =>
      UserDataModel.fromMap(json.decode(source));
}

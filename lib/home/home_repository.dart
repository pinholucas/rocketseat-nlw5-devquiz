import 'dart:convert';
import 'dart:io';

import 'package:devquiz/shared/models/quiz_model.dart';
import 'package:devquiz/shared/models/user_data_model.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class HomeRepository {
  Future<UserDataModel> getUser() async {
    final userDataFile = await _userDataFile;

    final String response = await userDataFile.readAsString();
    final userData = UserDataModel.fromJson(response);

    return userData;
  }

  Future<List<QuizModel>> getQuizzes() async {
    final response = await rootBundle.loadString("./database/quizzes.json");
    final list = jsonDecode(response) as List;
    final quizzes = list.map((e) => QuizModel.fromMap(e)).toList();

    return quizzes;
  }

  Future<File> get _userDataFile async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final userDataFile = File(documentsDirectory.path + '/userData.json');
    print(userDataFile);

    return userDataFile;
  }

  Future<File> saveUserData(UserDataModel userData) async {
    final userDataFile = await _userDataFile;

    return userDataFile.writeAsString(userData.toJson());
  }
}

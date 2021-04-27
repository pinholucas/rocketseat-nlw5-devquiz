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

    return userDataFile;
  }

  Future<dynamic> get _userData async {
    final userDataFile = await _userDataFile;

    final String response = userDataFile.readAsStringSync();
    final Object userData = jsonDecode(response);

    return userData;
  }

  Future<File> saveUserData(Object userData) async {
    final userDataFile = await _userDataFile;

    return userDataFile.writeAsString(jsonEncode(userData));
  }

  void setQuestionsAnswered() async {
    final userData = await _userData;

    userData[0]['score'] = userData[0]['score'] + 1;

    print(userData);
    print(jsonEncode(userData));

    saveUserData(userData);
  }
}

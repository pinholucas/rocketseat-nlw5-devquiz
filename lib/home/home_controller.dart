import 'package:devquiz/home/home_repository.dart';
import 'package:devquiz/home/home_state.dart';
import 'package:devquiz/shared/models/quiz_model.dart';
import 'package:devquiz/shared/models/user_data_model.dart';
import 'package:devquiz/shared/models/user_model.dart';
import 'package:flutter/cupertino.dart';

import 'package:path_provider/path_provider.dart';
import 'dart:io';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  final repository = HomeRepository();

  void getUser() async {
    state = HomeState.loading;

    user = await repository.getUser();

    state = HomeState.success;
  }

  void getQuizzes() async {
    state = HomeState.loading;

    //await Future.delayed(Duration(seconds: 2));

    quizzes = await repository.getQuizzes();

    state = HomeState.success;
  }

  void checkUserDataFileExistence() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final userDataFile = File(documentsDirectory.path + '/userData.json');

    final exists = await userDataFile.exists();

    if (!exists) {
      UserDataModel user = new UserDataModel(
          name: 'Lucas Pinho',
          photoUrl:
              'https://pbs.twimg.com/profile_images/1293766775763591169/ESk4Xxw3_400x400.jpg',
          score: 15,
          questionsData: []);

      await userDataFile.writeAsString(user.toJson());
    }
  }
}

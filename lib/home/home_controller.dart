import 'package:devquiz/home/home_repository.dart';
import 'package:devquiz/home/home_state.dart';
import 'package:devquiz/shared/models/quiz_model.dart';
import 'package:devquiz/shared/models/user_data_model.dart';
import 'package:flutter/cupertino.dart';

import 'package:path_provider/path_provider.dart';
import 'dart:io';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set userDataState(HomeState userDataState) =>
      stateNotifier.value = userDataState;
  HomeState get userDataState => stateNotifier.value;

  set quizzState(HomeState quizzState) => stateNotifier.value = quizzState;
  HomeState get quizzState => stateNotifier.value;

  UserDataModel? user;
  List<QuizModel>? quizzes;

  final repository = HomeRepository();

  void getUser() async {
    userDataState = HomeState.loading;

    user = await repository.getUser();

    userDataState = HomeState.success;
  }

  void getQuizzes() async {
    quizzState = HomeState.loading;

    //await Future.delayed(Duration(seconds: 2));

    quizzes = await repository.getQuizzes();

    quizzState = HomeState.success;
  }

  Future checkUserDataFileExistence() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final exists =
        await File(documentsDirectory.path + '/userData.json').exists();

    if (!exists) {
      final userDataFile = File(documentsDirectory.path + '/userData.json');

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

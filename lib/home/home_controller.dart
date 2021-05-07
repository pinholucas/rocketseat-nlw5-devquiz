import 'package:devquiz/home/home_repository.dart';
import 'package:devquiz/home/home_state.dart';
import 'package:devquiz/shared/models/quiz_model.dart';
import 'package:devquiz/shared/models/user_data_answer_model.dart';
import 'package:devquiz/shared/models/user_data_model.dart';
import 'package:devquiz/shared/models/user_data_quizz_model.dart';
import 'package:flutter/cupertino.dart';

import 'package:path_provider/path_provider.dart';
import 'dart:io';

class HomeController extends ChangeNotifier {
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
          quizzesData: []);

      await userDataFile.writeAsString(user.toJson());
    }
  }

  void addUserNewQuizData(int quizId) {
    final userData = user!;

    List<UserDataAnswerModel> quizAnswersData = [];

    var questions =
        quizzes!.firstWhere((element) => element.id == quizId).questions;

    questions.forEach((element) => {
          quizAnswersData.add(new UserDataAnswerModel(
              questionId: element.id,
              isAnswered: false,
              answerChoiceId: 0,
              isRightAnswer: false))
        });

    UserDataQuizzModel quizData = new UserDataQuizzModel(
        id: quizId, answeredQuestions: 0, answersData: quizAnswersData);

    userData.quizzesData.add(quizData);

    repository.saveUserData(userData);
  }

  void setQuestionAnswered(
      int quizId, int questionId, int answerId, bool isRightAnswer) async {
    final userData = user!;

    userData.quizzesData
        .firstWhere((element) => element.id == quizId)
        .answeredQuestions += 1;

    userData.quizzesData
        .firstWhere((element) => element.id == quizId)
        .answersData
        .firstWhere((element) => element.questionId == questionId)
        .isAnswered = true;

    userData.quizzesData
        .firstWhere((element) => element.id == quizId)
        .answersData
        .firstWhere((element) => element.questionId == questionId)
        .answerChoiceId = answerId;

    userData.quizzesData
        .firstWhere((element) => element.id == quizId)
        .answersData
        .firstWhere((element) => element.questionId == questionId)
        .isRightAnswer = isRightAnswer;

    repository.saveUserData(userData);

    notifyListeners();
  }
}

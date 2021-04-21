import 'package:DevQuiz/core/app_images.dart';
import 'package:DevQuiz/home/widgets/home_state.dart';
import 'package:DevQuiz/shared/models/awnser_model.dart';
import 'package:DevQuiz/shared/models/question_model.dart';
import 'package:DevQuiz/shared/models/quiz_model.dart';
import 'package:DevQuiz/shared/models/user.model.dart';

class HomeController {
  HomeState state = HomeState.empty;

  UserModel? user;
  List<QuizModel>? quizzes;

  void getUser() {
    user = UserModel(
        name: "Lissone",
        photoUrl:
            "https://avatars.githubusercontent.com/u/57052110?s=400&u=3f60caf81f05629983bed45d9eaa3663fd90a390&v=4");
  }

  void getQuizzes() {
    quizzes = [
      QuizModel(
          title: "NLW 5 Flutter",
          image: AppImages.blocks,
          level: Level.facil,
          questions: [
            QuestionModel(title: "Está curtindo flutter?", awnsers: [
              AwnserModel(title: "Estou curtindo"),
              AwnserModel(title: "Amando Flutter"),
              AwnserModel(title: "Show de bola"),
              AwnserModel(title: "Bacana msm", isRight: true),
            ]),
            QuestionModel(title: "Está curtindo flutter?", awnsers: [
              AwnserModel(title: "Estou curtindo"),
              AwnserModel(title: "Amando Flutter"),
              AwnserModel(title: "Show de bola"),
              AwnserModel(title: "Bacana msm", isRight: true),
            ])
          ])
    ];
  }
}

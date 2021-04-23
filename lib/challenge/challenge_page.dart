import 'package:DevQuiz/challenge/challenge_controller.dart';
import 'package:DevQuiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:DevQuiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:DevQuiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:DevQuiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;

  const ChallengePage({Key? key, required this.questions}) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final challengeController = ChallengeController();
  final pageController = PageController();
  bool awnserSelected = false;

  @override
  void initState() {
    pageController.addListener(() {
      challengeController.currentPage = pageController.page!.toInt() + 1;
    });
    super.initState();
  }

  void nextPage() {
    pageController.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SafeArea(
            top: true,
            child: ValueListenableBuilder<int>(
              //buildar apenas um widget especifico a partir de um listener INT
              valueListenable: challengeController.currentPageNotifier,
              builder: (context, value, _) => QuestionIndicatorWidget(
                  currentPage: value, length: widget.questions.length),
            )),
      ),
      body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          children: widget.questions
              .map((e) => QuizWidget(
                    question: e,
                    onChange: () {
                      awnserSelected = true;
                    },
                  ))
              .toList()),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                  child: NextButtonWidget.white(
                label: 'Pular',
                onTap: nextPage,
              )),
              SizedBox(
                width: 7,
              ),
              Expanded(
                  child: NextButtonWidget.green(
                      label: 'Confirmar',
                      onTap: () {
                        if (awnserSelected) {
                          nextPage();
                          awnserSelected = false;
                        }
                      }))
            ],
          ),
        ),
      ),
    );
  }
}

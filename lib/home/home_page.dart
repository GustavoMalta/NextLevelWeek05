import 'package:DevQuiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/home/home_controller.dart';
import 'package:DevQuiz/home/home_state.dart';
import 'package:DevQuiz/home/widgets/app_bar/app_bar_widget.dart';
import 'package:DevQuiz/home/widgets/level_button/level_button_widget.dart';
import 'package:DevQuiz/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:DevQuiz/shared/models/user_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controler = HomeController();

  @override
  void initState() {
    super.initState();
    controler.getUser();
    controler.getQuizzes();
    controler.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controler.state != HomeState.success) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBarWidget(
          user: controler.user!,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LevelButtonWidget(label: "Fácil"),
                  LevelButtonWidget(label: "Médio"),
                  LevelButtonWidget(label: "Difícil"),
                  LevelButtonWidget(label: "Perito"),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Expanded(
                child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    children: controler.quizzes!
                        .map((e) => QuizCardWidget(
                            title: e.title,
                            percent: e.questionAnswerd / e.questions.length,
                            value:
                                "${e.questionAnswerd.toString()} de ${e.questions.length.toString()}",
                            image: e.imagem))
                        .toList()),
              )
            ],
          ),
        ),
      );
    }
  }
}

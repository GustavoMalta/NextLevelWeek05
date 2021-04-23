import 'package:DevQuiz/challenge/widgets/challenge_controller/challenge_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:DevQuiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:DevQuiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:DevQuiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:DevQuiz/shared/models/question_model.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  const ChallengePage({
    Key? key,
    required this.questions,
  }) : super(key: key);
  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();

  @override
  void initState() {
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt();
    });
    super.initState();
  }

  void nextPage() {
    pageController.nextPage(
        duration: Duration(milliseconds: 500), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130),
        child: SafeArea(
            top: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackButton(),
                ValueListenableBuilder<int>(
                    valueListenable: controller.currentPageNotifier,
                    builder: (context, value, _) => QuestionIndicatorWidget(
                          currentPage: value,
                          length: widget.questions.length,
                        ))
              ],
            )),
      ),
      body: PageView(
          controller: pageController,
          children: widget.questions
              .map((e) => QuizWidget(
                    question: e,
                    onSelect: nextPage,
                  ))
              .toList()),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: ValueListenableBuilder<int>(
          valueListenable: controller.currentPageNotifier,
          builder: (context, value, _) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              if (value < widget.questions.length)
                Expanded(
                    child: NextButtonWidget.white(
                  label: 'Pular',
                  onTap: nextPage,
                )),
              if (value == widget.questions.length)
                Expanded(
                    child: NextButtonWidget.green(
                        label: 'Corfirmar',
                        onTap: () {
                          Navigator.pop(context);
                        }))
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:DevQuiz/challenge/widgets/answer/answer_widget.dart';
import 'package:DevQuiz/core/core.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {
  final String title;

  const QuizWidget({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              title,
              style: AppTextStyles.heading,
            ),
          ),
          SizedBox(
            height: 24,
          ),
          AnswerWidget(
            title: "titulo da itulo da itulo da itulotulo da questao",
            isRight: true,
            isSelected: true,
          ),
          AnswerWidget(
            title: "titulo da itulo d itulo da itulo da questao",
            isSelected: true,
          ),
          AnswerWidget(title: "titulo da ilo da questao"),
          AnswerWidget(
              title: "titulo da itulo da itulo da itulo da i da questao"),
        ],
      ),
    );
  }
}

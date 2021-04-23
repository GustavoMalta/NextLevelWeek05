import 'package:DevQuiz/challenge/widgets/answer/answer_widget.dart';
import 'package:DevQuiz/challenge/widgets/quizz_controller/quizz_controller.dart';
import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/shared/models/answer_model.dart';
import 'package:DevQuiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final VoidCallback onSelect;

  const QuizWidget({Key? key, required this.question, required this.onSelect})
      : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;

  @override
  Widget build(BuildContext context) {
    final List<AnswerModel> answers = widget.question.answers;
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              widget.question.title,
              style: AppTextStyles.heading,
            ),
          ),
          SizedBox(
            height: 24,
          ),
          for (var i = 0; i < answers.length; i++)
            AnswerWidget(
              disabled: indexSelected != -1,
              answer: answers[i],
              isSelected: indexSelected == i,
              onTap: () {
                indexSelected = i;
                setState(() {});
                Future.delayed(Duration(seconds: 3))
                    .then((e) => widget.onSelect());
              },
            ),
        ],
      ),
    );
  }
}

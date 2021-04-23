import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final String value;
  final double percent;
  final String image;
  final VoidCallback onTap;

  QuizCardWidget(
      {Key? key,
      required this.title,
      required this.value,
      required this.percent,
      required this.image,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40,
              width: 40,
              child: Image.asset(AppImages.blocks),
              color: AppColors.darkRed,
            ),
            SizedBox(
              height: 24,
            ),
            Text(title, style: AppTextStyles.heading15),
            SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Text(
                      value,
                      style: AppTextStyles.body11,
                    )),
                Expanded(
                    flex: 2, child: ProgressIndicatorWidget(value: percent))
              ],
            )
          ],
        ),
      ),
    );
  }
}

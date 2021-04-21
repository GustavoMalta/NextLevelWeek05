import 'package:DevQuiz/core/core.dart';
import 'package:flutter/material.dart';

class ChartWidget extends StatelessWidget {
  final int percent;

  const ChartWidget({Key? key, this.percent = 0}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      child: Stack(
        children: [
          Center(
            child: Container(
              width: 80,
              height: 80,
              child: CircularProgressIndicator(
                strokeWidth: 10,
                value: percent / 100,
                backgroundColor: AppColors.chartSecondary,
                valueColor:
                    AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
              ),
            ),
          ),
          Center(
            child: Text(
              percent.toString() + '%',
              style: AppTextStyles.heading,
            ),
          )
        ],
      ),
    );
  }
}

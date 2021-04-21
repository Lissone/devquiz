import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/core/app_images.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final String image;
  final String completed;
  final double percent;

  const QuizCardWidget(
      {Key? key,
      required this.title,
      required this.image,
      required this.completed,
      required this.percent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            width: 40,
            child: Image.asset(image),
          ),
          SizedBox(height: 15),
          Text(
            title,
            style: AppTextStyles.heading15,
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                  flex: 1, child: Text(completed, style: AppTextStyles.body11)),
              SizedBox(width: 16),
              Expanded(flex: 4, child: ProgressIndicatorWidget(value: percent))
            ],
          )
        ],
      ),
    );
  }
}

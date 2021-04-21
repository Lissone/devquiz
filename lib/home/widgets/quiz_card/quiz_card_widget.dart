import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/core/app_images.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
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
            child: Image.asset(AppImages.blocks),
          ),
          SizedBox(height: 15),
          Text(
            "Gerenciamento de estado",
            style: AppTextStyles.heading15,
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                  flex: 1, child: Text("3/10", style: AppTextStyles.body11)),
              SizedBox(width: 16),
              Expanded(
                flex: 4,
                child: LinearProgressIndicator(
                    value: 0.3,
                    backgroundColor: AppColors.chartSecondary,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(AppColors.chartPrimary)),
              )
            ],
          )
        ],
      ),
    );
  }
}

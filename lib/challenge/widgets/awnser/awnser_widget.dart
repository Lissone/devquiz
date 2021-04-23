import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/shared/models/awnser_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AwnserWidget extends StatelessWidget {
  final AwnserModel awnser;
  final bool isSelected;
  final bool disabled;
  final VoidCallback onTap;

  const AwnserWidget(
      {Key? key,
      required this.awnser,
      required this.onTap,
      this.disabled = false,
      this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: IgnorePointer(
        ignoring: disabled,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: isSelected ? Colors.grey[340] : AppColors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.fromBorderSide(BorderSide(
                    color:
                        isSelected ? Colors.blue.shade700 : AppColors.border))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Text(awnser.title,
                        style: isSelected
                            ? GoogleFonts.notoSans(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: Colors.blue.shade700)
                            : AppTextStyles.body)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

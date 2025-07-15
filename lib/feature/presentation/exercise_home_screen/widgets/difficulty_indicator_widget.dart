import 'package:aletha_fitness/core/theme/theme.dart';
import 'package:aletha_fitness/utils/exercise_utils.dart';
import 'package:flutter/material.dart';

class DifficultyIndicatorWidget extends StatelessWidget {
  final String difficulty;
  const DifficultyIndicatorWidget({super.key, required this.difficulty});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppTheme.lightTheme.colorScheme.tertiary.withAlpha(26),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.02,
            height: MediaQuery.of(context).size.width * 0.02,
            decoration: BoxDecoration(
              color: AppTheme.lightTheme.colorScheme.tertiary,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 4),
          Text(
            ExerciseUtils.capitalizeFirst(difficulty),
            style: AppTheme.lightTheme.textTheme.labelSmall?.copyWith(
              color: AppTheme.lightTheme.colorScheme.tertiary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

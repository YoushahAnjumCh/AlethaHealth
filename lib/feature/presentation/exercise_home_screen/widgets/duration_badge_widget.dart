import 'package:aletha_fitness/core/theme/theme.dart';
import 'package:aletha_fitness/utils/exercise_utils.dart';
import 'package:flutter/material.dart';

class DurationBadgeWidget extends StatelessWidget {
  final int duration;
  const DurationBadgeWidget({super.key, required this.duration});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppTheme.lightTheme.colorScheme.primary.withAlpha(26),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.schedule,
            color: AppTheme.lightTheme.colorScheme.primary,
            size: MediaQuery.of(context).size.width * 0.04,
          ),

          SizedBox(width: 4),
          Text(
            ExerciseUtils.formatDuration(duration),
            style: AppTheme.lightTheme.textTheme.labelSmall?.copyWith(
              color: AppTheme.lightTheme.colorScheme.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

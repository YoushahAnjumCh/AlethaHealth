import 'package:aletha_fitness/core/theme/theme.dart';
import 'package:aletha_fitness/feature/domain/entity/exercise.dart';
import 'package:aletha_fitness/feature/presentation/exercise_home_screen/widgets/difficulty_indicator_widget.dart';
import 'package:aletha_fitness/feature/presentation/exercise_home_screen/widgets/duration_badge_widget.dart';

import 'package:aletha_fitness/utils/exercise_utils.dart';
import 'package:flutter/material.dart';

class ExerciseInfoWidget extends StatelessWidget {
  final Exercise exercise;
  final bool isCompleted;
  const ExerciseInfoWidget({
    super.key,
    required this.exercise,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  ExerciseUtils.capitalizeFirst(exercise.name),
                  style: AppTheme.lightTheme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: isCompleted
                        ? AppTheme.lightTheme.colorScheme.onSurfaceVariant
                        : AppTheme.lightTheme.colorScheme.onSurface,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (isCompleted)
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: AppTheme.lightTheme.colorScheme.tertiary,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.check,
                    color: AppTheme.lightTheme.colorScheme.onTertiary,
                  ),
                ),
            ],
          ),
          SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DurationBadgeWidget(duration: exercise.duration),
              SizedBox(height: 8),
              DifficultyIndicatorWidget(difficulty: exercise.difficulty),
            ],
          ),
        ],
      ),
    );
  }
}

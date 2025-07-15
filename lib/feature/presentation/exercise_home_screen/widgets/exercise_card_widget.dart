import 'package:aletha_fitness/core/theme/theme.dart';
import 'package:aletha_fitness/feature/domain/entity/exercise.dart';
import 'package:aletha_fitness/feature/presentation/exercise_home_screen/widgets/action_button_widget.dart';
import 'package:aletha_fitness/feature/presentation/exercise_home_screen/widgets/exercise_description.dart';
import 'package:aletha_fitness/feature/presentation/exercise_home_screen/widgets/exercise_info_widget.dart';
import 'package:aletha_fitness/feature/presentation/widgets/custom_image_widget.dart';
import 'package:flutter/material.dart';

class ExerciseCardWidget extends StatelessWidget {
  final Exercise exercise;
  final bool isCompleted;
  final VoidCallback onTap;
  final VoidCallback onTimerStart;
  final VoidCallback onToggleCompletion;

  const ExerciseCardWidget({
    super.key,
    required this.exercise,
    required this.isCompleted,
    required this.onTimerStart,
    required this.onTap,
    required this.onToggleCompletion,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Card(
        elevation: isCompleted ? 1 : 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: isCompleted
                  ? AppTheme.lightTheme.colorScheme.tertiary.withAlpha(13)
                  : AppTheme.lightTheme.colorScheme.surface,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CustomImageWidget(
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: MediaQuery.of(context).size.width * 0.15,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 12),
                    ExerciseInfoWidget(
                      exercise: exercise,
                      isCompleted: isCompleted,
                    ),
                  ],
                ),
                SizedBox(height: 16),
                ExerciseDescription(
                  description:
                      exercise.description ??
                      'No description available for this exercise.',
                  isCompleted: isCompleted,
                ),
                SizedBox(height: 16),
                ActionButtonWidget(
                  isCompleted: isCompleted,
                  onToggleCompletion: onToggleCompletion,
                  onTimerStart: onTimerStart,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

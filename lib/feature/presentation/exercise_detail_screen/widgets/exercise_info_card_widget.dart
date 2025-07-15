import 'package:aletha_fitness/core/theme/theme.dart';
import 'package:aletha_fitness/feature/domain/entity/exercise.dart';
import 'package:aletha_fitness/utils/exercise_utils.dart';
import 'package:flutter/material.dart';

class ExerciseInfoCardWidget extends StatelessWidget {
  final Exercise exerciseData;

  const ExerciseInfoCardWidget({super.key, required this.exerciseData});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppTheme.lightTheme.cardTheme.elevation,
      shape: AppTheme.lightTheme.cardTheme.shape,
      color: AppTheme.lightTheme.cardTheme.color,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Exercise Overview',
              style: AppTheme.lightTheme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppTheme.lightTheme.colorScheme.onSurface,
              ),
            ),
            SizedBox(height: 10),
            _buildInfoRow(
              context,
              icon: Icons.schedule,
              label: 'Duration',
              value: ExerciseUtils.formatDuration(exerciseData.duration),
              color: AppTheme.lightTheme.colorScheme.primary,
            ),
            SizedBox(height: 12),
            _buildInfoRow(
              context,
              icon: Icons.fitness_center,
              label: 'Difficulty',
              value: ExerciseUtils.capitalizeFirst(exerciseData.difficulty),
              color: AppTheme.lightTheme.colorScheme.tertiary,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color, size: 20),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: AppTheme.lightTheme.textTheme.labelMedium?.copyWith(
                  color: AppTheme.lightTheme.colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 6),
              Text(
                value,
                style: AppTheme.lightTheme.textTheme.bodyMedium?.copyWith(
                  color: AppTheme.lightTheme.colorScheme.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

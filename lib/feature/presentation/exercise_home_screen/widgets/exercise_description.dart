import 'package:aletha_fitness/core/theme/theme.dart';
import 'package:flutter/material.dart';

class ExerciseDescription extends StatelessWidget {
  final String description;
  final bool isCompleted;
  const ExerciseDescription({
    super.key,
    required this.description,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: AppTheme.lightTheme.textTheme.bodySmall?.copyWith(
        color: isCompleted
            ? AppTheme.lightTheme.colorScheme.onSurfaceVariant.withAlpha(179)
            : AppTheme.lightTheme.colorScheme.onSurfaceVariant,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}

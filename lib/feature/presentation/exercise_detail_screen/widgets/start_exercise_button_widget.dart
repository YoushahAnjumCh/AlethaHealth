import 'package:aletha_fitness/core/theme/theme.dart';
import 'package:flutter/material.dart';

class StartExerciseButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLoading;
  final bool isCompleted;

  const StartExerciseButtonWidget({
    super.key,
    required this.onPressed,
    required this.isLoading,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: isLoading ? null : onPressed,
      icon: Icon(
        Icons.play_arrow,
        color: AppTheme.lightTheme.colorScheme.onPrimary,
        size: 14,
      ),
      label: Text(
        isCompleted ? 'Start Again' : 'Start',
        style: AppTheme.lightTheme.textTheme.labelMedium?.copyWith(
          color: AppTheme.lightTheme.colorScheme.onPrimary,
          fontWeight: FontWeight.w600,
        ),
      ),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        minimumSize: const Size(double.infinity, 38),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}

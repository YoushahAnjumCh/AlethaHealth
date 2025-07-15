import 'package:aletha_fitness/core/theme/theme.dart';
import 'package:flutter/material.dart';

class ActionButtonWidget extends StatelessWidget {
  final bool isCompleted;
  final VoidCallback onToggleCompletion;
  final VoidCallback onTimerStart;
  const ActionButtonWidget({
    super.key,
    required this.isCompleted,
    required this.onToggleCompletion,
    required this.onTimerStart,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton.icon(
          onPressed: onToggleCompletion,
          icon: Icon(
            isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
            color: isCompleted
                ? AppTheme.lightTheme.colorScheme.tertiary
                : AppTheme.lightTheme.colorScheme.onSurfaceVariant,
          ),

          label: Text(
            isCompleted ? 'Completed' : 'Mark Complete',
            style: AppTheme.lightTheme.textTheme.labelMedium?.copyWith(
              color: isCompleted
                  ? AppTheme.lightTheme.colorScheme.tertiary
                  : AppTheme.lightTheme.colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w500,
            ),
          ),
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),
        ElevatedButton.icon(
          onPressed: onTimerStart,
          icon: Icon(
            Icons.play_arrow,
            color: AppTheme.lightTheme.colorScheme.onPrimary,
          ),
          label: Text(
            'Start',
            style: AppTheme.lightTheme.textTheme.labelMedium?.copyWith(
              color: AppTheme.lightTheme.colorScheme.onPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}

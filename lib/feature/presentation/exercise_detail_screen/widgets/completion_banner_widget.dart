import 'package:aletha_fitness/core/theme/theme.dart';
import 'package:flutter/material.dart';

class CompletionBannerWidget extends StatelessWidget {
  const CompletionBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.04,
        vertical: MediaQuery.of(context).size.height * 0.01,
      ),
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppTheme.lightTheme.colorScheme.tertiary.withValues(alpha: 0.1),
            AppTheme.lightTheme.colorScheme.tertiary.withValues(alpha: 0.05),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppTheme.lightTheme.colorScheme.tertiary.withValues(
            alpha: 0.3,
          ),
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
            decoration: BoxDecoration(
              color: AppTheme.lightTheme.colorScheme.tertiary,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.check,
              color: AppTheme.lightTheme.colorScheme.onTertiary,
              size: 20,
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.03),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Exercise Completed! 🎉',
                  style: AppTheme.lightTheme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppTheme.lightTheme.colorScheme.tertiary,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.005),
                Text(
                  'Great job on completing this exercise!',
                  style: AppTheme.lightTheme.textTheme.bodySmall?.copyWith(
                    color: AppTheme.lightTheme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.emoji_events,
            color: AppTheme.lightTheme.colorScheme.tertiary,
            size: 24,
          ),
        ],
      ),
    );
  }
}

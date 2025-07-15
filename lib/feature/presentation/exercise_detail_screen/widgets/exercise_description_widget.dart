import 'package:aletha_fitness/core/theme/theme.dart';
import 'package:flutter/material.dart';

class ExerciseDescriptionWidget extends StatelessWidget {
  final String description;

  const ExerciseDescriptionWidget({super.key, required this.description});

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
            Row(
              children: [
                Icon(
                  Icons.description,
                  color: AppTheme.lightTheme.colorScheme.primary,
                  size: 24,
                ),
                SizedBox(width: 10),
                Text(
                  'Instructions',
                  style: AppTheme.lightTheme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppTheme.lightTheme.colorScheme.onSurface,
                  ),
                ),
              ],
            ),
            SizedBox(height: 4),
            _buildDescriptionContent(context),
            SizedBox(height: 4),
            _buildTipsSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildDescriptionContent(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppTheme.lightTheme.colorScheme.secondaryContainer.withValues(
          alpha: 0.3,
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppTheme.lightTheme.colorScheme.outline.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Text(
        description.isNotEmpty
            ? description
            : 'No description available for this exercise. Please consult with a fitness professional for proper form and technique.',
        style: AppTheme.lightTheme.textTheme.bodyLarge?.copyWith(
          color: AppTheme.lightTheme.colorScheme.onSurface,
          height: 1.6,
          letterSpacing: 0.2,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget _buildTipsSection(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppTheme.lightTheme.colorScheme.tertiary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppTheme.lightTheme.colorScheme.tertiary.withValues(
            alpha: 0.3,
          ),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.lightbulb_outline,
                color: AppTheme.lightTheme.colorScheme.tertiary,
                size: 20,
              ),
              SizedBox(width: 6),
              Text(
                'Safety Tips',
                style: AppTheme.lightTheme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppTheme.lightTheme.colorScheme.tertiary,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          _buildTipItem(context, 'Warm up before starting the exercise'),
          _buildTipItem(context, 'Focus on proper form over speed'),
          _buildTipItem(context, 'Stop if you feel any pain or discomfort'),
          _buildTipItem(context, 'Stay hydrated throughout the workout'),
        ],
      ),
    );
  }

  Widget _buildTipItem(BuildContext context, String tip) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 8, right: 9),
            width: 4,
            height: 4,
            decoration: BoxDecoration(
              color: AppTheme.lightTheme.colorScheme.tertiary,
              shape: BoxShape.circle,
            ),
          ),
          Expanded(
            child: Text(
              tip,
              style: AppTheme.lightTheme.textTheme.bodyMedium?.copyWith(
                color: AppTheme.lightTheme.colorScheme.onSurface,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

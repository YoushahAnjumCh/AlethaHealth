
import 'package:aletha_fitness/feature/presentation/exercise_home_screen/provider/streak_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StreakTrackerWidget extends StatelessWidget {
  const StreakTrackerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StreakProvider>(
      builder: (context, streakProvider, child) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.local_fire_department, color: Colors.orangeAccent),
              const SizedBox(width: 8),
              Text(
                '${streakProvider.streak} Day Streak',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
        );
      },
    );
  }
}

// 4. Extracted Controls Widget
import 'package:aletha_fitness/feature/presentation/exercise_timer_screen/provider/exercise_timer_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerControlWidget extends StatelessWidget {
  const TimerControlWidget({super.key, required this.onPausePressed});

  final VoidCallback onPausePressed;

  @override
  Widget build(BuildContext context) {
    final timerModel = context.watch<ExerciseTimerProvider>();

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(
          scale: animation,
          child: FadeTransition(opacity: animation, child: child),
        );
      },
      child: switch (timerModel.status) {
        TimerStatus.running => _buildRunningControls(context, onPausePressed),
        TimerStatus.paused => _buildPausedControls(context, timerModel),
        TimerStatus.finished => _buildFinishedControls(context, timerModel),
        TimerStatus.initial => _buildInitialControls(context, timerModel),
      },
    );
  }

  // Each control state is a simple, stateless function for clarity
  Widget _buildInitialControls(
    BuildContext context,
    ExerciseTimerProvider timerModel,
  ) {
    return Column(
      key: const ValueKey('initial'),
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.onPrimary,
            foregroundColor: Theme.of(context).colorScheme.primary,
            minimumSize: const Size(200, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: () => timerModel.startTimer(),
          child: const Text('START', style: TextStyle(fontSize: 18)),
        ),
      ],
    );
  }

  Widget _buildRunningControls(
    BuildContext context,
    VoidCallback onPausePressed,
  ) {
    return Row(
      key: const ValueKey('running'),
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(
              context,
            ).colorScheme.onPrimary.withAlpha(51),
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: onPausePressed,
          icon: const Icon(Icons.pause),
          label: const Text('PAUSE'),
        ),
      ],
    );
  }

  Widget _buildPausedControls(
    BuildContext context,
    ExerciseTimerProvider timerModel,
  ) {
    final theme = Theme.of(context);
    return Row(
      key: const ValueKey('paused'),
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            foregroundColor: theme.colorScheme.onPrimary,
            side: BorderSide(color: theme.colorScheme.onPrimary.withAlpha(128)),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: () => timerModel.restartTimer(),
          child: const Text('Restart'),
        ),
        const SizedBox(width: 20),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: theme.colorScheme.onPrimary,
            foregroundColor: theme.colorScheme.primary,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: () => timerModel.resumeTimer(),
          icon: const Icon(Icons.play_arrow),
          label: const Text('RESUME'),
        ),
      ],
    );
  }

  Widget _buildFinishedControls(
    BuildContext context,
    ExerciseTimerProvider timerModel,
  ) {
    final theme = Theme.of(context);
    return Column(
      key: const ValueKey('finished'),
      children: [
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: theme.colorScheme.secondary,
            foregroundColor: theme.colorScheme.onSecondary,
            minimumSize: const Size(220, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: () {
            timerModel.restartTimer();
            timerModel.startTimer();
          },
          icon: const Icon(Icons.replay),
          label: const Text('DO IT AGAIN!', style: TextStyle(fontSize: 18)),
        ),
      ],
    );
  }
}

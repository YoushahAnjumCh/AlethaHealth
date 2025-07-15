import 'package:aletha_fitness/feature/presentation/exercise_timer_screen/provider/exercise_timer_provider.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerCountDownWidget extends StatelessWidget {
  const TimerCountDownWidget({
    super.key,
    required this.isRunning,
    required this.slideAnimation,
    required this.fadeAnimation,
    required this.onComplete,
  });

  final bool isRunning;
  final Animation<Offset> slideAnimation;
  final Animation<double> fadeAnimation;
  final VoidCallback onComplete;

  @override
  Widget build(BuildContext context) {
    final timerModel = context.watch<ExerciseTimerProvider>();
    final theme = Theme.of(context);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      transform: Matrix4.identity()..scale(isRunning ? 1.05 : 1.0),
      transformAlignment: Alignment.center,
      child: SlideTransition(
        position: slideAnimation,
        child: FadeTransition(
          opacity: fadeAnimation,
          child: CircularCountDownTimer(
            duration: timerModel.duration,
            controller: timerModel.controller,
            width: 220,
            height: 220,
            ringColor: theme.colorScheme.onPrimary.withAlpha(77),
            fillColor: theme.colorScheme.primary,
            backgroundColor: theme.colorScheme.onTertiary.withAlpha(102),
            strokeWidth: 15.0,
            strokeCap: StrokeCap.round,
            textStyle: theme.textTheme.displayMedium?.copyWith(
              color: theme.colorScheme.onPrimary,
              fontWeight: FontWeight.bold,
            ),
            textFormat: CountdownTextFormat.MM_SS,
            isReverse: true,
            isReverseAnimation: true,
            autoStart: false,
            onComplete: onComplete,
          ),
        ),
      ),
    );
  }
}

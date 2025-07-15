import 'package:aletha_fitness/core/routes/app_routes.dart';

import 'package:aletha_fitness/feature/domain/entity/exercise.dart';
import 'package:aletha_fitness/feature/presentation/exercise_detail_screen/provider/exercise_completion_provider.dart';
import 'package:aletha_fitness/feature/presentation/exercise_home_screen/provider/streak_provider.dart';
import 'package:aletha_fitness/feature/presentation/exercise_timer_screen/provider/exercise_timer_provider.dart';
import 'package:aletha_fitness/feature/presentation/exercise_timer_screen/widgets/time_control_widget.dart';
import 'package:aletha_fitness/feature/presentation/exercise_timer_screen/widgets/timer_count_down_widget.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ExerciseTimerScreen extends StatelessWidget {
  final Exercise exercise;
  const ExerciseTimerScreen({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) =>
          ExerciseTimerProvider()..initializeDuration(exercise.duration),
      child: _ExerciseTimerView(exercise: exercise),
    );
  }
}

class _ExerciseTimerView extends StatefulWidget {
  final Exercise exercise;
  const _ExerciseTimerView({required this.exercise});

  @override
  State<_ExerciseTimerView> createState() => _ExerciseTimerViewState();
}

class _ExerciseTimerViewState extends State<_ExerciseTimerView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );
    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeOutCubic,
          ),
        );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTimerComplete() {
    final timerProvider = context.read<ExerciseTimerProvider>();
    final completionProvider = context.read<ExerciseCompletionProvider>();

    timerProvider.onComplete();
    completionProvider.toggleCompletion(widget.exercise.id);
    context.read<StreakProvider>().recordExercise();
    Fluttertoast.showToast(
      msg: '🎉 Well done! Exercise Complete!',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      textColor: Colors.white,
    );

    if (mounted) {
      context.pushReplacement(GoRouterPaths.homeScreen);
    }
  }

  void _showStopDialog() {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text('Stop Exercise?'),
        content: Text('Your progress will be paused.'),
        actions: [
          TextButton(
            child: const Text('Continue'),
            onPressed: () => Navigator.of(dialogContext).pop(),
          ),
          TextButton(
            child: Text(
              'Stop',
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
            onPressed: () {
              context.read<ExerciseTimerProvider>().pauseTimer();
              Navigator.of(dialogContext).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isRunning =
        context.watch<ExerciseTimerProvider>().status == TimerStatus.running;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.exercise.name),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.center,
            colors: [
              theme.colorScheme.primary.withAlpha(204),
              theme.colorScheme.secondary.withAlpha(204),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              TimerCountDownWidget(
                isRunning: isRunning,
                slideAnimation: _slideAnimation,
                fadeAnimation: _fadeAnimation,
                onComplete: _onTimerComplete,
              ),
              const SizedBox(height: 50),
              FadeTransition(
                opacity: _fadeAnimation,
                child: TimerControlWidget(onPausePressed: _showStopDialog),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

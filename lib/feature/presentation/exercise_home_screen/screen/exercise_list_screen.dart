import 'package:aletha_fitness/core/routes/app_routes.dart';
import 'package:aletha_fitness/core/theme/theme.dart';
import 'package:aletha_fitness/feature/domain/entity/exercise.dart';
import 'package:aletha_fitness/feature/presentation/exercise_detail_screen/provider/exercise_completion_provider.dart';
import 'package:aletha_fitness/feature/presentation/exercise_home_screen/bloc/exercise_list_bloc.dart';
import 'package:aletha_fitness/feature/presentation/exercise_home_screen/provider/streak_provider.dart';
import 'package:aletha_fitness/feature/presentation/exercise_home_screen/widgets/exercise_card_widget.dart';
import 'package:aletha_fitness/feature/presentation/exercise_home_screen/widgets/streak_tracker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ExerciseListScreen extends StatefulWidget {
  const ExerciseListScreen({super.key});

  @override
  State<ExerciseListScreen> createState() => _ExerciseListScreenState();
}

class _ExerciseListScreenState extends State<ExerciseListScreen> {
  Future<void> _onRefresh() async {
    context.read<ExerciseListBloc>().add(FetchExercises());
    Fluttertoast.showToast(
      msg: "Exercises updated successfully",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: AppTheme.lightTheme.colorScheme.tertiary,
      textColor: Colors.white,
    );
  }

  void _onExerciseTap(Exercise exercise) {
    context.push(
      GoRouterPaths.exerciseDetailRoute,
      extra: {'exercise': exercise},
    );
  }

  Future<void> _startExerciseTimerTap(Exercise exercise) async {
    if (!mounted) return;
    try {
      await Provider.of<ExerciseCompletionProvider>(
        context,
        listen: false,
      ).startExercise(exercise.id);

      if (!mounted) return;
      context.push(
        GoRouterPaths.exerciseTimerRoute,
        extra: {'exercise': exercise},
      );
    } catch (e) {
      debugPrint('Navigation error: $e');
    }
  }

  Future<void> _toggleExerciseCompletion(String exerciseId) async {
    final exerciseProvider = context.read<ExerciseCompletionProvider>();
    final streakProvider = context.read<StreakProvider>();

    if (!mounted) return;

    await exerciseProvider.toggleCompletion(exerciseId);

    if (!mounted) return;

    if (exerciseProvider.isExerciseCompleted(exerciseId)) {
      await streakProvider.recordExercise();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Aletha Fitness',
          style: AppTheme.lightTheme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
            color: AppTheme.lightTheme.colorScheme.primary,
          ),
        ),
      ),
      backgroundColor: AppTheme.lightTheme.scaffoldBackgroundColor,
      body: Column(
        children: [
          const StreakTrackerWidget(),
          Expanded(
            child: BlocBuilder<ExerciseListBloc, ExerciseListState>(
              builder: (context, state) {
                return RefreshIndicator(
                  onRefresh: _onRefresh,
                  color: AppTheme.lightTheme.colorScheme.primary,
                  backgroundColor: AppTheme.lightTheme.colorScheme.surface,
                  child: _buildContent(state),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(ExerciseListState state) {
    if (state.isLoading) {
      return _buildLoadingState();
    } else if (state.exercises.isNotEmpty) {
      return _buildExerciseList(state.exercises);
    } else if (state.errorMessage != null) {
      return _buildErrorState(state.errorMessage!);
    } else {
      return _buildEmptyState();
    }
  }

  Widget _buildLoadingState() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: 6,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 16.0),
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                          color: AppTheme.lightTheme.colorScheme.outline
                              .withAlpha(77),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      const SizedBox(width: 12.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 160.0,
                              height: 16,
                              decoration: BoxDecoration(
                                color: AppTheme.lightTheme.colorScheme.outline
                                    .withAlpha(77),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Container(
                              width: 80.0,
                              height: 12,
                              decoration: BoxDecoration(
                                color: AppTheme.lightTheme.colorScheme.outline
                                    .withAlpha(77),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Container(
                    width: double.infinity,
                    height: 12,
                    decoration: BoxDecoration(
                      color: AppTheme.lightTheme.colorScheme.outline.withAlpha(
                        77,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Container(
                    width: 240.0,
                    height: 12,
                    decoration: BoxDecoration(
                      color: AppTheme.lightTheme.colorScheme.outline.withAlpha(
                        77,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildErrorState(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, color: AppTheme.errorLight, size: 48),
            const SizedBox(height: 24.0),
            Text(
              'Oops! Something went wrong',
              style: AppTheme.lightTheme.textTheme.headlineSmall?.copyWith(
                color: AppTheme.lightTheme.colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16.0),
            Text(
              message,
              style: AppTheme.lightTheme.textTheme.bodyMedium?.copyWith(
                color: AppTheme.lightTheme.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32.0),
            ElevatedButton.icon(
              onPressed: () =>
                  context.read<ExerciseListBloc>().add(FetchExercises()),
              icon: const Icon(Icons.refresh),
              label: const Text('Try Again'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 12.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.fitness_center,
              color: theme.colorScheme.primary,
              size: 48,
            ),
            const SizedBox(height: 24.0),
            Text(
              'No Exercises Available',
              style: theme.textTheme.headlineSmall?.copyWith(
                color: theme.colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16.0),
            TextButton.icon(
              icon: const Icon(Icons.refresh),
              label: const Text("Reload"),
              onPressed: () =>
                  context.read<ExerciseListBloc>().add(FetchExercises()),
              style: TextButton.styleFrom(
                foregroundColor: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: 32.0),
            Text(
              "Or pull down to refresh",
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 8.0),
            Icon(
              Icons.keyboard_arrow_down,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExerciseList(List<Exercise> exercises) {
    return Consumer<ExerciseCompletionProvider>(
      builder: (context, completionProvider, child) {
        for (var exercise in exercises) {
          completionProvider.checkCompletionStatus(exercise.id);
        }
        return ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: exercises.length,
          itemBuilder: (context, index) {
            final exercise = exercises[index];
            return ExerciseCardWidget(
              onTimerStart: () => _startExerciseTimerTap(exercise),
              exercise: exercise,
              isCompleted: completionProvider.isExerciseCompleted(exercise.id),
              onTap: () => _onExerciseTap(exercise),
              onToggleCompletion: () => _toggleExerciseCompletion(exercise.id),
            );
          },
        );
      },
    );
  }
}

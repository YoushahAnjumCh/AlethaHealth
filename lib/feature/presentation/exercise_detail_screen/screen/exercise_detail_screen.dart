import 'package:aletha_fitness/core/routes/app_routes.dart';
import 'package:aletha_fitness/core/theme/theme.dart';
import 'package:aletha_fitness/feature/domain/entity/exercise.dart';
import 'package:aletha_fitness/feature/presentation/exercise_detail_screen/provider/exercise_completion_provider.dart';
import 'package:aletha_fitness/feature/presentation/exercise_detail_screen/widgets/completion_banner_widget.dart';
import 'package:aletha_fitness/feature/presentation/exercise_detail_screen/widgets/exercise_description_widget.dart';
import 'package:aletha_fitness/feature/presentation/exercise_detail_screen/widgets/exercise_info_card_widget.dart';
import 'package:aletha_fitness/feature/presentation/exercise_detail_screen/widgets/start_exercise_button_widget.dart';
import 'package:aletha_fitness/utils/exercise_utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ExerciseDetailScreen extends StatefulWidget {
  final Exercise exercise;
  const ExerciseDetailScreen({super.key, required this.exercise});

  @override
  State<ExerciseDetailScreen> createState() => _ExerciseDetailScreenState();
}

class _ExerciseDetailScreenState extends State<ExerciseDetailScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ExerciseCompletionProvider>(
        context,
        listen: false,
      ).checkCompletionStatus(widget.exercise.id);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _startExercise() async {
    try {
      await Provider.of<ExerciseCompletionProvider>(
        context,
        listen: false,
      ).startExercise(widget.exercise.id);

      if (!mounted) return;

      context.push(
        GoRouterPaths.exerciseTimerRoute,
        extra: {'exercise': widget.exercise},
      );
    } catch (e) {
      debugPrint('Navigation error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.lightTheme.scaffoldBackgroundColor,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppTheme.lightTheme.appBarTheme.backgroundColor,
      elevation: AppTheme.lightTheme.appBarTheme.elevation,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(
          Icons.chevron_left,
          color: AppTheme.lightTheme.colorScheme.onSurface,
          size: 24,
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Consumer<ExerciseCompletionProvider>(
      builder: (context, completionProvider, child) {
        final isCompleted = completionProvider.isExerciseCompleted(
          widget.exercise.id,
        );
        return SafeArea(
          child: Column(
            children: [
              if (isCompleted) CompletionBannerWidget(),
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeroTitle(),
                      SizedBox(height: 8),

                      //Exercise Overview
                      ExerciseInfoCardWidget(exerciseData: widget.exercise),
                      SizedBox(height: 16),

                      //Exercise Instructions
                      ExerciseDescriptionWidget(
                        description:
                            widget.exercise.description ??
                            'No description available for this exercise.',
                      ),
                      SizedBox(height: 12),
                    ],
                  ),
                ),
              ),
              _buildStickyButton(isCompleted, completionProvider),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeroTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ExerciseUtils.capitalizeFirst(widget.exercise.name),
          style: AppTheme.lightTheme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w700,
            color: AppTheme.lightTheme.colorScheme.onSurface,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildStickyButton(
    bool isCompleted,
    ExerciseCompletionProvider completionProvider,
  ) {
    return Container(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
      decoration: BoxDecoration(
        color: AppTheme.lightTheme.scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: AppTheme.lightTheme.colorScheme.shadow,
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),

      child: SafeArea(
        top: false,
        child: StartExerciseButtonWidget(
          onPressed: _startExercise,
          isLoading: completionProvider.isStartingExercise,
          isCompleted: isCompleted,
        ),
      ),
    );
  }
}

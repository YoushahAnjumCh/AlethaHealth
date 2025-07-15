import 'package:aletha_fitness/feature/domain/entity/exercise.dart';
import 'package:aletha_fitness/feature/presentation/exercise_detail_screen/screen/exercise_detail_screen.dart';
import 'package:aletha_fitness/feature/presentation/exercise_home_screen/screen/exercise_list_screen.dart';
import 'package:aletha_fitness/feature/presentation/exercise_timer_screen/screen/exercise_timer_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();
  AppRouter();
  late final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: GoRouterPaths.homeScreen,

    routes: [
      GoRoute(
        path: GoRouterPaths.homeScreen,
        builder: (context, state) => ExerciseListScreen(),
      ),

      GoRoute(
        path: GoRouterPaths.exerciseTimerRoute,
        pageBuilder: (BuildContext context, GoRouterState state) {
          final extra = state.extra as Map<String, dynamic>;
          final exercise = extra['exercise'] as Exercise;
          return CustomTransitionPage(
            key: state.pageKey,
            child: ExerciseTimerScreen(exercise: exercise),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: ScaleTransition(
                      scale: Tween<double>(
                        begin: 1.2,
                        end: 1.0,
                      ).animate(animation),
                      child: ScaleTransition(
                        scale: Tween<double>(
                          begin: 1.0,
                          end: 0.8,
                        ).animate(secondaryAnimation),
                        child: child,
                      ),
                    ),
                  );
                },
          );
        },
      ),

      GoRoute(
        path: GoRouterPaths.exerciseDetailRoute,
        pageBuilder: (BuildContext context, GoRouterState state) {
          final extra = state.extra as Map<String, dynamic>;
          final exercise = extra['exercise'] as Exercise;
          return CustomTransitionPage(
            key: state.pageKey,
            child: ExerciseDetailScreen(exercise: exercise),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: ScaleTransition(
                      scale: Tween<double>(
                        begin: 1.2,
                        end: 1.0,
                      ).animate(animation),
                      child: ScaleTransition(
                        scale: Tween<double>(
                          begin: 1.0,
                          end: 0.8,
                        ).animate(secondaryAnimation),
                        child: child,
                      ),
                    ),
                  );
                },
          );
        },
      ),
    ],
  );
}

class GoRouterPaths {
  static const homeScreen = "/";
  static const exerciseDetailRoute = "/exerciseDetailScreen";
  static const exerciseTimerRoute = "/exerciseTimerScreen";
}

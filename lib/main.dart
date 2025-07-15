import 'package:aletha_fitness/core/constant/string_constant.dart';
import 'package:aletha_fitness/core/routes/app_routes.dart';
import 'package:aletha_fitness/core/theme/theme.dart';
import 'package:aletha_fitness/dependency_injection/service_locator.dart';
import 'package:aletha_fitness/feature/presentation/exercise_detail_screen/provider/exercise_completion_provider.dart';
import 'package:aletha_fitness/feature/presentation/exercise_home_screen/bloc/exercise_list_bloc.dart';
import 'package:aletha_fitness/feature/presentation/exercise_home_screen/provider/streak_provider.dart';
import 'package:aletha_fitness/feature/presentation/exercise_timer_screen/provider/exercise_timer_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AppRouter appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<ExerciseListBloc>()..add(FetchExercises()),
        ),
        ChangeNotifierProvider(create: (_) => ExerciseCompletionProvider()),
        ChangeNotifierProvider(create: (_) => ExerciseTimerProvider()),
        ChangeNotifierProvider(create: (_) => StreakProvider()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerDelegate: appRouter.router.routerDelegate,
        routeInformationParser: appRouter.router.routeInformationParser,
        routeInformationProvider: appRouter.router.routeInformationProvider,
        title: StringConstant.appName,
        theme: AppTheme.lightTheme,
        themeMode: ThemeMode.light,
      ),
    );
  }
}

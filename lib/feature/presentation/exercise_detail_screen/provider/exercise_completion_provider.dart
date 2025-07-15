import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

class ExerciseCompletionProvider extends ChangeNotifier {
  final Map<String, bool> _completionStatus = {};
  final Map<String, DateTime?> _completionTimes = {};
  bool _isStartingExercise = false;

  bool get isStartingExercise => _isStartingExercise;

  bool isExerciseCompleted(String exerciseId) {
    return _completionStatus[exerciseId] ?? false;
  }

  DateTime? getCompletionTime(String exerciseId) {
    return _completionTimes[exerciseId];
  }

  Future<void> checkCompletionStatus(String exerciseId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final completedExercises =
          prefs.getStringList('completed_exercises') ?? [];

      _completionStatus[exerciseId] = completedExercises.contains(exerciseId);
      final completionTimestamp = prefs.getString(
        'completion_time_$exerciseId',
      );
      _completionTimes[exerciseId] = completionTimestamp != null
          ? DateTime.parse(completionTimestamp)
          : null;

      notifyListeners();
    } catch (e) {
      debugPrint('Error checking completion status: $e');
    }
  }

  Future<void> toggleCompletion(String exerciseId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final completedExercises =
          prefs.getStringList('completed_exercises') ?? [];

      if (completedExercises.contains(exerciseId)) {
        completedExercises.remove(exerciseId);
        await prefs.remove('completion_time_$exerciseId');
        _completionStatus[exerciseId] = false;
        _completionTimes[exerciseId] = null;
      } else {
        completedExercises.add(exerciseId);
        final now = DateTime.now();
        await prefs.setString(
          'completion_time_$exerciseId',
          now.toIso8601String(),
        );
        _completionStatus[exerciseId] = true;
        _completionTimes[exerciseId] = now;
      }

      await prefs.setStringList('completed_exercises', completedExercises);
      notifyListeners();
    } catch (e) {
      debugPrint('Error toggling completion: $e');
    }
  }

  Future<void> startExercise(String exerciseId) async {
    try {
      _isStartingExercise = true;
      notifyListeners();

      HapticFeedback.mediumImpact();
      await Future.delayed(const Duration(milliseconds: 800));

      _isStartingExercise = false;
      notifyListeners();
    } catch (e) {
      debugPrint('Error starting exercise: $e');
      _isStartingExercise = false;
      notifyListeners();
    }
  }
}

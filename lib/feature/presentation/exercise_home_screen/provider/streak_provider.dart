
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StreakProvider with ChangeNotifier {
  static const String _lastExerciseDateKey = 'last_exercise_date';
  static const String _streakCountKey = 'streak_count';

  int _streak = 0;
  DateTime? _lastExerciseDate;

  int get streak => _streak;

  StreakProvider() {
    _loadStreak();
  }

  Future<void> _loadStreak() async {
    final prefs = await SharedPreferences.getInstance();
    final lastDateString = prefs.getString(_lastExerciseDateKey);
    if (lastDateString != null) {
      _lastExerciseDate = DateTime.parse(lastDateString);
      _streak = prefs.getInt(_streakCountKey) ?? 0;
      _updateStreak();
    }
    notifyListeners();
  }

  void _updateStreak() {
    if (_lastExerciseDate == null) {
      _streak = 0;
      return;
    }

    final now = DateTime.now();
    final difference = now.difference(_lastExerciseDate!).inDays;

    if (difference > 1) {
      _streak = 0;
    }
  }

  Future<void> recordExercise() async {
    final prefs = await SharedPreferences.getInstance();
    final now = DateTime.now();

    if (_lastExerciseDate == null) {
      _streak = 1;
    } else {
      final difference = now.difference(_lastExerciseDate!).inDays;
      if (difference == 1) {
        _streak++;
      } else if (difference > 1) {
        _streak = 1;
      }
    }

    _lastExerciseDate = now;
    await prefs.setString(_lastExerciseDateKey, now.toIso8601String());
    await prefs.setInt(_streakCountKey, _streak);
    notifyListeners();
  }
}

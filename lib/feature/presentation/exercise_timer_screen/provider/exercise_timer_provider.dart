import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

// Enum to represent the different states of our timer
enum TimerStatus { initial, running, paused, finished }

class ExerciseTimerProvider with ChangeNotifier {
  final CountDownController _controller = CountDownController();
  int _duration = 0;
  TimerStatus _status = TimerStatus.initial; // Track the current status

  // Public getters
  CountDownController get controller => _controller;
  int get duration => _duration;
  TimerStatus get status => _status;

  void initializeDuration(int newDuration) {
    _duration = newDuration;
  }

  void startTimer() {
    _controller.start();
    _status = TimerStatus.running;
    notifyListeners();
  }

  void pauseTimer() {
    _controller.pause();
    _status = TimerStatus.paused;
    notifyListeners();
  }

  void resumeTimer() {
    _controller.resume();
    _status = TimerStatus.running;
    notifyListeners();
  }

  void restartTimer() {
    _controller.restart(duration: _duration);
    _status = TimerStatus.paused; // Restarting goes to a paused state initially
    notifyListeners();
  }

  void onComplete() {
    _status = TimerStatus.finished;
    notifyListeners();
  }
}

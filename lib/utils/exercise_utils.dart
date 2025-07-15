class ExerciseUtils {
  static String formatDuration(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;

    if (minutes == 0) {
      return '$remainingSeconds second${remainingSeconds != 1 ? 's' : ''}';
    }

    return '$minutes minute${minutes != 1 ? 's' : ''} $remainingSeconds second${remainingSeconds != 1 ? 's' : ''}';
  }

  static String capitalizeFirst(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }
}

part of 'exercise_list_bloc.dart';

class ExerciseListState extends Equatable {
  final List<Exercise> exercises;
  final bool isLoading;
  final String? errorMessage;

  const ExerciseListState({
    required this.exercises,
    this.isLoading = false,
    this.errorMessage,
  });

  ExerciseListState copyWith({
    List<Exercise>? exercises,
    bool? isLoading,
    String? errorMessage,
  }) {
    return ExerciseListState(
      exercises: exercises ?? this.exercises,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [exercises, isLoading, errorMessage];
}

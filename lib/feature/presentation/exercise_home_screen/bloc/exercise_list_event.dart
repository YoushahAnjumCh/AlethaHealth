part of 'exercise_list_bloc.dart';

abstract class ExerciseListEvent extends Equatable {
  const ExerciseListEvent();

  @override
  List<Object> get props => [];
}

class FetchExercises extends ExerciseListEvent {}

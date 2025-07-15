import 'package:aletha_fitness/feature/domain/entity/exercise.dart';
import 'package:aletha_fitness/feature/domain/repository/exercise_repository.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'exercise_list_event.dart';
part 'exercise_list_state.dart';

class ExerciseListBloc extends Bloc<ExerciseListEvent, ExerciseListState> {
  final ExerciseRepository _exerciseRepository;

  ExerciseListBloc(this._exerciseRepository)
    : super(const ExerciseListState(exercises: [])) {
    on((event, emit) async {
      emit(const ExerciseListState(isLoading: true, exercises: []));
      try {
        final exercises = await _exerciseRepository.getExercises();
        exercises.fold(
          (left) => emit(
            ExerciseListState(
              exercises: [],
              errorMessage: left.errorMessage,
              isLoading: false,
            ),
          ),
          (exercise) {
            emit(ExerciseListState(exercises: exercise, isLoading: false));
          },
        );
      } catch (e) {
        emit(
          const ExerciseListState(
            exercises: [],
            errorMessage: 'Failed to fetch exercises',
            isLoading: false,
          ),
        );
      }
    });
  }
}

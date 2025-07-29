import 'package:aletha_fitness/feature/domain/entity/exercise.dart';
import 'package:aletha_fitness/feature/domain/usecase/exercise_usecase.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'exercise_list_event.dart';
part 'exercise_list_state.dart';

class ExerciseListBloc extends Bloc<ExerciseListEvent, ExerciseListState> {
  final ExerciseUsecase _exerciseUsecase;

  ExerciseListBloc(this._exerciseUsecase)
    : super(const ExerciseListState(exercises: [])) {
    on((event, emit) async {
      emit(const ExerciseListState(isLoading: true, exercises: []));
      try {
        final exercises = await _exerciseUsecase.getExercise();
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

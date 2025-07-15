import 'package:aletha_fitness/core/failure/failure.dart';
import 'package:aletha_fitness/feature/domain/entity/exercise.dart';
import 'package:aletha_fitness/feature/domain/repository/exercise_repository.dart';
import 'package:either_dart/either.dart';

class ExerciseUsecase {
  final ExerciseRepository repository;
  ExerciseUsecase(this.repository);

  Future<Either<Failure, List<Exercise>>> getExercise() async {
    return await repository.getExercises();
  }
}

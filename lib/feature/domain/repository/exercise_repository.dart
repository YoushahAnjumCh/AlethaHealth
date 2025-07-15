import 'package:aletha_fitness/core/failure/failure.dart';
import 'package:aletha_fitness/feature/domain/entity/exercise.dart';
import 'package:either_dart/either.dart';

abstract class ExerciseRepository {
  Future<Either<Failure, List<Exercise>>> getExercises();
}

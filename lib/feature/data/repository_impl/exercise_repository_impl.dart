import 'dart:io';
import 'package:aletha_fitness/core/failure/failure.dart';
import 'package:aletha_fitness/core/network_info/network_info.dart';
import 'package:aletha_fitness/feature/data/data_sources/exercise_data_source.dart';
import 'package:aletha_fitness/feature/domain/entity/exercise.dart';
import 'package:aletha_fitness/feature/domain/repository/exercise_repository.dart';
import 'package:either_dart/either.dart';

class ExerciseRepositoryImpl extends ExerciseRepository {
  final ExerciseDataSource dataSource;
  final NetworkInfo networkInfo;
  ExerciseRepositoryImpl({required this.dataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<Exercise>>> getExercises() async {
    if (await networkInfo.isConnected) {
      try {
        final products = await dataSource.getExercises();
        return Right(products);
      } on ServerFailure catch (e) {
        return Left(ServerFailure(e.errorMessage.toString(), e.errorCode));
      } on SocketException catch (e) {
        return Left(ServerFailure(e.message, 500));
      }
    } else {
      return Left(ConnectionFailure("Please check your Internet"));
    }
  }
}

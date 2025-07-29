import 'dart:convert';
import 'package:aletha_fitness/core/failure/failure.dart';
import 'package:aletha_fitness/feature/data/model/exercise_model.dart';
import 'package:http/http.dart' as http;

abstract class ExerciseDataSource {
  Future<List<ExerciseModel>> getExercises();
}

class ExerciseDataSourceImpl implements ExerciseDataSource {
  final http.Client client;

  ExerciseDataSourceImpl({required this.client});

  @override
  Future<List<ExerciseModel>> getExercises() async {
    try {
      final response = await client.get(
        Uri.parse('https://68252ec20f0188d7e72c394f.mockapi.io/dev/workouts'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        return jsonList.map((json) => ExerciseModel.fromJson(json)).toList();
      } else {
        String errorMessage = 'Server Error';
        throw ServerFailure(errorMessage, response.statusCode);
      }
    } catch (e) {
      if (e is FormatException) {
        throw ServerFailure('Invalid JSON response from server', 500);
      } else {
        throw ServerFailure('Failed to fetch exercises: ${e.toString()}', 500);
      }
    }
  }
}

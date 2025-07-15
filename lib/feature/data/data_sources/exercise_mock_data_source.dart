import 'dart:convert';
import 'package:aletha_fitness/feature/data/data_sources/exercise_data_source.dart';
import 'package:aletha_fitness/feature/data/model/exercise_model.dart';

class ExerciseMockDataSource implements ExerciseDataSource {
  @override
  Future<List<ExerciseModel>> getExercises() async {
    final List<dynamic> jsonList = json.decode('''
[
  {
    "name": "name 22",
    "description": "description 1",
    "duration": 79,
    "difficulty": "difficulty 1",
    "id": "1"
  },
  {
    "name": "name 2",
    "description": "description 2",
    "duration": 31,
    "difficulty": "difficulty 2",
    "id": "2"
  },
  {
    "name": "name 3",
    "description": "description 3",
    "duration": 89,
    "difficulty": "difficulty 3",
    "id": "3"
  },
  {
    "name": "name 4",
    "description": "description 4",
    "duration": 51,
    "difficulty": "difficulty 4",
    "id": "4"
  },
  {
    "name": "name 5",
    "description": "description 5",
    "duration": 70,
    "difficulty": "difficulty 5",
    "id": "5"
  },
  {
    "name": "name 6",
    "description": "description 6",
    "duration": 20,
    "difficulty": "difficulty 6",
    "id": "6"
  },
  {
    "name": "name 7",
    "description": "description 7",
    "duration": 6,
    "difficulty": "difficulty 7",
    "id": "7"
  }
]
    ''');

    return jsonList.map((json) => ExerciseModel.fromJson(json)).toList();
  }
}

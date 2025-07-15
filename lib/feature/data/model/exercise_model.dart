import 'package:aletha_fitness/feature/domain/entity/exercise.dart';

class ExerciseModel extends Exercise {
  const ExerciseModel({
    required super.id,
    required super.name,
    required String super.description,
    required super.duration,
    required super.difficulty,
  });

  factory ExerciseModel.fromJson(Map<String, dynamic> json) {
    return ExerciseModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      duration: json['duration'],
      difficulty: json['difficulty'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'duration': duration,
      'difficulty': difficulty,
    };
  }
}

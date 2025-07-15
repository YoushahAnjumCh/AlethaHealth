import 'package:equatable/equatable.dart';

class Exercise extends Equatable {
  final String id;
  final String name;
  final String? description;
  final int duration;
  final String difficulty;

  const Exercise({
    required this.id,
    required this.name,
    this.description,
    required this.duration,
    required this.difficulty,
  });

  @override
  List<Object?> get props => [id, name, description, duration, difficulty];
}

import 'package:json_annotation/json_annotation.dart';
part 'todo.g.dart';

@JsonSerializable()
class Todo {
  final String id;

  @JsonKey(name: "title")
  final String name;

  @JsonKey(name: "body")
  final String description;

  const Todo({required this.id, required this.name, required this.description});

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  Map<String, dynamic> toJson() => _$TodoToJson(this);
}

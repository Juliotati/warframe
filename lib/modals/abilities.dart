import 'package:json_annotation/json_annotation.dart';

part 'abilities.g.dart';

@JsonSerializable()
class Abilities {
  Abilities({required this.name, required this.description});

  factory Abilities.fromJson(Map<String, dynamic> json) =>
      _$AbilitiesFromJson(json);

  String name;
  String description;

  Map<String, dynamic> toJson() => _$AbilitiesToJson(this);
}

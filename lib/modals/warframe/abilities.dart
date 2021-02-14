import 'package:json_annotation/json_annotation.dart';

part 'abilities.g.dart';

@JsonSerializable()
class Abilities {
  String name;
  String description;

  Abilities({this.name, this.description});

  factory Abilities.fromJson(Map<String, dynamic> json) =>
      _$AbilitiesFromJson(json);

  Map<String, dynamic> toJson() => _$AbilitiesToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

import 'package:warframe/features/warframe_codex/domain/entities/warframe_abilities.dart';

part 'warframe_abilities_model.g.dart';

@JsonSerializable()
class AbilitiesModel extends Abilities {
  const AbilitiesModel({
    required this.name,
    required this.description,
  }) : super(
          name: name,
          description: description,
        );

  factory AbilitiesModel.fromJson(Map<String, dynamic> json) =>
      _$AbilitiesModelFromJson(json);

  final String name;
  final String description;

  Map<String, dynamic> toJson() => _$AbilitiesModelToJson(this);
}

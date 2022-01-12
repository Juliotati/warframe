import 'package:json_annotation/json_annotation.dart';
import 'package:warframe/features/warframe_codex/data/models/warframe_abilities_model.dart';
import 'package:warframe/features/warframe_codex/domain/entities/warframe.dart';

part 'warframe_model.g.dart';

@JsonSerializable(explicitToJson: true)
class WarframeModel extends Warframe {
  const WarframeModel({
    required this.uniqueName,
    required this.name,
    required this.description,
    required this.health,
    required this.shield,
    required this.armor,
    required this.power,
    this.category,
    this.masteryReq,
    this.sprintSpeed,
    this.passiveDescription,
    required this.abilities,
    this.imageName,
    this.polarities,
    this.sprint,
    required this.wikiaThumbnail,
    required this.wikiaUrl,
  }) : super(
          uniqueName: uniqueName,
          name: name,
          description: description,
          health: health,
          shield: shield,
          armor: armor,
          power: power,
          category: category,
          masteryReq: masteryReq,
          sprintSpeed: sprintSpeed,
          passiveDescription: passiveDescription,
          abilities: abilities,
          imageName: imageName,
          polarities: polarities,
          sprint: sprint,
          wikiaThumbnail: wikiaThumbnail,
          wikiaUrl: wikiaUrl,
        );

  factory WarframeModel.fromJson(Map<String, dynamic> json) {
    return _$WarframeModelFromJson(json);
  }

  final String uniqueName;
  final String name;
  final String description;
  final int health;
  final int shield;
  final int armor;
  final int power;
  final String? category;
  final int? masteryReq;
  final dynamic sprintSpeed;
  final String? passiveDescription;
  final List<AbilitiesModel> abilities;
  final String? imageName;
  final List<String>? polarities;
  final dynamic sprint;
  final String? wikiaThumbnail;
  final String? wikiaUrl;

  Map<String, dynamic> toJson() => _$WarframeModelToJson(this);
}

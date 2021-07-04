import 'package:json_annotation/json_annotation.dart';

import 'abilities.dart';

part 'warframe.g.dart';

@JsonSerializable(explicitToJson: true)
class Warframe {
  Warframe({
    required this.uniqueName,
    required this.name,
    required this.description,
    required this.health,
    required this.shield,
    required this.armor,
    required this.stamina,
    required this.power,
    this.masteryReq,
    this.sprintSpeed,
    this.passiveDescription,
    required this.abilities,
    this.imageName,
    required this.category,
    this.color,
    this.polarities,
    this.sex,
    this.sprint,
    this.wikiaThumbnail,
    required this.wikiaUrl,
  });

  factory Warframe.fromJson(Map<String, dynamic> json) =>
      _$WarframeFromJson(json);

  String uniqueName;
  String name;
  String description;
  int health;
  int shield;
  int armor;
  int stamina;
  int power;
  int? masteryReq;
  dynamic sprintSpeed;
  String? passiveDescription;
  List<Abilities> abilities;
  String? imageName;
  String category;
  int? color;
  List<String>? polarities;
  String? sex;
  dynamic sprint;
  String? wikiaThumbnail;
  String? wikiaUrl;

  Map<String, dynamic> toJson() => _$WarframeToJson(this);
}

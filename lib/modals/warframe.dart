import 'package:json_annotation/json_annotation.dart';

import 'abilities.dart';

part 'warframe.g.dart';

@JsonSerializable(explicitToJson: true)
class Warframe {
  Warframe({
    this.uniqueName,
    this.name,
    this.description,
    this.health,
    this.shield,
    this.armor,
    this.stamina,
    this.power,
    this.masteryReq,
    this.sprintSpeed,
    this.passiveDescription,
    this.abilities,
    this.imageName,
    this.category,
    this.color,
    this.polarities,
    this.sex,
    this.sprint,
    this.wikiaThumbnail,
    this.wikiaUrl,
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
  int masteryReq;
  dynamic sprintSpeed;
  String passiveDescription;
  List<Abilities> abilities;
  String imageName;
  String category;
  int color;
  List<String> polarities;
  String sex;
  dynamic sprint;
  String wikiaThumbnail;
  String wikiaUrl;

  Map<String, dynamic> toJson() => _$WarframeToJson(this);
}

import 'warframe_abilities.dart';

abstract class Frame {
  const Frame({
    required this.uniqueName,
    required this.name,
    required this.description,
    this.health,
    this.shield,
    this.armor,
    this.masteryReq,
    this.sprintSpeed,
    this.passiveDescription,
    this.abilities,
    this.imageName,
    this.polarities,
    required this.wikiaThumbnail,
    required this.wikiaUrl,
  }) : super();

  final String uniqueName;
  final String name;
  final String description;
  final int? health;
  final int? shield;
  final int? armor;
  final int? masteryReq;
  final dynamic sprintSpeed;
  final String? passiveDescription;
  final List<Abilities>? abilities;
  final String? imageName;
  final List<String>? polarities;
  final String? wikiaThumbnail;
  final String? wikiaUrl;
}

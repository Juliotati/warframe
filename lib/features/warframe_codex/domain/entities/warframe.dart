import 'package:equatable/equatable.dart';
import 'package:warframe/features/warframe_codex/domain/entities/frame.dart';

import 'package:warframe/features/warframe_codex/domain/entities/warframe_abilities.dart';

abstract class Warframe extends Equatable implements Frame {
  const Warframe({
    required this.uniqueName,
    required this.name,
    required this.description,
    required this.health,
    required this.shield,
    required this.armor,
    required this.power,
    this.masteryReq,
    this.sprintSpeed,
    this.passiveDescription,
    required this.abilities,
    this.category,
    this.imageName,
    this.polarities,
    this.sprint,
    required this.wikiaThumbnail,
    required this.wikiaUrl,
  }) : super();

  @override
  final String uniqueName;
  @override
  final String name;
  @override
  final String description;
  @override
  final int health;
  @override
  final int shield;
  @override
  final int armor;
  final int power;
  final String? category;
  @override
  final int? masteryReq;
  @override
  final dynamic sprintSpeed;
  @override
  final String? passiveDescription;
  @override
  final List<Abilities> abilities;
  @override
  final String? imageName;
  @override
  final List<String>? polarities;
  final dynamic sprint;
  @override
  final String? wikiaThumbnail;
  @override
  final String? wikiaUrl;

  @override
  List<Object?> get props {
    return <dynamic>[
      uniqueName,
      name,
      description,
      health,
      shield,
      armor,
      power,
      category,
      masteryReq,
      sprintSpeed,
      passiveDescription,
      abilities,
      imageName,
      polarities,
      sprint,
      wikiaThumbnail,
      wikiaUrl,
    ];
  }
}

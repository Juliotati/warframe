import 'package:equatable/equatable.dart';
import 'weapon.dart';

abstract class MeleeWeapon extends Equatable implements Weapon {
  const MeleeWeapon(
    {
    required this.name,
    required this.uniqueName,
    required this.type,
    required this.description,
    required this.disposition,
    required this.wikiaUrl,
    required this.wikiaThumbnail,
    required this.criticalChance,
    required this.criticalMultiplier,
    required this.comboDuration,
    required this.followThrough,
    required this.range,
    required this.totalDamage,
    required this.masteryReq,
    required this.blockingAngle,
    required this.attackSpeed,
    required this.slamAttack,
    required this.slamRadius,
    required this.slamRadialDamage,
    required this.heavyAttackDamage,
    required this.heavySlamAttack,
    required this.heavySlamRadialDamage,
    required this.heavySlamRadius,
    required this.damageTypes,
  }) : super();

  @override
  final String name;
  @override
  final String uniqueName;
  @override
  final String type;
  @override
  final String description;
  @override
  final int? disposition;
  @override
  final String? wikiaUrl;
  @override
  final String? wikiaThumbnail;
  @override
  final num? criticalChance;
  @override
  final num? criticalMultiplier;
  @override
  final num? totalDamage;
  @override
  final int? masteryReq;
  @override
  final Map<String, dynamic>? damageTypes;
  final num? range;
  final num? comboDuration;
  final num? followThrough;
  final num? blockingAngle;
  final double? attackSpeed;
  final num? slamRadius;
  final num? slamAttack;
  final num? slamRadialDamage;
  final num? heavyAttackDamage;
  final num? heavySlamAttack;
  final num? heavySlamRadialDamage;
  final num? heavySlamRadius;
}

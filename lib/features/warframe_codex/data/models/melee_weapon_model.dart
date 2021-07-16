import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/melee_weapon.dart';

part 'melee_weapon_model.g.dart';

@JsonSerializable(explicitToJson: true)
class MeleeWeaponModel extends MeleeWeapon {
  const MeleeWeaponModel({
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
    required this.slamRadius,
    required this.slamAttack,
    required this.slamRadialDamage,
    required this.heavyAttackDamage,
    required this.heavySlamAttack,
    required this.heavySlamRadialDamage,
    required this.heavySlamRadius,
    required this.damageTypes,
  }) : super(
          name: name,
          uniqueName: uniqueName,
          type: type,
          description: description,
          disposition: disposition,
          wikiaUrl: wikiaUrl,
          wikiaThumbnail: wikiaThumbnail,
          criticalChance: criticalChance,
          criticalMultiplier: criticalMultiplier,
          comboDuration: comboDuration,
          followThrough: followThrough,
          range: range,
          totalDamage: totalDamage,
          masteryReq: masteryReq,
          blockingAngle: blockingAngle,
          attackSpeed: attackSpeed,
          slamRadius: slamRadius,
          slamAttack: slamAttack,
          slamRadialDamage: slamRadialDamage,
          heavyAttackDamage: heavyAttackDamage,
          heavySlamAttack: heavySlamAttack,
          heavySlamRadialDamage: heavySlamRadialDamage,
          heavySlamRadius: heavySlamRadius,
          damageTypes: damageTypes,
        );

  factory MeleeWeaponModel.fromJson(Map<String, dynamic> json) =>
      _$MeleeWeaponModelFromJson(json);

  final String name;
  final String uniqueName;
  final String type;
  final String description;
  final int? disposition;
  final String? wikiaUrl;
  final String? wikiaThumbnail;
  final num? criticalChance;
  final num? criticalMultiplier;
  final num? comboDuration;
  final num? followThrough;
  final num? range;
  final num? totalDamage;
  final int? masteryReq;
  final Map<String, dynamic>? damageTypes;
  final num? blockingAngle;
  final double? attackSpeed;
  final num? slamRadius;
  final num? slamAttack;
  final num? slamRadialDamage;
  final num? heavyAttackDamage;
  final num? heavySlamAttack;
  final num? heavySlamRadialDamage;
  final num? heavySlamRadius;

  Map<String, dynamic> toJson() => _$MeleeWeaponModelToJson(this);

  @override
  List<Object?> get props => [
        name,
        uniqueName,
        type,
        wikiaUrl,
        wikiaThumbnail,
        description,
        disposition,
        criticalChance,
        criticalMultiplier,
        comboDuration,
        followThrough,
        range,
        totalDamage,
        masteryReq,
        blockingAngle,
        attackSpeed,
        slamAttack,
        slamRadius,
        slamRadialDamage,
        heavyAttackDamage,
        heavyAttackDamage,
        heavySlamAttack,
        heavySlamRadialDamage,
        heavySlamRadius,
        damageTypes,
      ];
}

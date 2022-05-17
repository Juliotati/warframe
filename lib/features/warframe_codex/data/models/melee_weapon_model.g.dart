// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'melee_weapon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeleeWeaponModel _$MeleeWeaponModelFromJson(Map<String, dynamic> json) =>
    MeleeWeaponModel(
      name: json['name'] as String,
      uniqueName: json['uniqueName'] as String,
      type: json['type'] as String,
      description: json['description'] as String,
      disposition: json['disposition'] as int?,
      wikiaUrl: json['wikiaUrl'] as String?,
      wikiaThumbnail: json['wikiaThumbnail'] as String?,
      criticalChance: json['criticalChance'] as num?,
      criticalMultiplier: json['criticalMultiplier'] as num?,
      comboDuration: json['comboDuration'] as num?,
      followThrough: json['followThrough'] as num?,
      range: json['range'] as num?,
      totalDamage: json['totalDamage'] as num?,
      masteryReq: json['masteryReq'] as int?,
      blockingAngle: json['blockingAngle'] as num?,
      attackSpeed: (json['attackSpeed'] as num?)?.toDouble(),
      slamRadius: json['slamRadius'] as num?,
      slamAttack: json['slamAttack'] as num?,
      slamRadialDamage: json['slamRadialDamage'] as num?,
      heavyAttackDamage: json['heavyAttackDamage'] as num?,
      heavySlamAttack: json['heavySlamAttack'] as num?,
      heavySlamRadialDamage: json['heavySlamRadialDamage'] as num?,
      heavySlamRadius: json['heavySlamRadius'] as num?,
      damageTypes: json['damageTypes'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$MeleeWeaponModelToJson(MeleeWeaponModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'uniqueName': instance.uniqueName,
      'type': instance.type,
      'description': instance.description,
      'disposition': instance.disposition,
      'wikiaUrl': instance.wikiaUrl,
      'wikiaThumbnail': instance.wikiaThumbnail,
      'criticalChance': instance.criticalChance,
      'criticalMultiplier': instance.criticalMultiplier,
      'comboDuration': instance.comboDuration,
      'followThrough': instance.followThrough,
      'range': instance.range,
      'totalDamage': instance.totalDamage,
      'masteryReq': instance.masteryReq,
      'damageTypes': instance.damageTypes,
      'blockingAngle': instance.blockingAngle,
      'attackSpeed': instance.attackSpeed,
      'slamRadius': instance.slamRadius,
      'slamAttack': instance.slamAttack,
      'slamRadialDamage': instance.slamRadialDamage,
      'heavyAttackDamage': instance.heavyAttackDamage,
      'heavySlamAttack': instance.heavySlamAttack,
      'heavySlamRadialDamage': instance.heavySlamRadialDamage,
      'heavySlamRadius': instance.heavySlamRadius,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weapon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeaponModel _$WeaponModelFromJson(Map<String, dynamic> json) => WeaponModel(
      name: json['name'] as String,
      uniqueName: json['uniqueName'] as String,
      type: json['type'] as String,
      description: json['description'] as String,
      disposition: json['disposition'] as int?,
      wikiaUrl: json['wikiaUrl'] as String?,
      wikiaThumbnail: json['wikiaThumbnail'] as String?,
      criticalChance: json['criticalChance'] as num?,
      criticalMultiplier: json['criticalMultiplier'] as num?,
      totalDamage: json['totalDamage'] as num?,
      masteryReq: json['masteryReq'] as int?,
      damageTypes: json['damageTypes'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$WeaponModelToJson(WeaponModel instance) =>
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
      'totalDamage': instance.totalDamage,
      'masteryReq': instance.masteryReq,
      'damageTypes': instance.damageTypes,
    };

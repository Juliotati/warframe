// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weapon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeaponModel _$WeaponModelFromJson(Map<String, dynamic> json) {
  return WeaponModel(
    uniqueName: json['uniqueName'] as String,
    name: json['name'] as String,
    description: json['description'] as String,
    type: json['type'] as String,
    masteryReq: json['masteryReq'] as int?,
    disposition: json['disposition'] as int?,
    wikiaThumbnail: json['wikiaThumbnail'] as String?,
    wikiaUrl: json['wikiaUrl'] as String?,
    criticalChance: json['criticalChance'] as num?,
    criticalMultiplier: json['criticalMultiplier'] as num?,
    totalDamage: json['totalDamage'] as num?,
    damageTypes: json['damageTypes'] as Map<String, dynamic>?,
  );
}

Map<String, dynamic> _$WeaponModelToJson(WeaponModel instance) =>
    <String, dynamic>{
      'uniqueName': instance.uniqueName,
      'name': instance.name,
      'type': instance.type,
      'description': instance.description,
      'disposition': instance.disposition,
      'masteryReq': instance.masteryReq,
      'wikiaThumbnail': instance.wikiaThumbnail,
      'wikiaUrl': instance.wikiaUrl,
      'criticalChance': instance.criticalChance,
      'criticalMultiplier': instance.criticalMultiplier,
      'totalDamage': instance.totalDamage,
      'damageTypes': instance.damageTypes,
    };

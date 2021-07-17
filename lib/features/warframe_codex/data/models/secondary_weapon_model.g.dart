// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'secondary_weapon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SecondaryWeaponModel _$SecondaryWeaponModelFromJson(Map<String, dynamic> json) {
  return SecondaryWeaponModel(
    name: json['name'] as String,
    uniqueName: json['uniqueName'] as String,
    type: json['type'] as String,
    description: json['description'] as String,
    disposition: json['disposition'] as int?,
    wikiaUrl: json['wikiaUrl'] as String?,
    wikiaThumbnail: json['wikiaThumbnail'] as String?,
    trigger: json['trigger'] as String?,
    criticalChance: json['criticalChance'] as num?,
    criticalMultiplier: json['criticalMultiplier'] as num?,
    fireRate: json['fireRate'] as num?,
    totalDamage: json['totalDamage'] as num?,
    masteryReq: json['masteryReq'] as int?,
    accuracy: json['accuracy'] as num?,
    noise: json['noise'] as String?,
    ammo: json['ammo'] as num?,
    magazineSize: json['magazineSize'] as int?,
    reloadTime: json['reloadTime'] as num?,
    damageTypes: json['damageTypes'] as Map<String, dynamic>?,
  );
}

Map<String, dynamic> _$SecondaryWeaponModelToJson(SecondaryWeaponModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'uniqueName': instance.uniqueName,
      'type': instance.type,
      'description': instance.description,
      'disposition': instance.disposition,
      'wikiaUrl': instance.wikiaUrl,
      'wikiaThumbnail': instance.wikiaThumbnail,
      'trigger': instance.trigger,
      'criticalChance': instance.criticalChance,
      'criticalMultiplier': instance.criticalMultiplier,
      'fireRate': instance.fireRate,
      'totalDamage': instance.totalDamage,
      'masteryReq': instance.masteryReq,
      'accuracy': instance.accuracy,
      'noise': instance.noise,
      'ammo': instance.ammo,
      'magazineSize': instance.magazineSize,
      'reloadTime': instance.reloadTime,
      'damageTypes': instance.damageTypes,
    };

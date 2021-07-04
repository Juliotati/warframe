// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weapon_primary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrimaryWeapon _$PrimaryWeaponFromJson(Map<String, dynamic> json) {
  return PrimaryWeapon(
    name: json['name'] as dynamic,
    category: json['category'] as dynamic,
    type: json['type'] as dynamic,
    description: json['description'] as dynamic,
    wikiaUrl: json['wikiaUrl'] as dynamic,
    wikiaThumbnail: json['wikiaThumbnail'] as dynamic,
    trigger: json['trigger'] as dynamic,
    criticalChance: json['criticalChance'] as dynamic,
    criticalMultiplier: json['criticalMultiplier'] as dynamic,
    fireRate: json['fireRate'] as dynamic,
    damage: json['damage'] as dynamic,
    totalDamage: json['totalDamage'] as dynamic,
    masteryReq: json['masteryReq'] as dynamic,
    accuracy: json['accuracy'] as dynamic,
    noise: json['noise'] as dynamic,
    ammo: json['ammo'] as dynamic,
    magazineSize: json['magazineSize'] as dynamic,
    reloadTime: json['reloadTime'] as dynamic,
    damageTypes: json['damageTypes'] as Map<String, dynamic>?,
  );
}

Map<String, dynamic> _$PrimaryWeaponToJson(PrimaryWeapon instance) =>
    <String, dynamic>{
      'name': instance.name,
      'category': instance.category,
      'type': instance.type,
      'description': instance.description,
      'wikiaUrl': instance.wikiaUrl,
      'wikiaThumbnail': instance.wikiaThumbnail,
      'trigger': instance.trigger,
      'criticalChance': instance.criticalChance,
      'criticalMultiplier': instance.criticalMultiplier,
      'fireRate': instance.fireRate,
      'damage': instance.damage,
      'totalDamage': instance.totalDamage,
      'masteryReq': instance.masteryReq,
      'accuracy': instance.accuracy,
      'noise': instance.noise,
      'ammo': instance.ammo,
      'magazineSize': instance.magazineSize,
      'reloadTime': instance.reloadTime,
      'damageTypes': instance.damageTypes,
    };

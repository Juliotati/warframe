// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gun_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GunModel _$GunModelFromJson(Map<String, dynamic> json) => GunModel(
      name: json['name'] as String,
      uniqueName: json['uniqueName'] as String,
      type: json['type'] as String,
      description: json['description'] as String,
      disposition: json['disposition'] as int?,
      category: json['category'] as String?,
      wikiaUrl: json['wikiaUrl'] as String?,
      wikiaThumbnail: json['wikiaThumbnail'] as String?,
      trigger: json['trigger'] as String?,
      criticalChance: json['criticalChance'] as num?,
      criticalMultiplier: json['criticalMultiplier'] as num?,
      fireRate: json['fireRate'] as num?,
      totalDamage: json['totalDamage'] as num?,
      masteryReq: json['masteryReq'] as int?,
      accuracy: json['accuracy'] as num?,
      sentinel: json['sentinel'] as bool?,
      noise: json['noise'] as String?,
      ammo: json['ammo'] as num?,
      magazineSize: json['magazineSize'] as int?,
      reloadTime: json['reloadTime'] as num?,
      damageTypes: json['damageTypes'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$GunModelToJson(GunModel instance) => <String, dynamic>{
      'name': instance.name,
      'uniqueName': instance.uniqueName,
      'type': instance.type,
      'description': instance.description,
      'disposition': instance.disposition,
      'category': instance.category,
      'wikiaUrl': instance.wikiaUrl,
      'wikiaThumbnail': instance.wikiaThumbnail,
      'trigger': instance.trigger,
      'criticalChance': instance.criticalChance,
      'criticalMultiplier': instance.criticalMultiplier,
      'fireRate': instance.fireRate,
      'totalDamage': instance.totalDamage,
      'masteryReq': instance.masteryReq,
      'accuracy': instance.accuracy,
      'sentinel': instance.sentinel,
      'noise': instance.noise,
      'ammo': instance.ammo,
      'magazineSize': instance.magazineSize,
      'reloadTime': instance.reloadTime,
      'damageTypes': instance.damageTypes,
    };

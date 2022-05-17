// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warframe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarframeModel _$WarframeModelFromJson(Map<String, dynamic> json) =>
    WarframeModel(
      uniqueName: json['uniqueName'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      health: json['health'] as int,
      shield: json['shield'] as int,
      armor: json['armor'] as int,
      power: json['power'] as int,
      category: json['category'] as String?,
      masteryReq: json['masteryReq'] as int?,
      sprintSpeed: json['sprintSpeed'],
      passiveDescription: json['passiveDescription'] as String?,
      abilities: (json['abilities'] as List<dynamic>)
          .map((e) => AbilitiesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      imageName: json['imageName'] as String?,
      polarities: (json['polarities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      sprint: json['sprint'],
      wikiaThumbnail: json['wikiaThumbnail'] as String?,
      wikiaUrl: json['wikiaUrl'] as String?,
    );

Map<String, dynamic> _$WarframeModelToJson(WarframeModel instance) =>
    <String, dynamic>{
      'uniqueName': instance.uniqueName,
      'name': instance.name,
      'description': instance.description,
      'health': instance.health,
      'shield': instance.shield,
      'armor': instance.armor,
      'power': instance.power,
      'category': instance.category,
      'masteryReq': instance.masteryReq,
      'sprintSpeed': instance.sprintSpeed,
      'passiveDescription': instance.passiveDescription,
      'abilities': instance.abilities.map((e) => e.toJson()).toList(),
      'imageName': instance.imageName,
      'polarities': instance.polarities,
      'sprint': instance.sprint,
      'wikiaThumbnail': instance.wikiaThumbnail,
      'wikiaUrl': instance.wikiaUrl,
    };

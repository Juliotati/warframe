// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warframe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Warframe _$WarframeFromJson(Map<String, dynamic> json) {
  return Warframe(
    uniqueName: json['uniqueName'] as String,
    name: json['name'] as String,
    description: json['description'] as String,
    health: json['health'] as int,
    shield: json['shield'] as int,
    armor: json['armor'] as int,
    stamina: json['stamina'] as int,
    power: json['power'] as int,
    masteryReq: json['masteryReq'] as int,
    sprintSpeed: json['sprintSpeed'],
    passiveDescription: json['passiveDescription'] as String,
    abilities: (json['abilities'] as List)
        ?.map((e) =>
            e == null ? null : Abilities.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    imageName: json['imageName'] as String,
    category: json['category'] as String,
    color: json['color'] as int,
    polarities: (json['polarities'] as List)?.map((e) => e as String)?.toList(),
    sex: json['sex'] as String,
    sprint: json['sprint'],
    wikiaThumbnail: json['wikiaThumbnail'] as String,
    wikiaUrl: json['wikiaUrl'] as String,
  );
}

Map<String, dynamic> _$WarframeToJson(Warframe instance) => <String, dynamic>{
      'uniqueName': instance.uniqueName,
      'name': instance.name,
      'description': instance.description,
      'health': instance.health,
      'shield': instance.shield,
      'armor': instance.armor,
      'stamina': instance.stamina,
      'power': instance.power,
      'masteryReq': instance.masteryReq,
      'sprintSpeed': instance.sprintSpeed,
      'passiveDescription': instance.passiveDescription,
      'abilities': instance.abilities?.map((e) => e?.toJson())?.toList(),
      'imageName': instance.imageName,
      'category': instance.category,
      'color': instance.color,
      'polarities': instance.polarities,
      'sex': instance.sex,
      'sprint': instance.sprint,
      'wikiaThumbnail': instance.wikiaThumbnail,
      'wikiaUrl': instance.wikiaUrl,
    };

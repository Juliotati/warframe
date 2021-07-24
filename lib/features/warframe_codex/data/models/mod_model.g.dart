// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mod_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModModel _$ModModelFromJson(Map<String, dynamic> json) {
  return ModModel(
    baseDrain: json['baseDrain'] as int,
    category: json['category'] as String,
    compatName: json['compatName'] as String?,
    fusionLimit: json['fusionLimit'] as int?,
    name: json['name'] as String,
    polarity: json['polarity'] as String,
    rarity: json['rarity'] as String,
    type: json['type'] as String,
    uniqueName: json['uniqueName'] as String,
    wikiaThumbnail: json['wikiaThumbnail'] as String?,
    wikiaUrl: json['wikiaUrl'] as String?,
  );
}

Map<String, dynamic> _$ModModelToJson(ModModel instance) => <String, dynamic>{
      'baseDrain': instance.baseDrain,
      'category': instance.category,
      'compatName': instance.compatName,
      'fusionLimit': instance.fusionLimit,
      'name': instance.name,
      'polarity': instance.polarity,
      'rarity': instance.rarity,
      'type': instance.type,
      'uniqueName': instance.uniqueName,
      'wikiaThumbnail': instance.wikiaThumbnail,
      'wikiaUrl': instance.wikiaUrl,
    };

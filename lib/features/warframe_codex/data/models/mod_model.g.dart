// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mod_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModModel _$ModModelFromJson(Map<String, dynamic> json) {
  return ModModel(
    baseDrain: json['baseDrain'] as int?,
    category: json['category'] as String?,
    compatName: json['compatName'] as String?,
    fufionLimit: json['fufionLimit'] as int?,
    name: json['name'] as String?,
    polarity: json['polarity'] as String?,
    rarity: json['rarity'] as String?,
    type: json['type'] as String?,
    wikiaThumbnail: json['wikiaThumbnail'] as String?,
    wikiaUrl: json['wikiaUrl'] as String?,
  );
}

Map<String, dynamic> _$ModModelToJson(ModModel instance) => <String, dynamic>{
      'baseDrain': instance.baseDrain,
      'category': instance.category,
      'compatName': instance.compatName,
      'fufionLimit': instance.fufionLimit,
      'name': instance.name,
      'polarity': instance.polarity,
      'rarity': instance.rarity,
      'type': instance.type,
      'wikiaThumbnail': instance.wikiaThumbnail,
      'wikiaUrl': instance.wikiaUrl,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warframe_news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarframeNewsModel _$WarframeNewsModelFromJson(Map<String, dynamic> json) {
  return WarframeNewsModel(
    id: json['id'] as String,
    message: json['message'] as String,
    link: json['link'] as String,
    date: json['date'] as String,
    imageLink: json['imageLink'] as String,
  );
}

Map<String, dynamic> _$WarframeNewsModelToJson(WarframeNews instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'link': instance.link,
      'date': instance.date,
      'imageLink': instance.imageLink,
    };

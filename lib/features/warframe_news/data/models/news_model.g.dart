// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsModel _$WarframeNewsModelFromJson(Map<String, dynamic> json) {
  return NewsModel(
    id: json['id'] as String,
    message: json['message'] as String,
    link: json['link'] as String,
    date: json['date'] as String,
    imageLink: json['imageLink'] as String,
  );
}

Map<String, dynamic> _$WarframeNewsModelToJson(News instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'link': instance.link,
      'date': instance.date,
      'imageLink': instance.imageLink,
    };

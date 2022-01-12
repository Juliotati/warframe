import 'package:json_annotation/json_annotation.dart';
import 'package:warframe/features/warframe_news/domain/entities/news.dart';

part 'news.g.dart';

@JsonSerializable(explicitToJson: true)
class NewsModel extends News {
  const NewsModel({
    required this.id,
    required this.message,
    required this.link,
    required this.date,
    required this.imageLink,
  }) : super(
          id: id,
          message: message,
          link: link,
          date: date,
          imageLink: imageLink,
        );

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return _$WarframeNewsModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$WarframeNewsModelToJson(this);
  }

  final String id;
  final String message;
  final String link;
  final String date;
  final String imageLink;
}

import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/warframe_news.dart';

part 'warframe_news.g.dart';

@JsonSerializable(explicitToJson: true)
class WarframeNewsModel extends WarframeNews {
  const WarframeNewsModel({
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

  factory WarframeNewsModel.fromJson(Map<String, dynamic> json) {
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

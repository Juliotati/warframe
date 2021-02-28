import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';

@JsonSerializable(explicitToJson: true)
class WarframeNews {
  const WarframeNews({
    this.id,
    this.message,
    this.link,
    this.date,
    this.imageLink,
  });

  factory WarframeNews.fromJson(Map<String, dynamic> json) => _$WarframeNewsFromJson(json);

  final String id;
  final String message;
  final String link;
  final String date;
  final String imageLink;


  Map<String, dynamic> toJson() => _$WarframeNewsToJson(this);
}

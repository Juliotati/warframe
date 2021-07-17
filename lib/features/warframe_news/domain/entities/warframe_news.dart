import 'package:equatable/equatable.dart';

class WarframeNews extends Equatable {
  const WarframeNews({
    required this.id,
    required this.message,
    required this.link,
    required this.date,
    required this.imageLink,
  }) : super();

  final String id;
  final String message;
  final String link;
  final String date;
  final String imageLink;

  @override
  List<Object?> get props => <String>[id, message, link, date, imageLink];
}

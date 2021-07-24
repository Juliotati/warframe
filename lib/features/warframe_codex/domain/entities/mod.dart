import 'package:equatable/equatable.dart';

abstract class Mod extends Equatable {
  const Mod({
    required this.baseDrain,
    required this.category,
    required this.compatName,
    required this.fusionLimit,
    required this.name,
    required this.polarity,
    required this.rarity,
    required this.type,
    required this.uniqueName,
    required this.wikiaThumbnail,
    required this.wikiaUrl,
  });

  final int baseDrain;
  final String category;
  final String? compatName;
  final int? fusionLimit;
  final String name;
  final String polarity;
  final String rarity;
  final String type;
  final String uniqueName;
  final String? wikiaThumbnail;
  final String? wikiaUrl;
}

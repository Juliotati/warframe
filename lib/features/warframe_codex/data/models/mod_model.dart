import 'package:json_annotation/json_annotation.dart';
import 'package:warframe/features/warframe_codex/domain/entities/mod.dart';

part 'mod_model.g.dart';

@JsonSerializable()
class ModModel extends Mod {
  const ModModel({
    required this.baseDrain,
    required this.category,
    required this.compatName,
    required this.fufionLimit,
    required this.name,
    required this.polarity,
    required this.rarity,
    required this.type,
    required this.wikiaThumbnail,
    required this.wikiaUrl,
  }) : super(
          baseDrain: baseDrain,
          category: category,
          compatName: compatName,
          fufionLimit: fufionLimit,
          name: name,
          polarity: polarity,
          rarity: rarity,
          type: type,
          wikiaThumbnail: wikiaThumbnail,
          wikiaUrl: wikiaUrl,
        );

  factory ModModel.fromJson(Map<String, dynamic> json) {
    return _$ModModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ModModelToJson(this);

  final int? baseDrain;
  final String? category;
  final String? compatName;
  final int? fufionLimit;
  final String? name;
  final String? polarity;
  final String? rarity;
  final String? type;
  final String? wikiaThumbnail;
  final String? wikiaUrl;
}
